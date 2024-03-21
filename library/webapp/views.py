#from django.shortcuts import render
from django.shortcuts import render, redirect, get_object_or_404
from .models import Book
from .forms import BookForm
from .models import Author
from .forms import AuthorForm

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