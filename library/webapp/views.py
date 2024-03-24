#from django.shortcuts import render
from django.shortcuts import render, redirect, get_object_or_404
from django.db import OperationalError, transaction, connection
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


# Create your views here.

# Read operation: List all books
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

def member_list(request):
    members = Member.objects.all()
    return render(request, 'webapp/member_list.html', {'members': members})

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
            join_date = date.today()  # Assuming you want to use the current date

            # Call stored procedure
            with connection.cursor() as cursor:
                cursor.callproc('register_new_member', [name, email, join_date])

            return redirect('member_list')  # Adjust as needed
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

# PROCEDURES

def return_book(request, borrowing_id):
    if request.method == 'GET':
        with connection.cursor() as cursor:
            cursor.execute("UPDATE webapp_borrowing SET return_date = NOW() WHERE id = %s", [borrowing_id])
        return redirect('borrowing_list')  # Make sure 'borrowing_list' is the correct name for your URL pattern

# TRIGGERS
    
# FUNCTIONS
    
def book_list(request):
    # Your existing logic to fetch books
    books = Book.objects.all()  # Assuming Book is your model class

    # Enhance book objects with average rating
    with connection.cursor() as cursor:
        for book in books:
            cursor.execute("SELECT GetAverageRating(%s)", [book.id])
            result = cursor.fetchone()
            book.avg_rating = result[0] if result else 0

    return render(request, 'webapp/book_list.html', {'books': books})

