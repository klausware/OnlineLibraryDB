from django import forms
from django.forms import ModelForm, DateInput
from .models import Book
from .models import Author
from .models import Member
from .models import Borrowing
from .models import Review
from .models import Publisher

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
        exclude = ['library_card_number']
        fields = ['name', 'email', 'library_card_number']  

class BorrowingForm(ModelForm):
    class Meta:
        model = Borrowing
        fields = ['book', 'member', 'borrow_date', 'return_date']
        widgets = {
            'borrow_date': DateInput(attrs={'type': 'date'}),
            'return_date': DateInput(attrs={'type': 'date'})
        }

class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['book', 'member', 'rating', 'text']
        widgets = {
            'rating': forms.Select(choices=[(i, i) for i in range(1, 6)]),
        }
    
class PublisherForm(ModelForm):
    class Meta:
        model = Publisher
        fields = ['name', 'address', 'website']

class EditReturnDateForm(forms.ModelForm):
    class Meta:
        model = Borrowing
        fields = ['return_date']