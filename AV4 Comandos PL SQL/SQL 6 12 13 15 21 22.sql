-- SELECT-FROM-WHERE

--Listar visitantes nascidos antes de 1990
SELECT cpf, nome, sobrenome, data_nascimento
FROM Visitante
WHERE data_nascimento < TO_DATE('1990-01-01', 'YYYY-MM-DD');

--Listar entradas de um determinado tipo
SELECT numero_entrada, dia_entrada, tipo_entrada, hora_entrada
FROM Entrada
WHERE tipo_entrada = 'Família';

-- MAX

--Obter maior habitat do zoológico
SELECT MAX(tamanho) AS maior_habitat
FROM Habitat;

--Considerando hoje 10/04/2024, obter o habitat há mais tempo sem manutenção
SELECT h.id AS habitat_id,
       h.tamanho,
       (TO_DATE('2024-04-10', 'YYYY-MM-DD') - h.ultima_manutencao) AS dias_sem_manutencao
FROM Habitat h
WHERE (TO_DATE('2024-04-10', 'YYYY-MM-DD') - h.ultima_manutencao) = (
    SELECT MAX(TO_DATE('2024-04-10', 'YYYY-MM-DD') - ultima_manutencao)
    FROM Habitat
);


--Habitat com maior número de animais
SELECT MAX(qtd_animais) AS habitat_mais_populoso
FROM Habitat;

-- MIN

-- Menor habitat do zoológico
SELECT MIN(tamanho) AS menor_tamanho
FROM Habitat;

-- Habitat que precisa de manutenções mais frequentes
SELECT MIN(intervalo_manutencao) AS menor_intervalo
FROM Habitat;

-- COUNT

-- Total da animais cadastrados no zoológico
SELECT COUNT(*) AS total_animais
FROM Animal;

-- ORDER BY

-- Promoções ordenadas pela sua data de início
SELECT id, data_inicio, data_termino, requisitos, desconto
FROM Promocao
ORDER BY data_inicio DESC;

-- Ordenar visitantes pelo nome completo
SELECT cpf, nome || ' ' || sobrenome AS nome_completo, data_nascimento
FROM Visitante
ORDER BY nome_completo ASC;

-- GROUP BY

-- Agrupar todas as entradas de cada dia
SELECT dia_entrada, COUNT(*) AS total_entradas
FROM Entrada
GROUP BY dia_entrada
ORDER BY dia_entrada;

-- Agrupar os animais do zoológico em machos e fêmeas
SELECT genero, COUNT(*) AS total_animais
FROM Animal
GROUP BY genero;
