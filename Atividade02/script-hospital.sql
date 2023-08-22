create database hospital;
use hospital;

create table medico (
id int not null auto_increment,
nome varchar(100) not null,
cpf varchar(45) not null,
rg varchar(45) not null,
crm varchar(45) not null,
nascimento date not null,
telefone varchar(45) not null,
endereco varchar(100) not null,
primary key (id),
unique key (cpf, rg, crm)
); 

create table funcao (
id int not null auto_increment,
descricao_especialidade varchar(100) not null,
primary key (id)
);

create table tipo_quarto (
id int not null auto_increment,
descricao varchar(255) not null,
valor_diaria decimal(9,2) unsigned not null,
primary key (id)
);

create table convenio(
id int not null auto_increment,
nome varchar(100) not null,
cnpj varchar(20) not null,
carencia int unsigned not null,
primary key (id),
unique key (nome, cnpj)
);

create table enfermeiro (
id int not null auto_increment,
nome varchar(100) not null,
cpf varchar(45) not null,
cre varchar(45) not null,
primary key (id),
unique key(cpf, cre)
);

create table medico_especialidade (
id int not null auto_increment,
medico_id int not null,
funcao_id int not null,
primary key (id),
foreign key (medico_id) references medico(id),
foreign key (funcao_id) references funcao(id)
);

create table paciente (
id int auto_increment not null,
nome varchar(100) not null,
nascimento date not null,
rua varchar(50) not null,
cidade varchar(45) not null,
estado varchar(45) not null,
telefone varchar(45) not null,
email varchar(100),
cpf varchar(45) not null,
rg varchar(45) not null,
convenio_id int,
numero_carteira varchar(45),
primary key (id),
unique key (cpf, rg),
foreign key (convenio_id) references convenio(id)
);

create table quarto (
id int not null auto_increment,
numero int unsigned not null,
tipo_quarto_id int not null,
primary key (id),
foreign key (tipo_quarto_id) references tipo_quarto(id)
);

create table receita (
id int not null auto_increment,
medicamentos varchar(100) not null,
quantidade varchar(100) not null,
instrucoes_de_uso tinytext not null,
primary key (id)
);

create table consulta (
id int not null auto_increment,
data_hora datetime not null,
valor decimal(9,2),
medico_especialidade_id int not null,
paciente_id int not null,
convenio_id int,
funcao_id int not null,
receita_id int,
primary key (id),
foreign key (receita_id) references receita(id),
foreign key (paciente_id) references paciente(id),
foreign key (medico_especialidade_id) references medico_especialidade(id),
foreign key (convenio_id) references convenio(id),
foreign key (funcao_id) references funcao(id)
);



create table internacao (
id int not null auto_increment,
data_entrada date not null,
data_saida_prevista date not null,
data_saida_efetiva date not null, 
procedimento text not null,
paciente_id int not null,
medico_especialidade_id int not null,
quarto_id int not null,
primary key (id),
foreign key (medico_especialidade_id) references medico_especialidade(id),
foreign key (paciente_id) references paciente(id),
foreign key (quarto_id) references quarto(id)
);

create table dados_completos_internacao (
id int not null auto_increment,
internacao_id int not null,
enfermeiro_id int not null,
primary key (id),
foreign key (internacao_id) references internacao(id),
foreign key (enfermeiro_id) references enfermeiro(id)
);
