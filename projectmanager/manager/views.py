# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import login, authenticate
from django.contrib.auth.views import LoginView, LogoutView, PasswordChangeView
from django.contrib.auth.mixins import UserPassesTestMixin
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import DetailView
from django.views.generic.edit import FormView, CreateView, UpdateView, DeleteView
from .models import User, Project, Requirement
from .forms import UserForm, ContributorForm


@login_required
def home(request):
    user = request.user
    projects_admin = user.administers.all()
    projects_cntrb = user.contributes.all()
    context = {'projects_admin':projects_admin, 'projects_contribute':projects_cntrb}
    return render(request, 'manager/home.html', context)

# Permission mixins
# ##########################################################
class CanCreate(UserPassesTestMixin):

    def test_func(self):
        pk = self.kwargs['pk']
        project = Project.objects.get(id=pk);
        return self.request.user == project.admin or \
            self.request.user in project.contributors.all()

class CanModify(UserPassesTestMixin):
    
    def test_func(self):
        project = self.get_object()
        if type(project) == Requirement:
            project = project.project
        return self.request.user == project.admin or \
            self.request.user in project.contributors.all()

class IsAdmin(UserPassesTestMixin):

    def test_func(self):
        return self.request.user == self.get_object().admin

# User authentication
# ##########################################################
class Login(LoginView):
    template_name = 'manager/login.html'

class Logout(LogoutView):
    template_name = 'manager/logout.html'

# Crud for Users
# ##########################################################
class SignUp(FormView):
    template_name = 'manager/signup.html'
    form_class = UserForm
    success_url = reverse_lazy('home')

    def form_valid(self, form):
        form.save()
        username = form.cleaned_data.get('username')
        raw_password = form.cleaned_data.get('password1')
        user = authenticate(username=username, password=raw_password)
        login(self.request, user)
        return super(SignUp, self).form_valid(form)

@method_decorator(login_required, name='dispatch')
class UserView(DetailView):
    model = User

    def get_object(self):
        return self.request.user

@method_decorator(login_required, name='dispatch')
class UserUpdate(UpdateView):
    model = User
    fields = ['username', 'email']

    def get_object(self):
        return self.request.user

@method_decorator(login_required, name='dispatch')
class PasswordChange(PasswordChangeView):
    template_name = 'manager/password_change.html'
    success_url = reverse_lazy('user_detail')

@method_decorator(login_required, name='dispatch')
class UserDelete(DeleteView):
    model = User
    success_url = reverse_lazy('login')

    def get_object(self):
        return self.request.user

# Crud for Projects
# ##########################################################
@method_decorator(login_required, name='dispatch')
class ProjectCreate(CreateView):
    model = Project
    fields = ['name', 'description']

    def form_valid(self, form):
        form.instance.admin = self.request.user
        return super(ProjectCreate, self).form_valid(form)
    
class ProjectView(CanModify, DetailView):
    model = Project

    def get_context_data(self, **kwargs):
        context = super(ProjectView, self).get_context_data(**kwargs)
        context['functional_requirements'] = self.get_object().requirements.filter(functional=True)
        context['non_functional_requirements'] = self.get_object().requirements.filter(functional=False)
        return context

class ProjectUpdate(CanModify, UpdateView):
    model = Project
    fields = ['name', 'description']

class ProjectContributor(IsAdmin, FormView):
    object
    
    def get_object(self):
        project_id = self.kwargs['pk']
        try:
            self.object = Project.objects.get(pk=project_id)
        except DoesNotExist:
            raise Http404("No projects found matching the query")
        return self.object

    def get_initial(self):
        return {'project_id': self.object.id }

class ProjectContributorAdd(ProjectContributor):
    template_name = 'manager/project_contributor_add.html'
    form_class = ContributorForm

    def form_valid(self, form):
        username = form.cleaned_data['username']
        user = User.objects.get(username=username)
        project = self.object
        project.contributors.add(user)
        return redirect(project)

class ProjectContributorRemove(ProjectContributor):
    template_name = 'manager/project_contributor_remove.html'
    form_class = ContributorForm

    def form_valid(self, form):
        username = form.cleaned_data['username']
        user = User.objects.get(username=username)
        project = self.object
        project.contributors.remove(user)
        return redirect(project)

class ProjectDelete(IsAdmin, DeleteView):
    model = Project
    success_url = reverse_lazy('home')

# Crud for Requirements
# ##########################################################
class RequirementCreate(CanCreate, CreateView):
    model = Requirement
    fields = ['name', 'functional', 'description']

    def form_valid(self, form):
        project_id = self.kwargs["pk"]
        form.instance.project = Project.objects.get(id=project_id)
        return super(RequirementCreate, self).form_valid(form) 

class RequirementView(CanModify, DetailView):
    model = Requirement
    pk_url_kwarg = 'rk'

class RequirementUpdate(CanModify, UpdateView):
    model = Requirement
    fields = ['name', 'description']
    pk_url_kwarg = 'rk'

class RequirementDelete(CanModify, DeleteView):
    model = Requirement
    pk_url_kwarg = 'rk'

    def get_success_url(self):
        return reverse_lazy('project_detail', kwargs={'pk': self.object.project.id}).format(**self.object.__dict__)
