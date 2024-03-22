from django.db import models

class Author(models.Model):
    name = models.CharField(max_length=255)
    short_bio = models.TextField(blank=True)  # Allows the field to be blank
    authored_books = models.CharField(max_length=255, blank=True)  # Assuming this will be a text field
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Genre(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    
    def __str__(self):
        return self.name
    
class Member(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField(unique=True)
    library_card_number = models.CharField(max_length=50, unique=True)
    join_date = models.DateField(auto_now_add=True)
    
    def __str__(self):
        return self.name
    
class Book(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(Author, on_delete=models.CASCADE, default=1, related_name='books')  # Changed from author_id
    isbn = models.CharField(max_length=20)
    publisher_id = models.IntegerField()  # Consider updating this similarly in the future
    publication_date = models.DateField()
    genres = models.ManyToManyField(Genre, related_name='books')

    def __str__(self):
        return self.title
    







