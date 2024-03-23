# Generated by Django 5.0.3 on 2024-03-23 15:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0014_combinedbookdetails"),
    ]

    operations = [
        migrations.CreateModel(
            name="BookBorrowingReview",
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
                ("book_title", models.CharField(max_length=255)),
                ("recent_borrowers", models.CharField(max_length=255)),
                ("review", models.TextField(blank=True, null=True)),
                (
                    "rating",
                    models.DecimalField(
                        blank=True, decimal_places=2, max_digits=3, null=True
                    ),
                ),
            ],
            options={
                "db_table": "your_sql_view_name",
                "managed": False,
            },
        ),
    ]