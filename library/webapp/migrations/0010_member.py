# Generated by Django 5.0.3 on 2024-03-21 23:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0009_book_genres"),
    ]

    operations = [
        migrations.CreateModel(
            name="Member",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=200)),
                ("email", models.EmailField(max_length=254, unique=True)),
                ("library_card_number", models.CharField(max_length=50, unique=True)),
                ("join_date", models.DateField(auto_now_add=True)),
            ],
        ),
    ]
