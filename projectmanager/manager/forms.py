from django.forms import ModelForm, Form, CharField, IntegerField, ValidationError, HiddenInput
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.forms import UserCreationForm
from .models import *

class UserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2', )


class ContributorForm(Form):
    username = CharField(
        label='username',
        max_length=150,
        help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.',
    )
    project_id = IntegerField(
        label='project_id',
        widget=HiddenInput,
    )

    def clean_username(self):
        print "Cleaning username"
        username = self.cleaned_data['username']
        try:
            User.objects.get(username=username)
        except ObjectDoesNotExist:
            raise ValidationError("No user with that username exists.")
        return username

    def clean_project_id(self):
        print "Cleaning project id"
        project_id = self.cleaned_data['project_id']
        try:
            Project.objects.get(pk=project_id)
        except ObjectDoesNotExist:
            raise ValidationError("Project doesn't exist. Make sure the admin hasn't deleted it.")
        return project_id
