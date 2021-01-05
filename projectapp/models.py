from django.db import models

# Create your models here.


class Project(models.Model):
    title = models.CharField(max_length=30, null=False)
    description = models.CharField(max_length=255, null=True)
    image = models.ImageField(upload_to='project/', null=False)
    create_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.pk} : {self.title}'