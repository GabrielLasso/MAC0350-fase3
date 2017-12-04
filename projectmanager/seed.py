import os
from django.contrib.auth.hashers import make_password
import django

def add_user(myname, myemail, mypassword):
    user = User.objects.get_or_create(username=myname, email=myemail, password=mypassword)[0]
    return user

def add_project(myname, mydescription, myadmin, mycontributors):
    project = Project.objects.get_or_create(name=myname, description=mydescription, admin=myadmin)[0]
    return project

def add_requirement(myname, mydescription, myfunctional, myproject):
    req = Requirement.objects.get_or_create(name=myname, description=mydescription, functional=myfunctional, project=myproject)[0]
    return req

if __name__ == '__main__':
    print "Starting Django population script..."
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "projectmanager.settings")
    django.setup()
    from manager.models import User, Project, Requirement

    Felipe = add_user("felipinho", "felipinho@xol.com", make_password("0000aaaa"))
    Felipe_p = add_project("MercadoSemiLivre do Felipe", "Site para vendas de usados", Felipe, "felipinho")
    Felipe_p_r = add_requirement("Login", "Precisamos de uma tela de login", 1, Felipe_p)
    Felipe_p_r = add_requirement("Capital", "Precisamos de dinheiro", 0, Felipe_p)


    Camila = add_user("camilinha", "camilinha@xol.com", make_password("0000aaaa"))
    Camila_p = add_project("MercadoLivre da Camila", "Site para venda de quebrados", Camila, "camilinha")
    Camila_p_r = add_requirement("Index", "Precisamos mostrar todos os quebrados", 1, Camila_p)
    Camila_p_r = add_requirement("Cafeteira", "Precisamos de uma cafeteira pra os empregados", 0, Camila_p)

    Lasso = add_user("lassinho", "lassinho@xol.com", make_password("0000aaaa"))
    Lasso_p = add_project("MercadoPrivado do Lasso", "Troca de moedas internacionais", Lasso, "lassinho")
    Lasso_p_r = add_requirement("Analise de moedas", "Um Algoritmo para analisar fotos de moedas", 1, Lasso_p)
    Lasso_p_r = add_requirement("Conjunto de moedas", "Biblioteca inicial de moedas disponiveis", 0, Lasso_p)

    Angelo = add_user("angelinho", "angelinho@xol.com", make_password("0000aaaa"))
    Angelo_p = add_project("MercadoSemiPrivado do Angelo", "Site para troca de figurinhas da copa", Angelo, "angelinho")
    Angelo_p_r = add_requirement("Layout", "Um album com bom layout", 1, Angelo_p)
    Angelo_p_r = add_requirement("Viagem", "Precisamos ir a russia para tirar fotos novas da copa", 0, Angelo_p)

    Rica = add_user("ricardinho", "ricardinho@xol.com", make_password("0000aaaa"))
    Rica_p = add_project("MercadoSemiLivrePrivado do Rica", "Aplicativo para transferencia bancaria", Rica, "ricardinho")
    Rica_p_r = add_requirement("Registro", "Precisamos registrar todas as transferencias", 1, Rica_p)
    Rica_p_r = add_requirement("Riscos", "Um analista de riscos e necessario para o inicio", 0, Rica_p)