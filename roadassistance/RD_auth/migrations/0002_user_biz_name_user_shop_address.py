# Generated by Django 4.1.7 on 2023-06-07 13:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("RD_auth", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="user",
            name="biz_name",
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name="user",
            name="shop_address",
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]