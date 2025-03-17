-- tabela Visitante (baseada no banco de dados)
CREATE TABLE Visitante (
    cpf INTEGER,
    nome VARCHAR2(20),
    sobrenome VARCHAR2(20),
    data_nascimento DATE,
    CONSTRAINT visitante_pkey PRIMARY KEY (cpf)
);

-- 2. dados iniciais(baseado no banco de dados)
INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (12345678901, 'Joao', 'Silva', TO_DATE('2014-05-10', 'YYYY-MM-DD'));
INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (98765432101, 'Maria', 'Santos', TO_DATE('1995-08-25', 'YYYY-MM-DD'));

-- Criar o usuário com o prefixo C##

-- CREATE USER C##usuario_teste IDENTIFIED BY 111;

-- Conceder permissão para conectar ao banco de dados
-- GRANT CREATE SESSION TO C##usuario_teste;

-- conceder permissão de INSERT na tabela Visitante
-- GRANT INSERT ON <esquema>.Visitante TO C##usuario_teste;

-- Testar o acesso do usuário: Inserir um novo visitante
-- CONNECT C##usuario_teste/111@<servico>;

-- dado inserido pelo usuario 
INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (99999999999, 'Cobaia', 'Teste', SYSDATE);

-- Desconectar o usuário_teste
-- DISCONNECT;

-- 6. Revogar a permissão 
--CONNECT sys/<senha>@<servico> AS SYSDBA;

--REVOKE INSERT ON <esquema>.Visitante FROM C##usuario_teste;

-- Tentar inserir novamente (simulando revogação de permissões)
BEGIN
    INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
    VALUES (11111111111, 'error', 'error', SYSDATE);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Permissão insuficiente.');
END;
/

SELECT * FROM Visitante;