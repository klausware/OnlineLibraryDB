# Generated by Django 5.0.3 on 2024-03-21 17:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0003_alter_book_author_id_alter_book_isbn"),
    ]

    operations = [
        migrations.AlterField(
            model_name="book",
            name="publisher_id",
            field=models.IntegerField(),
        ),
    ]