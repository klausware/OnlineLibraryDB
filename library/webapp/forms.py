from django import forms
from .models import Book
from .models import Author

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = ['title', 'author', 'isbn', 'publisher_id', 'publication_date', 'genres']

class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = ['name', 'short_bio', 'authored_books']

