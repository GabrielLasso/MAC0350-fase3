-- Caso de uso 1
-- Uma pessoa pode cadastrar um usu ́ario no sistema de gerenciamento conceitual de requisitos deprojetos. 
INSERT INTO manager_user (password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email) 
	VALUES ('pbkdf2_sha256$36000$NVgeMXx06dXX$QC4M673L04gY4b4/vYiCPXpe6KQgFn6A975f8nyZ+8M=', NULL, false, 'Monitor', '', '', false, true, '2017-12-04T20:09:34.535019+00:00'::timestamptz, 'monitor@jef.kon');


-- Caso de uso 2
-- Um usuario pode se descadastrar do sistema, excluindo sua conta e projetos do banco de dados.
-- Sua senha e necess ́aria para realizar essa acao
DELETE FROM manager_user WHERE manager_user.username = 'Monitor';


-- Caso de uso 3
-- Um usuario pode criar uma quantidade ilimitada de projetos. 
-- O usuario criador automaticamentese torna administrador do projeto.
INSERT INTO manager_project (name, description, admin_id) 
	VALUES ('Costeletas online', 'Aplicativo para edicao de imagems cujo foco e acrescentar costeletas', 3);

-- Caso de uso 4
-- O Administrador do projeto pode convidar outros usuarios como colaboradores
INSERT INTO manager_project_contributors (project_id, user_id) VALUES (6, 1);

-- Caso de uso 5
-- Um usuoario colaborador pode editar os atributos e requisitos do projeto.
UPDATE manager_project 
	SET name = 'Sideburns online Schoolar', description = 'Aplicativo para edicao de imagens cujo foco e acrescentar costeletas. Oferecemos nossos servicos gratuitamente para estudantes da USP.', admin_id = 3 
	WHERE manager_project.id = 6;

-- Caso de uso 6
-- Um usuario pode deletar um projeto do qual e administrador, excluindo ele e seus requisitos dobanco de dados.
DELETE FROM manager_project WHERE manager_project.id = 6;

-- Caso de uso 7
-- Um usuario pode adicionar e editar requisitos a projetos existentes.
-- Estas acoes estao restritasaos projetos em que o usuario e administrador ou colaborador.
INSERT INTO manager_requirement (name, description, functional, project_id)
	VALUES ('Sorteio', 'Um cliente pode ganhar uma casa', true, 3);

-- Caso de uso 8
-- Um usuario pode excluir requisitos de projetos do qual e dono ou colaborador.
DELETE FROM manager_requirement WHERE manager_requirement.id = 11;