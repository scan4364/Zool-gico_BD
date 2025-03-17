-- Criação das tabelas(tabelas baseada no banco de dados original)
CREATE TABLE Alimentacao (
    id_animal INTEGER,
    horario_refeicao VARCHAR2(5),
    observacoes VARCHAR2(255),
    quantidade DECIMAL(10, 2),
    descricao VARCHAR2(255),
    CONSTRAINT alimentacao_pkey PRIMARY KEY (id_animal, horario_refeicao)
);
CREATE TABLE Funcionario (
    cpf INTEGER,
    cpf_supervisor INTEGER,
    email VARCHAR2(100),
    nome VARCHAR2(100),
    sobrenome VARCHAR(255),
    num_cart_trabalho INTEGER UNIQUE,
    idade INTEGER,
    data_nascimento DATE,
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf)
);
CREATE TABLE Telefone (
    cpf_funcionario INTEGER,
    ddd INTEGER,
    numero INTEGER,
    CONSTRAINT telefone_pkey PRIMARY KEY (ddd, numero),
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

-- Inserção de dados
INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (11122233344, NULL, 'joao.funcionario@zoo.com', 'João', 'Ferreira', 1001, 30, TO_DATE('1993-06-15', 'YYYY-MM-DD'));
INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (22233344455, 11122233344, 'maria.supervisor@zoo.com', 'Maria', 'Almeida', 1002, 40, TO_DATE('1983-09-20', 'YYYY-MM-DD'));
INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (11122233344, 01, 123456);
INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (11122233344, 03, 987654);
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (1, '08:00', 'Sem restrições', 3.50, 'Carne fresca');
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (1, '16:00', 'Sem restrições', 3.50, 'Carne fresca');

-- 1. EXCEPTION WHEN
DECLARE
    v_id_animal INTEGER := 20;
    v_horario_refeicao VARCHAR2(5) := '08:00';
    v_observacoes VARCHAR2(255) := 'Sem restrições';
    v_quantidade DECIMAL(10, 2) := 3.50;
    v_descricao VARCHAR2(255) := 'Carne fresca';
    v_id_animal_2 INTEGER := 1;
    v_horario_refeicao_2 VARCHAR2(5) := '08:00';
    v_observacoes_2 VARCHAR2(255) := 'Sem restrições';
    v_quantidade_2 DECIMAL(10, 2) := 3.50;
    v_descricao_2 VARCHAR2(255) := 'Carne fresca';
BEGIN
    INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
    VALUES (v_id_animal, v_horario_refeicao, v_observacoes, v_quantidade, v_descricao);
    DBMS_OUTPUT.PUT_LINE('Primeira refeição registrada com sucesso!');
    INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
    VALUES (v_id_animal_2, v_horario_refeicao_2, v_observacoes_2, v_quantidade_2, v_descricao_2);
    DBMS_OUTPUT.PUT_LINE('Segunda refeição registrada com sucesso!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Refeição já registrada para este animal neste horário.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro desconhecido: ' || SQLERRM);
END;
/

-- 2. USO DE PARÂMETROS (IN, OUT ou IN OUT)
CREATE OR REPLACE PROCEDURE AtualizarFuncionario(
    p_cpf IN Funcionario.cpf%TYPE,
    p_nova_idade IN INTEGER
) AS
BEGIN
    UPDATE Funcionario
    SET idade = p_nova_idade
    WHERE cpf = p_cpf;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Funcionário com CPF ' || p_cpf || ' não encontrado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Funcionário atualizado com sucesso. Nova idade: ' || p_nova_idade);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro desconhecido: ' || SQLERRM);
END;
/

-- Exemplo do procedimento
BEGIN
    AtualizarFuncionario(11122233344, 31);
END;
/

-- 3. CREATE OR REPLACE PACKAGE
CREATE OR REPLACE PACKAGE ZooPackage AS
    PROCEDURE InserirRefeicao(
        p_id_animal IN Alimentacao.id_animal%TYPE,
        p_horario_refeicao IN Alimentacao.horario_refeicao%TYPE,
        p_observacoes IN Alimentacao.observacoes%TYPE,
        p_quantidade IN Alimentacao.quantidade%TYPE,
        p_descricao IN Alimentacao.descricao%TYPE
    );
    FUNCTION ObterNomeFuncionario(p_cpf IN Funcionario.cpf%TYPE) RETURN VARCHAR2;
END ZooPackage;
/

-- 4. CREATE OR REPLACE PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY ZooPackage AS
    PROCEDURE InserirRefeicao(
        p_id_animal IN Alimentacao.id_animal%TYPE,
        p_horario_refeicao IN Alimentacao.horario_refeicao%TYPE,
        p_observacoes IN Alimentacao.observacoes%TYPE,
        p_quantidade IN Alimentacao.quantidade%TYPE,
        p_descricao IN Alimentacao.descricao%TYPE
    ) AS
    BEGIN
        INSERT INTO Alimentacao (
            id_animal, horario_refeicao, observacoes, quantidade, descricao
        ) VALUES (
            p_id_animal, p_horario_refeicao, p_observacoes, p_quantidade, p_descricao
        );
        DBMS_OUTPUT.PUT_LINE('Refeição registrada com sucesso!');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Erro: Refeição já registrada para este animal neste horário.');
    END InserirRefeicao;

    FUNCTION ObterNomeFuncionario(p_cpf IN Funcionario.cpf%TYPE) RETURN VARCHAR2 AS
        v_nome_completo VARCHAR2(255);
    BEGIN
        SELECT nome || ' ' || sobrenome INTO v_nome_completo
        FROM Funcionario
        WHERE cpf = p_cpf;
        RETURN v_nome_completo;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Funcionário não encontrado';
    END ObterNomeFuncionario;
END ZooPackage;
/

-- Exemplo de uso do pacote
BEGIN
    ZooPackage.InserirRefeicao(1, '09:00', 'Sem restrições', 4.00, 'Carne fresca');
    DBMS_OUTPUT.PUT_LINE(ZooPackage.ObterNomeFuncionario(11122233344));
END;
/

-- 5. CREATE OR REPLACE TRIGGER (COMANDO)
CREATE OR REPLACE TRIGGER ContarFuncionarios
AFTER INSERT ON Funcionario
DECLARE
    v_contador INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_contador FROM Funcionario;
    DBMS_OUTPUT.PUT_LINE('Total de funcionários no sistema: ' || v_contador);
END;
/

-- Testando o gatilho de comando
INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (33344455566, 11122233344, 'carlos.oliveira@zoo.com', 'Carlos', 'Oliveira', 1003, 35, TO_DATE('1988-07-10', 'YYYY-MM-DD'));

-- 6. CREATE OR REPLACE TRIGGER (LINHA)
CREATE OR REPLACE TRIGGER VerificarQuantidadeAlimentacao
BEFORE INSERT ON Alimentacao
FOR EACH ROW
BEGIN
    IF :NEW.quantidade > 50 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Quantidade de comida excede o limite permitido!');
    END IF;
END;
/

-- Testando o gatilho de linha
BEGIN
    INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
    VALUES (2, '10:00', 'Sem restrições', 60.00, 'Carne fresca'); -- Deve disparar o erro
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/