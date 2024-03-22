from django import forms
from .models import Book
from .models import Author
from .models import Member

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = ['title', 'author', 'isbn', 'publisher_id', 'publication_date', 'genres']

class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = ['name', 'short_bio', 'authored_books']

class MemberForm(forms.ModelForm):
    class Meta:
        model = Member
        fields = ['name', 'email', 'library_card_number']  