# Generated by Django 5.0.3 on 2024-04-01 18:07

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0016_alter_bookborrowingreview_table"),
    ]

    operations = [
        migrations.CreateModel(
            name="BorrowingArchive",
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
                ("borrow_date", models.DateField()),
                ("return_date", models.DateField()),
                (
                    "book",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="webapp.book"
                    ),
                ),
                (
                    "member",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="webapp.member"
                    ),
                ),
            ],
            options={
                "db_table": "webapp_borrowing_archive",
            },
        ),
    ]
