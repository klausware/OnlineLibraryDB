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
    path('borrowing/delete/<int:borrowing_id>/', views.delete_borrowing, name='delete_borrowing'),
    path('reviews/', views.review_list, name='review_list'),
    path('reviews/add/', views.add_review, name='add_review'),
    path('review/edit/<int:review_id>/', views.edit_review, name='edit_review'),
    path('review/delete/<int:review_id>/', views.delete_review, name='delete_review'),
    path('publishers/', views.publisher_list, name='publisher_list'),
    path('publishers/add/', views.add_publisher, name='add_publisher'),
    path('publishers/edit/<int:publisher_id>/', views.edit_publisher, name='edit_publisher'),
    path('publishers/delete/<int:publisher_id>/', views.delete_publisher, name='delete_publisher'),
    path('borrowings/archived/', views.archived_borrowings, name='archived_borrowings'),
    path('status/', views.status_list, name='status_list'),
    #VIEWS
    path('combined-books/', views.combined_book_list, name='combined_book_list'),
    path('borrowers-and-reviews/', views.book_borrowing_review_list, name='borrowers_and_reviews'),
    #PROCEDURES
    path('return-book/<int:borrowing_id>/', views.return_book, name='return_book'),
    #TRIGGERS
    path('borrowings/edit-return-date/<int:borrowing_id>/', edit_return_date, name='edit_return_date'),
    #REPORTS
    path('reports/', views.reports, name='reports'),

]
