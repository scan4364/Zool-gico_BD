-- Achar funcionarios que nao tem supervisor
SELECT cpf, nome, sobrenome 
FROM Funcionario 
WHERE cpf_supervisor IS NULL;

-- Achar funcionarios que tem supervisor
SELECT cpf, nome, sobrenome 
FROM Funcionario 
WHERE cpf_supervisor IS NOT NULL;

-- Acha todos os funcionarios e os respectivos supervisores
SELECT F1.nome AS Funcionario, F2.nome AS Supervisor
FROM Funcionario F1
LEFT JOIN Funcionario F2 ON F1.cpf_supervisor = F2.cpf;

-- Nomes dos visitantes que compraram entradas, numero da entrada e data
SELECT V.nome, C.numero_entrada, C.dia_entrada
FROM Visitante V
INNER JOIN Compra C ON V.cpf = C.cpf;

-- Funcionarios cuja idade é maior que a média das idades dos funcionários
SELECT nome, idade 
FROM Funcionario 
WHERE idade > (SELECT AVG(idade) FROM Funcionario);

-- Funcionarios que tambem estao registrados como veterinario
SELECT nome, cpf 
FROM Funcionario 
WHERE cpf IN (SELECT cpf_funcionario FROM Veterinario);

-- Maiores habitats com apenas 1 animal
SELECT id, tamanho 
FROM Habitat 
WHERE tamanho >= ALL (
    SELECT tamanho 
    FROM Habitat 
    WHERE qtd_animais = 1
);

-- Animais que comem mais que pelo menos 1 animal
SELECT id_animal, quantidade 
FROM Alimentacao 
WHERE quantidade > ANY (
    SELECT quantidade 
    FROM Alimentacao
);