# Generated by Django 5.0.3 on 2024-03-21 23:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0007_alter_book_author"),
    ]

    operations = [
        migrations.CreateModel(
            name="Genre",
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
                ("name", models.CharField(max_length=100)),
                ("description", models.TextField(blank=True)),
            ],
        ),
    ]
