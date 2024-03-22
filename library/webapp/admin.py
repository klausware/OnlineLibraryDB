from django.contrib import admin
from .models import Book
from .models import Author
from .models import Genre
from .models import Member
from .models import Borrowing
from .models import Review
from .models import Publisher

admin.site.register(Author)
admin.site.register(Book)
admin.site.register(Genre)
admin.site.register(Member)
admin.site.register(Borrowing)
admin.site.register(Review)
admin.site.register(Publisher)