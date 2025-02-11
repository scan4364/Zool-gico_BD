--habitats grandes com mais de um animal agrupados por id usando view e having
CREATE VIEW HabitatsGrandes AS
SELECT id, MIN(tamanho) AS tamanho, SUM(qtd_animais) AS total_animais
FROM Habitat
WHERE tamanho >= 500
GROUP BY id
HAVING SUM(qtd_animais) > 1;

SELECT * FROM HabitatsGrandes;

--listagem dos animais mais velhos (pré-2019) usando union 
SELECT EXTRACT(YEAR FROM data_nascimento) AS ano, nome_popular
FROM Animal
WHERE EXTRACT(YEAR FROM data_nascimento) = 2014

UNION

SELECT EXTRACT(YEAR FROM data_nascimento) AS ano, nome_popular
FROM Animal
WHERE EXTRACT(YEAR FROM data_nascimento) = 2015

UNION

SELECT EXTRACT(YEAR FROM data_nascimento) AS ano, nome_popular
FROM Animal
WHERE EXTRACT(YEAR FROM data_nascimento) = 2016

UNION

SELECT EXTRACT(YEAR FROM data_nascimento) AS ano, nome_popular
FROM Animal
WHERE EXTRACT(YEAR FROM data_nascimento) = 2017

UNION

SELECT EXTRACT(YEAR FROM data_nascimento) AS ano, nome_popular
FROM Animal
WHERE EXTRACT(YEAR FROM data_nascimento) = 2018

