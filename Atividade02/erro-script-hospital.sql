create database hospital;
use hospital;


create table medico (
id int not null auto_increment,
nome varchar(45) not null,
cpf varchar(45) not null,
rg varchar(45) not null,
crm varchar(45) not null,
nascimento date not null,
telefone varchar(45) not null,
endereco varchar(45) not null,
primary key (id),
unique key (cpf, rg, crm)
); 

create table funcao (
id int not null auto_increment,
descricao_especialidade varchar(45) not null,
primary key (id)
);

create table tipo_quarto (
id int not null auto_increment,
descricao varchar(45) not null,
valor_diaria decimal(9,2) unsigned not null,
primary key (id)
);

create table convenio(
id int not null auto_increment,
nome varchar(45) not null,
cnpj varchar(15) not null,
carencia int unsigned not null,
primary key (id),
unique key (nome, cnpj)
);


create table medico_especialidade (
medico_id int not null,
funcao_id int not null,
foreign key (medico_id) references medico(id),
foreign key (funcao_id) references funcao(id)
);

create table quarto (
id int not null auto_increment,
numero int unsigned not null,
tipo_quarto_id int not null,
primary key (id),
foreign key (tipo_quarto_id) references tipo_quarto(id)
);

create table paciente (
id int auto_increment not null,
nome varchar(45) not null,
nascimento date not null,
rua varchar(50) not null,
cidade varchar(45) not null,
estado varchar(45) not null,
telefone varchar(45) not null,
email varchar(45),
cpf varchar(45) not null,
rg varchar(45) not null,
convenio_id int not null,
carteira varchar(45),
primary key (id, carteira),
unique key (cpf, rg),
foreign key (convenio_id) references convenio(id)
);

create table consulta (
id int not null auto_increment,
dia date not null,
hora time not null,
valor decimal(9,2) not null,
medico_id int,
paciente_id int,
convenio int,
nome_convenio varchar(45),
especialidade int,
carteirapaciente varchar(45),
primary key (id),
unique key (medico_id, paciente_id, carteirapaciente),
foreign key (nome_convenio) references convenio(nome),
foreign key (paciente_id) references paciente(id),
foreign key (carteirapaciente) references paciente(carteira),
foreign key (medico_id) references medico(id),
foreign key (convenio) references convenio(id),
foreign key (especialidade) references funcao(id)
);

create table receita (
id int,
medicamentos varchar(50),
quantidade varchar(45),
instrucoes_de_uso tinytext,
id_consulta int,
primary key (id, id_consulta),
foreign key (id_consulta) references consulta(id)
);

create table enfermeiro (
id int not null auto_increment,
nome varchar(45) not null,
rg varchar(45) not null,
cpf varchar(45) not null,
cre varchar(45) not null,
primary key (id),
unique key(rg, cpf, cre)
);

create table internacao (
id int not null auto_increment,
data_entrada date not null,
data_saida_prevista date not null,
data_saida_efetiva date not null, 
procedimento tinytext not null,
primary key (id)
);

create table dados_completos_internacao (
internacao_id int not null,
enfermeiro_id int not null,
paciente_id int not null,
medico_id int not null,
quarto_id int not null,
primary key (internacao_id, enfermeiro_id, paciente_id, medico_id, quarto_id),
foreign key (internacao_id) references internacao(id),
foreign key (enfermeiro_id) references enfermeiro(id),
foreign key (paciente_id) references paciente(id),
foreign key (medico_id) references medico(id),
foreign key (quarto_id) references quarto(id)
);
