from django.urls import path
from . import views
from .views import edit_return_date

urlpatterns = [
    #TABLES AND CRUD OPS
    path('', views.book_list, name='book_list'),  
    path('book/new', views.book_create, name='book_create'),  
    path('book/edit/<int:pk>', views.book_edit, name='book_edit'),
    path('book/delete/<int:pk>', views.book_delete, name='book_delete'),
    path('authors/', views.author_list, name='author_list'),
    path('author/new/', views.add_author, name='add_author'),
    path('author/edit/<int:author_id>/', views.edit_author, name='edit_author'),
    path('author/delete/<int:author_id>/', views.delete_author, name='delete_author'),
    path('members/', views.member_list, name='member_list'),
    path('members/add/', views.add_member, name='add_member'),
    path('members/edit/<int:pk>/', views.edit_member, name='edit_member'),
    path('members/delete/<int:member_id>/', views.delete_member, name='delete_member'),
    path('borrowings/', views.borrowing_list, name='borrowing_list'),
    path('borrowings/add/', views.add_borrowing, name='add_borrowing'),
    path('reviews/', views.review_list, name='review_list'),
    path('reviews/add/', views.add_review, name='add_review'),
    path('publishers/', views.publisher_list, name='publisher_list'),
    path('publishers/add/', views.add_publisher, name='add_publisher'),
    #VIEWS
    path('combined-books/', views.combined_book_list, name='combined_book_list'),
    path('borrowers-and-reviews/', views.book_borrowing_review_list, name='borrowers_and_reviews'),
    #PROCEDURES
    path('return-book/<int:borrowing_id>/', views.return_book, name='return_book'),
    #TRIGGERS
    path('borrowings/archived/', views.archived_borrowings, name='archived_borrowings'),
    path('borrowings/edit-return-date/<int:borrowing_id>/', edit_return_date, name='edit_return_date'),
    path('reports/', views.reports, name='reports'),

]
