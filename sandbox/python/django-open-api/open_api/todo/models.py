from django.db import models


class Todo(models.Model):
    class TodoStatus(models.TextChoices):
        NOT_STARTED = 'not_started'
        IN_PROGRESS = 'in_progress'
        COMPLETED = 'completed'

    title = models.CharField(
        'タイトル',
        max_length=100,
        blank=False,
        null=False,
    )
    description = models.TextField(
        '詳細',
        blank=False,
        null=False,
    )
    status = models.CharField(
        'ステータス',
        max_length=20,
        choices=TodoStatus.choices
    )
    create_date = models.DateTimeField(
        auto_now_add=True,
    )
    update_date = models.DateTimeField(
        auto_now=True,
    )
