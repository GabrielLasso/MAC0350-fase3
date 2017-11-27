from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import *

class SignUpForm(UserCreationForm):
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2', )

    def clean_email(self):
    	data = self.cleaned_data['email']
    	if User.objects.filter(email=data).exists():
        	raise forms.ValidationError("This email is already used")
    	return data

class ProjectForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ('name', 'description')
