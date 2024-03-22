from django.contrib import admin
from .models import Book
from .models import Author
from .models import Genre
from .models import Member


admin.site.register(Author)
admin.site.register(Book)
admin.site.register(Genre)
admin.site.register(Member)
