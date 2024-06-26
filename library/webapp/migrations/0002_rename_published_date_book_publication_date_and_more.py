# Generated by Django 5.0.3 on 2024-03-21 01:56

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("webapp", "0001_initial"),
    ]

    operations = [
        migrations.RenameField(
            model_name="book",
            old_name="published_date",
            new_name="publication_date",
        ),
        migrations.RemoveField(
            model_name="book",
            name="author",
        ),
        migrations.AddField(
            model_name="book",
            name="author_id",
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name="book",
            name="isbn",
            field=models.CharField(default="0000000000", max_length=20),
        ),
        migrations.AddField(
            model_name="book",
            name="publisher_id",
            field=models.IntegerField(default=100),
        ),
        migrations.AlterField(
            model_name="book",
            name="title",
            field=models.CharField(max_length=255),
        ),
    ]
