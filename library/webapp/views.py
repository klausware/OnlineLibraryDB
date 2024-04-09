#from django.shortcuts import render
from django.shortcuts import render, redirect, get_object_or_404
from django.db import OperationalError, transaction, connection
from datetime import datetime
from datetime import date
from .models import Book
from .forms import BookForm
from .models import Author
from .forms import AuthorForm
from .models import Member
from .forms import MemberForm
from .forms import Borrowing
from .forms import BorrowingForm
from .forms import Review
from .forms import ReviewForm
from .forms import Publisher
from .forms import PublisherForm
from .models import CombinedBookDetails
from .models import BookBorrowingReview
from .models import BorrowingArchive
from .forms import EditReturnDateForm

# Create your views here.

# Read operation: List all books
'''
def book_list(request):
    books = Book.objects.all()

    # Search by Author
    author_name = request.GET.get('author_name')
    if author_name:
        books = books.filter(author__name__icontains=author_name)

    # Search by Title
    book_title = request.GET.get('book_title')
    if book_title:
        books = books.filter(title__icontains=book_title)

    # Filter by Publication Date
    pub_date_before = request.GET.get('pub_date_before')
    pub_date_after = request.GET.get('pub_date_after')
    if pub_date_before:
        books = books.filter(publication_date__lte=pub_date_before)
    if pub_date_after:
        books = books.filter(publication_date__gte=pub_date_after)

    return render(request, 'webapp/book_list.html', {'books': books})
'''
# Create operation: Add a new book
def book_create(request):
    if request.method == 'POST':
        form = BookForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('book_list')
    else:
        form = BookForm()
    return render(request, 'webapp/book_form.html', {'form': form})

# Update operation: Edit an existing book
def book_edit(request, pk):
    book = get_object_or_404(Book, pk=pk)
    if request.method == "POST":
        form = BookForm(request.POST, instance=book)
        if form.is_valid():
            form.save()
            return redirect('book_list')
    else:
        form = BookForm(instance=book)
    return render(request, 'webapp/book_form.html', {'form': form})

# Delete operation: Delete a book
def book_delete(request, pk):
    book = get_object_or_404(Book, pk=pk)
    if request.method == 'POST':
        book.delete()
        return redirect('book_list')
    return render(request, 'webapp/book_confirm_delete.html', {'book': book})

def author_list(request):
    authors = Author.objects.all()
    return render(request, 'webapp/author_list.html', {'authors': authors})

def add_author(request):
    if request.method == 'POST':
        form = AuthorForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('author_list')  # Redirect to the author list page after saving
    else:
        form = AuthorForm()  # An empty, unbound form
    return render(request, 'webapp/add_author.html', {'form': form})

def edit_author(request, author_id):
    author = get_object_or_404(Author, id=author_id)
    if request.method == 'POST':
        form = AuthorForm(request.POST, instance=author)
        if form.is_valid():
            form.save()
            return redirect('author_list')
    else:
        form = AuthorForm(instance=author)
    return render(request, 'webapp/edit_author.html', {'form': form, 'author': author})

def delete_author(request, author_id):
    author = get_object_or_404(Author, id=author_id)
    if request.method == 'POST':
        author.delete()
        return redirect('author_list')
    return render(request, 'webapp/confirm_delete_author.html', {'author': author})


def get_total_books_borrowed(member_id, start_date, end_date):
    with connection.cursor() as cursor:
        cursor.execute("SELECT total_books_borrowed_by_member(%s, %s, %s)", [member_id, start_date, end_date])
        result = cursor.fetchone()
    return result[0] if result else 0


def member_list(request):
    # Fetching start_date and end_date from GET parameters
    start_date_str = request.GET.get('start_date')
    end_date_str = request.GET.get('end_date')

    # Convert from 'yyyy-mm-dd' to 'yyyy-mm-dd' if the data is present
    if start_date_str:
        try:
            # Trying to match the format from the URL.
            start_date = datetime.strptime(start_date_str, '%Y-%m-%d').strftime('%Y-%m-%d')
        except ValueError:
            # If there is a ValueError, then set a default start date or handle it differently
            start_date = '1900-01-01'  # default start date
    else:
        start_date = '1900-01-01'  # default start date

    if end_date_str:
        try:
            # Same as for start date, but for end date.
            end_date = datetime.strptime(end_date_str, '%Y-%m-%d').strftime('%Y-%m-%d')
        except ValueError:
            # Default to today's date if there is an error
            end_date = datetime.today().strftime('%Y-%m-%d')  # default end date
    else:
        end_date = datetime.today().strftime('%Y-%m-%d')  # default end date


    members = Member.objects.all()
    for member in members:
       member.total_books_borrowed = get_total_books_borrowed(member.id, start_date, end_date)         
    return render(request, 'webapp/member_list.html', {'members': members, 'start_date': start_date, 'end_date': end_date})

"""
def add_member(request):
    if request.method == 'POST':
        form = MemberForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('member_list')  # Assuming you have a member_list view
    else:
        form = MemberForm()
    return render(request, 'webapp/add_member.html', {'form': form})
"""
# Using Stored Procedure
def add_member(request):
    if request.method == 'POST':
        form = MemberForm(request.POST)
        if form.is_valid():
            # Extract data from form
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            join_date = date.today()  

            # Call stored procedure
            with connection.cursor() as cursor:
                cursor.callproc('register_new_member', [name, email, join_date])

            return redirect('member_list')  
    else:
        form = MemberForm()

    return render(request, 'webapp/add_member.html', {'form': form})


def edit_member(request, pk):
    member = get_object_or_404(Member, pk=pk)
    if request.method == 'POST':
        form = MemberForm(request.POST, instance=member)
        if form.is_valid():
            form.save()
            return redirect('member_list')
    else:
        form = MemberForm(instance=member)
    return render(request, 'webapp/edit_member.html', {'form': form})


def borrowing_list(request):
    borrowings = Borrowing.objects.all()
    return render(request, 'webapp/borrowing_list.html', {'borrowings': borrowings})

#def add_borrowing(request):
#    if request.method == 'POST':
#        form = BorrowingForm(request.POST)
#        if form.is_valid():
#            form.save()
#            return redirect('borrowing_list')
#    else:
#        form = BorrowingForm()
#    return render(request, 'webapp/add_borrowing.html', {'form': form})

# With Borrowing Limit Exceeded Trigger
def add_borrowing(request):
    if request.method == 'POST':
        form = BorrowingForm(request.POST)
        if form.is_valid():
            try:
                with transaction.atomic():
                    form.save()
                    return redirect('borrowing_list')  # Redirect to the borrowing list page
            except OperationalError as e:
                # Check if the error is because of the borrowing limit
                if 'Borrowing limit exceeded' in str(e):
                    form.add_error(None, 'You have exceeded your borrowing limit for the week.')
                else:
                    form.add_error(None, 'An unexpected error occurred. Please try again later.')
    else:
        form = BorrowingForm()
    return render(request, 'webapp/add_borrowing.html', {'form': form})


def review_list(request):
    reviews = Review.objects.all()
    return render(request, 'webapp/review_list.html', {'reviews': reviews})

def add_review(request):
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('review_list')
    else:
        form = ReviewForm()
    return render(request, 'webapp/add_review.html', {'form': form})

def publisher_list(request):
    publishers = Publisher.objects.all()
    return render(request, 'webapp/publisher_list.html', {'publishers': publishers})

def add_publisher(request):
    if request.method == 'POST':
        form = PublisherForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('publisher_list')
    else:
        form = PublisherForm()
    return render(request, 'webapp/add_publisher.html', {'form': form})

# VIEWS

def combined_book_list(request):
    combined_books = CombinedBookDetails.objects.all()
    return render(request, 'webapp/combined_book_list.html', {'combined_books': combined_books})

def book_borrowing_review_list(request):
    books_reviews = BookBorrowingReview.objects.all()
    #print(str(books_reviews.query))
    return render(request, 'webapp/borrowers_and_reviews.html', {'books_reviews': books_reviews})

def edit_return_date(request, borrowing_id):
    borrowing = get_object_or_404(Borrowing, pk=borrowing_id)
    if request.method == 'POST':
        form = EditReturnDateForm(request.POST, instance=borrowing)
        if form.is_valid():
            form.save()
            return redirect('borrowing_list')
    else:
        form = EditReturnDateForm(instance=borrowing)
    return render(request, 'webapp/edit_return_date.html', {'form': form})

# PROCEDURES

def return_book(request, borrowing_id):
    if request.method == 'GET':
        with connection.cursor() as cursor:
            cursor.execute("UPDATE webapp_borrowing SET return_date = NOW() WHERE id = %s", [borrowing_id])
        return redirect('borrowing_list')  

# TRIGGERS
    
def archived_borrowings(request):
    archives = BorrowingArchive.objects.all()
    return render(request, 'webapp/archived_borrowings.html', {'archives': archives})
    
# FUNCTIONS
    
def book_list(request):
    # Existing logic to fetch books
    books = Book.objects.all() 

    # Search by Author
    author_name = request.GET.get('author_name')
    if author_name:
        books = books.filter(author__name__icontains=author_name)

    # Search by Title
    book_title = request.GET.get('book_title')
    if book_title:
        books = books.filter(title__icontains=book_title)

    # Filter by Publication Date
    pub_date_before = request.GET.get('pub_date_before')
    pub_date_after = request.GET.get('pub_date_after')
    if pub_date_before:
        books = books.filter(publication_date__lte=pub_date_before)
    if pub_date_after:
        books = books.filter(publication_date__gte=pub_date_after)

    # Enhance book objects with average rating
    with connection.cursor() as cursor:
        for book in books:
            cursor.execute("SELECT GetAverageRating(%s)", [book.id])
            result = cursor.fetchone()
            book.avg_rating = result[0] if result else 0

    return render(request, 'webapp/book_list.html', {'books': books})

def member_borrowing_stats(request, member_id):
    # Set these as needed; could be from the request, fixed, or otherwise determined
    start_date = '2022-01-01'
    end_date = '2022-12-31'

    with connection.cursor() as cursor:
        cursor.execute("SELECT total_books_borrowed_by_member(%s, %s, %s)", [member_id, start_date, end_date])
        total_borrowed = cursor.fetchone()[0]

    return render(request, 'webapp/member_borrowing_stats.html', {'total_borrowed': total_borrowed})

#Report

def get_report_results(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        column_names = [col[0] for col in cursor.description]
        return column_names, [dict(zip(column_names, row)) for row in cursor.fetchall()]

def reports(request):
    context = {}

    if 'max_books_borrowed' in request.GET:
        # Set headers and results for max_books_borrowed report
        context['report_headers'] = ['Member ID', 'Member Name', 'Total Books Borrowed']
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT b.member_id, m.name, COUNT(*) AS total_borrows
                FROM webapp_borrowing b
                INNER JOIN webapp_member m ON b.member_id = m.id
                GROUP BY b.member_id, m.name
                ORDER BY total_borrows DESC
                LIMIT 1
            """)
            max_books_borrowed = cursor.fetchone()
            if max_books_borrowed:
                context['report_results'] = [{
                    'Member ID': max_books_borrowed[0],
                    'Member Name': max_books_borrowed[1],
                    'Total Books Borrowed': max_books_borrowed[2],
                }]
    elif 'total_checked_out' in request.GET:
        # Set headers and results for total_checked_out report
        context['report_headers'] = ['Count']
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT COUNT(*)
                FROM webapp_borrowing
                WHERE return_date IS NULL
            """)
            total_checked_out = cursor.fetchone()
            if total_checked_out:
                context['report_results'] = [{
                    'Count': total_checked_out[0],
                }]
    elif 'avg_borrow_duration' in request.GET:
        # Set headers and results for avg_borrow_duration report
        context['report_headers'] = ['Avg Borrow Duration']
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT AVG(DATEDIFF(return_date, borrow_date))
                FROM webapp_borrowing
                WHERE return_date IS NOT NULL
            """)
            avg_borrow_duration = cursor.fetchone()
            if avg_borrow_duration:
                context['report_results'] = [{
                    'Avg Borrow Duration': avg_borrow_duration[0],
                }]
    
    return render(request, 'webapp/reports.html', context)


