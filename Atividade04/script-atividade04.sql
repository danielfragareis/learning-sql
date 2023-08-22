use hospital;

-- 1. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.

UPDATE `hospital`.`consulta` SET `convenio_id` = '1' WHERE (`id` = '1');
UPDATE `hospital`.`consulta` SET `convenio_id` = '3' WHERE (`id` = '2');
UPDATE `hospital`.`consulta` SET `convenio_id` = '3' WHERE (`id` = '5');
UPDATE `hospital`.`consulta` SET `convenio_id` = '2' WHERE (`id` = '6');
UPDATE `hospital`.`consulta` SET `convenio_id` = '1' WHERE (`id` = '10');
UPDATE `hospital`.`consulta` SET `convenio_id` = '3' WHERE (`id` = '13');

select  *, (select avg(valor) from consulta  where valor > 1 and year(data_hora) = 2020) as media_consultas from consulta where valor > 1 and not(convenio_id is null) and year(data_hora) = 2020;

-- 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

select * from internacao where data_saida_prevista < data_saida_efetiva;

-- 3. Receituário completo da primeira consulta registrada com receituário associado.

select * from receita where id = (select min(receita_id) from consulta);

-- 4. Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).

select * from consulta where valor = (select max(valor) from consulta) or valor = (select min(valor) from consulta) order by valor desc;

-- 5. Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.

select internacao.*, (valor_diaria * (data_saida_efetiva - data_entrada)) as total from internacao join (select quarto.id, valor_diaria from quarto join tipo_quarto on quarto.tipo_quarto_id = tipo_quarto.id) as dados on internacao.quarto_id = dados.id order by id;

-- 6. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

select data_entrada, procedimento, quarto.numero from internacao join quarto on quarto.id = internacao.quarto_id where quarto.tipo_quarto_id = 1 order by data_entrada desc;

-- 7. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.

UPDATE `hospital`.`paciente` SET `nascimento` = '2014-10-24' WHERE (`id` = '1');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-05-16' WHERE (`id` = '2');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-09-23' WHERE (`id` = '3');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-05-11' WHERE (`id` = '4');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-03-01' WHERE (`id` = '5');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-11-01' WHERE (`id` = '6');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-01-10' WHERE (`id` = '7');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-08-05' WHERE (`id` = '8');
UPDATE `hospital`.`paciente` SET `nascimento` = '2014-03-25' WHERE (`id` = '9');

select funcao.descricao_especialidade, date(consulta.data_hora) as data, paciente.nome, timestampdiff(year, paciente.nascimento,consulta.data_hora) as idade from consulta join paciente on consulta.paciente_id = paciente.id and consulta.funcao_id <> 1 join funcao on consulta.funcao_id = funcao.id where timestampdiff(year, paciente.nascimento,consulta.data_hora) <= 18 order by data desc;

-- 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.

select paciente.nome as paciente, medico.nome as medico, internacao.data_entrada, internacao.procedimento from internacao join paciente on internacao.paciente_id = paciente.id join medico_especialidade on internacao.medico_especialidade_id = medico_especialidade.id join medico on medico_especialidade.id = medico.id join funcao on medico_especialidade.funcao_id = funcao.id where internacao.medico_especialidade_id = 4 and internacao.quarto_id = 3;

-- 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.

select medico.nome, medico.crm, count(consulta.id) as total_consultas from consulta join medico_especialidade on consulta.medico_especialidade_id = medico_especialidade.id join medico on medico_especialidade.medico_id = medico.id group by medico.nome, medico.crm order by medico.nome;

-- 10.Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

select enfermeiro.nome, enfermeiro.cre, count(dci.enfermeiro_id) as participacao_internacao from dados_completos_internacao as dci join enfermeiro on dci.enfermeiro_id = enfermeiro.id or dci.enfermeiro_aux_id = enfermeiro.id group by enfermeiro.nome, enfermeiro.cre, enfermeiro.id order by enfermeiro.nome;







