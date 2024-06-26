# Generated by Django 5.0.3 on 2024-03-21 20:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0005_author_remove_book_author_id_book_author"),
    ]

    operations = [
        migrations.AddField(
            model_name="author",
            name="authored_books",
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AddField(
            model_name="author",
            name="created_at",
            field=models.DateTimeField(auto_now_add=True, default="2024-03-21 00:00"),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="author",
            name="short_bio",
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name="author",
            name="updated_at",
            field=models.DateTimeField(auto_now=True),
        ),
    ]
