# Generated by Django 5.0.3 on 2024-03-22 19:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("webapp", "0012_review"),
    ]

    operations = [
        migrations.CreateModel(
            name="Publisher",
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
                ("name", models.CharField(max_length=255)),
                ("address", models.CharField(blank=True, max_length=255)),
                ("website", models.URLField(blank=True)),
            ],
        ),
    ]