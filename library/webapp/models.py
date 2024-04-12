from django.db import models
from datetime import date

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
    publisher_id = models.IntegerField()  
    publication_date = models.DateField()
    genres = models.ManyToManyField(Genre, related_name='books')

    def __str__(self):
        return self.title
    

class Borrowing(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='borrowings')
    member = models.ForeignKey(Member, on_delete=models.CASCADE, related_name='borrowings')
    borrow_date = models.DateField(default=date.today)
    return_date = models.DateField(null=True, blank=True)  # Null allowed for books not yet returned

    def __str__(self):
        return f"{self.book.title} borrowed by {self.member.name}"

class Review(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='reviews')
    member = models.ForeignKey(Member, on_delete=models.CASCADE, related_name='reviews')
    rating = models.IntegerField()  # Assuming a rating out of 5 for simplicity
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Review by {self.member.name} on {self.book.title}"

class Publisher(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255, blank=True)
    website = models.URLField(blank=True)
    
    def __str__(self):
        return self.name

class Status(models.Model):
    title = models.ForeignKey('Book', on_delete=models.CASCADE)  
    status = models.CharField(
        max_length=11, 
        choices=[('available', 'Available'), ('unavailable', 'Unavailable')],
        default='available'
    )


# VIEWS

class CombinedBookDetails(models.Model):
    book_id = models.AutoField(primary_key=True)
    book_title = models.CharField(max_length=255)
    author_name = models.CharField(max_length=255)
    publisher_name = models.CharField(max_length=255)
    average_rating = models.FloatField()

    class Meta:
        managed = False  # No database table creation or deletion operations will be performed for this model.
        db_table = 'CombinedBookDetails'  


class BookBorrowingReview(models.Model):
    book_id = models.AutoField(primary_key=True)
    book_title = models.CharField(max_length=255)
    recent_borrowers = models.CharField(max_length=255)
    review = models.TextField(null=True, blank=True)
    rating = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)

    class Meta:
        managed = False  # Ensures Django doesn't try to create a table for this model.
        db_table = 'recentborrowings'  

# TRIGGERS
        
class BorrowingArchive(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    member = models.ForeignKey(Member, on_delete=models.CASCADE)
    borrow_date = models.DateField()
    return_date = models.DateField()
    
    class Meta:
        db_table = 'webapp_borrowing_archive'  # Ensure this matches the archive table name in the database
