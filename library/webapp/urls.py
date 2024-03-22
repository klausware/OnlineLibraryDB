from django.urls import path
from . import views

urlpatterns = [
    path('', views.book_list, name='book_list'),  # Assuming you have this from the listing functionality
    path('book/new', views.book_create, name='book_create'),  # Add this line for the create functionality
    path('book/edit/<int:pk>', views.book_edit, name='book_edit'),
    path('book/delete/<int:pk>', views.book_delete, name='book_delete'),
    path('authors/', views.author_list, name='author_list'),
    path('author/new/', views.add_author, name='add_author'),
    path('members/', views.member_list, name='member_list'),
    path('members/add/', views.add_member, name='add_member'),
    path('members/edit/<int:pk>/', views.edit_member, name='edit_member'),

]
