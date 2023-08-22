use hospital;

-- Os dados de convênio são de empresas reais e foram retirados de: https://dados.gov.br/dados/conjuntos-dados/operadoras-de-planos-privados-de-saude
-- Os dados relativos a pessoas foram criados a partir do site: https://www.4devs.com.br/

-- 10 médicos

insert into medico(id, nome, cpf, rg, crm, nascimento, telefone, endereco) values (1,
'Ivete Vargas', '825.114.200-82','36.355.561-4','120935-RS','1987-12-31','(69) 3752-5488','Rua Flores 10, apto 101');

insert into medico(nome, cpf, rg, crm, nascimento, telefone, endereco) values
('Tadeu Higashi','420.104.260-02','46.182.824-8','15891-SP','1977-11-29','(97) 2810-2734','Avenida Japão 50'),
('Silvana Mantovani','494.784.220-22','16.908.738-4','178105-MG','1983-10-27','(79) 2718-0264','Rua Albieri 480'),
('Ana Gimenes','149.687.180-47','44.991.944-4','17897-MG','1986-11-28','(61) 3019-1483','Travessa A 89'),
('César Meireles','279.267.070-31','29.590.255-3','9826-RS','1990-09-26','(82) 2433-7762','Avenida Santos, 90'),
('Hugo Jardim','513.026.530-08','38.212.494-7','34548-SP','2000-02-25','(86) 3368-4812','Rua Álamo, 180, ap 90'),
('Elisa Luz','808.909.030-34','21.443.006-6','344789-SP','1991-4-24','(54) 3941-4795','Avenida Chateaubriand, 150'),
('Gilmar Moraes','824.775.850-45','41.639.346-9','9756-RS','1992-3-23','(69)2537-6076','Rua Flores 670'),
('Sandra Fonseca','433.411.050-93','36.047.742-2','14777-RS','1993-4-22','(83) 3272-8326','Rua da Luz, 80'),
('Marcia Passos','574.682.110-19','10.634.687-8','67432-RS','1989-12-21','(63) 3230-5071','Avenida  das aves, 9912, apto 60'),
('Arnaldo Andrade','107.624.170-05','27.861.852-2','13548-SP','1989-6-20','(24) 2448-9465','Rua Albieri 590');

-- 7 especialidades

insert into funcao(descricao_especialidade) values
('pediatria'),
('clínica geral'),
('dermatologia'),
('gastroenterologia'),
('residência'),
('oftalmologia'),
('generalista');

-- 3 quartos cadastrados de 3 tipos e com valores diferentes

insert into tipo_quarto(descricao, valor_diaria) values
('apartamento', 245.66),
('quarto duplo', 171.99),
('enfermaria', 206.87);

-- 4 convênios

insert into convenio(nome, cnpj, carencia) values
('CLINIPAM - clinica paranaense de assistencia medica', '76882612000117', 6),
('COMPAR administradora de beneficios ltda - ME', '2392074000188', 3),
('DOCTOR CLIN operadora de planos de saude ltda', '01387625000110', 9),
('SULMED - assistencia medica ltda', '90747908000156', 6);

-- 10 enfermeiros

insert into enfermeiro(nome, cpf, cre) values
('Antonio Cauê Baptista','997.250.600-24','102845-RS'),
('Benício Noah da Paz','663.628.650-49','456378-BA'),
('Manuel Caio Carlos Eduardo da Mata','780.273.750-88','309049-PR'),
('Benício Giovanni Juan Cardoso','056.805.400-88','124562-SC'),
('Gabriel Mateus Felipe Viana','003.764.190-59','198756-AC'),
('Benedita Joana Oliveira','142.136.150-73','908133-AC'),
('Vanessa Clarice Almeida','562.692.330-62','778234-GO'),
('Melissa Marli Adriana Campos','491.404.330-05','129065-MG'),
('Ana Paula de Orleans e Bragança','026.906.980-13','675849-RS'),
('Joana Pereira Koff','804.717.790-75','394856-SP');

insert into medico_especialidade(medico_id, funcao_id) values
(1, 5),
(2, 6),
(3, 4),
(4, 1),
(5, 1),
(6, 4),
(7, 4),
(8, 3),
(9, 5),
(10, 2);

insert into quarto(numero, tipo_quarto_id) values
(503, 2),
(512, 1),
(400, 3),
(201, 1),
(312, 2);
 
 insert into receita(id, medicamentos, quantidade, instrucoes_de_uso) values
 (1, 'Abacavir', '50 mg', '2 comprimidos ao dia (cada 12 horas)'),
 (2, 'Bacitracina', '100 mg', '3 comprimidos ao dia (cada 8 horas)'),
 (3, 'Cabazitaxel', '25 mg', '1 comprimido a cada 12 horas'),
 (4, 'Dabrafenibe', '75 mg', '1 comprimido de 6 em 6 horas'),
 (5, 'Etexilato de dabigatrana', '100 mg', '1 comprimido ao dia'),
 (6, 'Fanciclovir', '100 mg', '1 comprimido a cada 12 horas'),
 (7, 'Gluconato de cálcio', '100 mg', '1 comprimido ao dia, EM JEJUM'),
 (8, 'Haloperidol', '50 mg', '1 comprimido a cada 4 horas'),
 (9, 'Ibalizumabe', '100 mg', '2 comprimidos ao dia ( 1 a cada 12 horas)'),
 (10, 'Lacosamida', '100 mg', '1 comprimido ao dia, tomar ANTES DE DORMIR');

-- 15 pacientes

insert into paciente(nome, nascimento, rua, cidade, estado, telefone, email, cpf, rg, convenio_id, numero_carteira) values
('Carolina Silvana Araújo', '1945-10-24', 'Rua Jacamin, 918', 'Boa Vista', 'RR', '(95) 3545-7554', 'carolina_silvana_araujo@eyejoy.com.br', '842.356.194-11', '32.819.694-0', 4, '479-230-129'),
('Renan Ricardo Jorge Carvalho', '1965-5-16', 'Quadra CA 12, 820', 'Brasília', 'DF', '(61) 98622-9878', 'renan.ricardo.carvalho@caferibeiro.com.br', '669.865.156-77', '18.879.577-7', 3, '400-211-987'),
('Tatiane Bruna Almeida', '1991-9-23', 'Avenida Ana Paula, 168', 'Belo Horizonte', 'MG', '(31) 98183-0023', 'tatiane_almeida@localiza.com', '402.374.591-08', '27.983.304-0', null, null),
('Daniel Renan Benjamin Peixoto', '1994-05-11', 'Marginal Leste, 887', 'Dourados', 'MS', '(67) 2963-2412', 'danielrenanpeixoto@bidoul.eng.br', '410.840.030-58', '27.255.743-2', null, null),
('Bianca Helena Silveira', '1945-3-1', 'Rua João Sotero de Castro, 434', 'Bauru', 'SP', '(14) 3783-9056', 'biancahelenasilveira@jp.ind.br', '820.884.514-04', '21.442.237-9', null, null),
('Sérgio Ricardo Assis', '1987-11-1', 'Avenida Vila do Jacu, 532', 'Jacu das Piranhas', 'MG', '(38) 2624-6792', 'sergio.ricardo.assis@zipmail.com', '091.808.201-31', '11.868.425-5', 3, '899-122-285'),
('Renan Pietro Giovanni Oliveira', '1959-1-10', 'Avenida Boa Vista, 466', 'Boa Vista', 'RR', '(95) 98927-5462', 'renan.pietro.oliveira@mv1.com.br', '934.824.233-42', '35.914.154-7', 2, '499-238-443'),
('Benjamin Otávio Novaes', '1944-8-5', 'Travessa Nossa Senhora da Vitória, 313', 'São Luís', 'MA', '(98) 3852-4968', 'benjaminotavionovaes@gerj.com.br', '850.710.672-26', '39.834.073-0', null, null),
('Nathan Cauã da Luz', '2002-3-25', 'Rua Caminho 14-Setor 02, 367', 'Salvador', 'BA', '(71) 98501-3789', 'nathan.caua.daluz@andressamelo.com.br', '857.902.396-33', '32.215.877-1', 1, '419-282-777'),
('Aline Cecília Martins', '1961-1-7', 'Rua David Caldas, 295', 'Parnaíba', 'PI', '(86) 2514-8085', 'martins81@viavaleseguros.com.br', '692.037.157-03', '43.125.193-9', 2, '478-002-199'),
('Bruna Valentina Fernandes', '1956-2-3', 'Avenida Wilson Borges Miguel, 576', 'Serra', 'ES', '(27) 98148-4898', 'bruna.valentina.fernandes@kof.com.mx', '764.416.241-09', '27.152.665-8', null, null),
('Lucca Isaac Moreira', '1944-7-23', 'Beco São Francisco, 187', 'Manaus', 'AM', '(92) 98168-2184', 'luccaisaacmoreira@pq.cnpq.br', '431.906.883-11', '12.829.166-7', null, null),
('Hugo Renan Aparício', '1945-10-23', 'Avenida São Fidélis, 366', 'Campos dos Goytacazes', 'RJ', '(22) 2905-7155', 'hugo_aparicio@acquire.com.br', '241.544.548-70', '46.909.290-7', null, null),
('Esther Ester da Paz', '1948-7-5', 'Avenida André Cecone, 766', 'Curitiba', 'PR', '(41) 99925-4877', null, '535.556.781-91', '31.626.633-4', null, null),
('Isabella Fabiana Baptista', '1976-08-14', 'João Pessoa, 500', 'Cariacica', 'ES', '((27) 2746-0527', null, '179.337.901-78', '29.940.314-2', null, null);

-- 20 consultas, alguns pacientes realizam mais de 1, diferentes médicos, data entre 1/1/15 e 1/1/22
-- 10 delas com receituário médico
-- 4 convênios com 5 pacientes e 5 consultas
 
insert into consulta(data_hora, valor, medico_especialidade_id, paciente_id, convenio_id, funcao_id, receita_id) values
('2015-01-01 09:30:00', 200, 1, 15, null, 6, 10),
('2016-4-12 10:00:00', 100, 2, 15, null, 5, 9),
('2016-6-14 09:30:00', null, 3, 13, 1, 4, 8),
('2018-8-16 11:30:00', null, 4, 12, 2, 3, 7),
('2018-10-18 12:30:00', 500, 5, 13, null, 2, 6),
('2018-12-20 13:30:00', 300, 6, 10, null, 1, 5),
('2019-1-22 14:30:00', null, 7, 9, 3, 1, 4),
('2019-3-24 15:30:00', null, 8, 8, 4, 2, 3),
('2019-5-26 16:30:00', 150, 9, 7, null, 3, 2),
('2020-7-28 17:30:00', 175, 10, 6, null, 4, 1),
('2020-9-30 18:30:00', null, 1, 5, 1, 5, null),
('2020-11-1 19:30:00', null, 2, 4, 2, 6, null),
('2020-2-3 20:30:00', 275, 3, 3, null, 6, null),
('2021-4-5 21:30:00', 220, 4, 2, null, 5, null),
('2021-6-7 22:30:00', null, 5, 1, null, 4, null),
('2021-8-9 23:30:00', null, 6, 1, null, 3, null),
('2021-10-11 04:30:00', 200, 7, 2, null, 2, null),
('2022-12-13 05:30:00', 200, 8, 3, null, 1, null),
('2022-1-15 06:30:00', 200, 9, 4, null, 1, null),
('2022-3-17 07:00:00', 200, 10, 5, null, 2, null);

-- 7 internações, 2 pacientes se internam mais de uma vez, data entre 1/1/15 e 1/1/22

insert into internacao(id, data_entrada, data_saida_prevista, data_saida_efetiva, procedimento, paciente_id, medico_especialidade_id, quarto_id) values
(1, '2015-1-1', '2015-1-5', '2015-1-3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu urna accumsan, sagittis lorem at, semper enim. Proin vel lorem nec tortor sodales maximus. Praesent viverra porta dapibus. Duis eget gravida est, non imperdiet odio.', 1, 3, 1),
(2, '2015-2-5', '2015-2-12', '2015-2-10', 'Proin nec diam purus. Sed id arcu nec lectus molestie lacinia volutpat non odio. Proin hendrerit volutpat purus sit amet congue.', 2, 3, 2),
(3, '2015-2-7', '2015-2-8', '2015-2-8', 'Phasellus nec tellus eu nulla sollicitudin venenatis non quis ligula. Proin porttitor, ipsum a euismod rutrum, tortor erat pulvinar leo, et placerat nisi nisi sed lectus.', 1, 4, 3),
(4, '2017-2-10', '2017-2-15', '2017-2-11', 'Pellentesque accumsan orci eget rutrum ullamcorper. Praesent sed tempor orci. Donec neque ex, dapibus eu elit a, luctus facilisis leo. Sed vel vulputate neque. Phasellus molestie varius interdum. Maecenas eget maximus ex.', 2, 2, 4),
(5, '2018-8-11', '2018-8-13', '2018-8-15', 'Duis non quam commodo, dapibus mauris a, auctor nisi. Morbi sit amet nisi elit. In nec viverra lacus, condimentum luctus leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in euismod elit, id consectetur leo. Maecenas ex felis, vulputate eu urna quis, porta faucibus lacus.', 3, 4, 5),
(6, '2020-4-5', '2020-4-6', '2020-4-7', 'Proin aliquet facilisis rutrum. Ut non nulla vel ligula auctor elementum. Etiam suscipit, nisi sed cursus imperdiet, mi tellus sagittis diam, volutpat mattis enim libero sit amet justo.',4 , 5, 1),
(7, '2021-9-21', '2021-9-30', '2021-9-30', 'Donec id ante blandit, bibendum velit vel, efficitur lacus. Curabitur et massa volutpat, elementum eros eu, hendrerit arcu. Morbi tempor justo nec convallis consectetur. In molestie dolor mollis elit maximus dignissim. Integer mollis laoreet nisi id rutrum. In at diam sit amet felis blandit rutrum. Vivamus non dignissim purus.', 5, 6, 2);

-- nova tabela que associa a internação ao enfermeiro

insert into dados_completos_internacao(internacao_id, enfermeiro_id) values 
(1 , 2),
(2 , 1),
(3 , 4),
(4 , 4),
(5 , 3),
(6 , 2),
(7 , 7);

-- para que seja possível vincular 2 enfermeiros por internação criei mais uma coluna (enfermeiro_aux_id) na tabela dados_completos_internacao

alter table dados_completos_internacao add enfermeiro_aux_id int not null;

-- Preenchi a coluna com as IDs dos enfermeiros 
-- São IDs diferentes da coluna enfermeiro_id 

update dados_completos_internacao set enfermeiro_aux_id = 3 where id = 1;
update dados_completos_internacao set enfermeiro_aux_id = 4 where id = 2;
update dados_completos_internacao set enfermeiro_aux_id = 5 where id = 3;
update dados_completos_internacao set enfermeiro_aux_id = 5 where id = 4;
update dados_completos_internacao set enfermeiro_aux_id = 2 where id = 5;
update dados_completos_internacao set enfermeiro_aux_id = 1 where id = 6;
update dados_completos_internacao set enfermeiro_aux_id = 1 where id = 7;

alter table dados_completos_internacao add foreign key (enfermeiro_aux_id) references enfermeiro(id);

/* Parte 2 da atividade*/ 

-- Criação de coluna em atividade para os médicos
-- Usei char(1) por ser o mesmo exemplo usado na apostila

alter table medico add column status_atual char(1);

-- Atribuição de valor para a coluna criada

update medico set status_atual = 'A' where id > 0;

-- Atualização das datas de saída para 3 dias após a data de entrada

update internacao set data_saida_efetiva = (data_entrada + 3) where id > 0;

-- Para excluir o ultimo convênio cadastrado e suas consultas optei por atualizar o valor que estivesse como 4 na coluna convennio_id para null

update consulta set convenio_id = null where convenio_id = 4 and valor is null;

-- E depois disso excluir as linhas que estivessem com as colunas valor e convenio_id como null

delete from consulta where valor is null and convenio_id is null; 