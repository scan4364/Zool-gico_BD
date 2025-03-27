--------------------------------------------------------------------------------
-- Criação de Objetos
--------------------------------------------------------------------------------
CREATE SEQUENCE promocao_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE habitat_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE animal_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE manutencao_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

create or replace TYPE tp_visitante AS OBJECT (
    nome VARCHAR2(40),
    cpf VARCHAR2(11),
    data_nascimento date
)FINAL;
/

create or replace TYPE tp_promocao AS OBJECT (
    id VARCHAR2(12),
    requisito VARCHAR2(50),  
    data_de_inicio DATE,
    data_de_termino DATE,
    desconto INTEGER
);
/
create or replace TYPE tp_entrada AS OBJECT (
    data_visita DATE,
    numero_entrada VARCHAR2(15),
    tipo_entrada INTEGER,
    hora_entrada VARCHAR2(5)
);
/

CREATE OR REPLACE TYPE tp_data_carteira AS OBJECT (
	num_carteira_trabalho INTEGER,
    data_carteira DATE
);
/
create or replace TYPE tp_compra AS OBJECT (
    cpf_visitante VARCHAR2(11),  
    data_visita DATE,
    numero_entrada VARCHAR2(15),  
    id_promocao VARCHAR2(12) 
);
/
create or replace TYPE tp_fone AS OBJECT (
    ddd VARCHAR2(2),
    numero VARCHAR2(9)
);
/
create or replace TYPE nt_fones AS table OF tp_fone;
/
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    supervisor REF tp_funcionario,
    cpf VARCHAR2(11),
    nome VARCHAR2(100),
    sobrenome VARCHAR2(100),
    num_carteira_trabalho INTEGER,
    idade INTEGER,
    data_nascimento DATE,
    telefones nt_fones,
    email VARCHAR2(150),
    CONSTRUCTOR FUNCTION tp_funcionario (
        cpf VARCHAR2,
        nome VARCHAR2,
        sobrenome VARCHAR2,
        num_carteira_trabalho INTEGER,
        idade INTEGER,
        data_nascimento DATE,
        telefones nt_fones,
        email VARCHAR2
    ) RETURN SELF AS RESULT,
    MEMBER FUNCTION exibir_dados RETURN VARCHAR2
) NOT INSTANTIABLE NOT FINAL;
/
CREATE OR REPLACE TYPE BODY tp_funcionario AS
    CONSTRUCTOR FUNCTION tp_funcionario (
        cpf VARCHAR2,
        nome VARCHAR2,
        sobrenome VARCHAR2,
        num_carteira_trabalho INTEGER,
        idade INTEGER,
        data_nascimento DATE,
        telefones nt_fones,
        email VARCHAR2
    ) RETURN SELF AS RESULT IS
    BEGIN
        SELF.cpf := cpf;
        SELF.nome := nome;
        SELF.sobrenome := sobrenome;
        SELF.num_carteira_trabalho := num_carteira_trabalho;
        SELF.idade := idade;
        SELF.data_nascimento := data_nascimento;
        SELF.telefones := telefones;
        SELF.email := email;
        RETURN;
    END;
    
    MEMBER FUNCTION exibir_dados RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Funcionário: ' || SELF.nome || ' ' || SELF.sobrenome || ' CPF: ' || SELF.cpf;
    END;
END;
/
CREATE OR REPLACE TYPE tp_tratador UNDER tp_funcionario (
    OVERRIDING MEMBER FUNCTION exibir_dados RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_tratador AS
    OVERRIDING MEMBER FUNCTION exibir_dados RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Tratador: ' || SELF.nome || ' ' || SELF.sobrenome || ' CPF: ' || SELF.cpf;
    END;
END;
/
CREATE OR REPLACE TYPE tp_veterinario UNDER tp_funcionario (
    OVERRIDING MEMBER FUNCTION exibir_dados RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_veterinario AS
    OVERRIDING MEMBER FUNCTION exibir_dados RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Veterinário: ' || SELF.nome || ' ' || SELF.sobrenome || ' CPF: ' || SELF.cpf;
    END;
END;
/
create or replace TYPE tp_habitat AS OBJECT (
    id INTEGER,
    tamanho DECIMAL(10, 2),
    data_ultima_manutencao DATE,
    intervalo_manutencao INTEGER,
    qtd_animais INTEGER,

    MEMBER FUNCTION calcular_intervalo_manutencao RETURN INTEGER
);
/

create or replace type tp_nome_popular as object (
    nome varchar2 (20),
    regiao varchar2 (30)
);
/
create or replace type varray_nome_popular as VARRAY(5) of tp_nome_popular;
/
CREATE OR REPLACE TYPE tp_animal AS OBJECT (
    id INTEGER,
    mae REF tp_animal,           
    nome_cientifico VARCHAR2(100), 
    nomes_populares varray_nome_popular, 
    nome_proprio VARCHAR2(100), 
    genero VARCHAR2(10),
    habitat REF tp_habitat,
    CONSTRUCTOR FUNCTION tp_animal (
        id INTEGER,           
        nome_cientifico VARCHAR2, 
        nomes_populares varray_nome_popular, 
        nome_proprio VARCHAR2, 
        genero VARCHAR2,
        habitat REF tp_habitat
    ) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE tp_alimentacao AS OBJECT (
    id_animal INTEGER,     
    descricao VARCHAR2(255),
    horario_refeicao VARCHAR2(5),
    observacoes VARCHAR2(255),
    quantidade DECIMAL(10, 2),

    MEMBER PROCEDURE obter_ultima_refeicao (p_id_animal INTEGER)
);
/
create or replace TYPE tp_consulta AS OBJECT (
    id_animal INTEGER,       
    cpf_veterinario VARCHAR2(11), 
    data_hora TIMESTAMP,     
    observacoes VARCHAR2(255),     
    MAP MEMBER FUNCTION get_observacoes RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_consulta AS
    MAP MEMBER FUNCTION get_observacoes RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.observacoes; 
    END;
END;
/
CREATE OR REPLACE TYPE tp_medicamento AS OBJECT (
    nome VARCHAR2(50),
    dosagem VARCHAR2(20)
);
/
CREATE OR REPLACE TYPE tp_tratamento AS OBJECT (
    id_animal INTEGER,       
    cpf_veterinario VARCHAR2(11),
    nome VARCHAR2(50),
    dosagem VARCHAR2(20),
    data_hora TIMESTAMP, 
    ORDER MEMBER FUNCTION ordem_animal (outro tp_tratamento) RETURN INTEGER
);
/
CREATE OR REPLACE TYPE BODY tp_tratamento AS 
    ORDER MEMBER FUNCTION ordem_animal (outro tp_tratamento) RETURN INTEGER IS
    BEGIN
        IF id_animal < outro.id_animal THEN
            RETURN -1;
        ELSIF id_animal > outro.id_animal THEN
            RETURN 1;  
        ELSE
            RETURN 0;  
        END IF;
    END ordem_animal;
END;
/
CREATE OR REPLACE TYPE tp_manutencao AS OBJECT (
    id_habitat INTEGER,
    tipo VARCHAR2(100)
);
/
CREATE OR REPLACE TYPE tp_manutencao_tratadores AS OBJECT (
    id_habitat INTEGER,
    cpf_tratador VARCHAR2(11)
);
/
CREATE OR REPLACE TYPE tp_contrato AS OBJECT (
    num_carteira INTEGER,
    data_contrato DATE
);

/
--------------------------------------------------------------------------------
-- Criação de Tabelas
--------------------------------------------------------------------------------

CREATE TABLE visitante OF tp_visitante;
ALTER TABLE visitante ADD CONSTRAINT pk_visitante PRIMARY KEY (cpf);
/
CREATE TABLE entrada OF tp_entrada;
ALTER TABLE entrada ADD CONSTRAINT pk_entrada PRIMARY KEY (numero_entrada, data_visita);
/
CREATE TABLE promocao OF tp_promocao;
ALTER TABLE promocao ADD CONSTRAINT pk_promocao PRIMARY KEY (id);
/
CREATE TABLE compra OF tp_compra(
    CONSTRAINT pk_compra PRIMARY KEY (cpf_visitante, numero_entrada, data_visita, id_promocao),
    CONSTRAINT fk1_compra FOREIGN KEY (cpf_visitante) REFERENCES visitante(cpf),
    CONSTRAINT fk2_compra FOREIGN KEY (numero_entrada, data_visita) REFERENCES entrada(numero_entrada, data_visita),
    CONSTRAINT fk3_compra FOREIGN KEY (id_promocao) REFERENCES promocao(id)
);
/
CREATE TABLE funcionario OF tp_funcionario (
    cpf PRIMARY KEY,
    supervisor WITH ROWID REFERENCES funcionario,
    num_carteira_trabalho UNIQUE
) NESTED TABLE telefones STORE AS tabela_telefones;
/

CREATE TABLE tratadores OF tp_tratador (
    cpf PRIMARY KEY,
    num_carteira_trabalho UNIQUE
) NESTED TABLE telefones STORE AS tabela_telefones_tratadores;
/
CREATE TABLE veterinarios OF tp_veterinario (
    cpf PRIMARY KEY,
    num_carteira_trabalho UNIQUE
) NESTED TABLE telefones STORE AS tabela_telefones_veterinarios;
/
CREATE TABLE habitat OF tp_habitat (
    id PRIMARY KEY
);
/
CREATE TABLE animal OF tp_animal (
    id PRIMARY KEY,
    mae SCOPE IS animal
);
/
CREATE TABLE medicamento OF tp_medicamento(
    CONSTRAINT pk_medicamento PRIMARY KEY (nome, dosagem)
);
/
CREATE TABLE consulta OF tp_consulta (
    CONSTRAINT pk_consulta PRIMARY KEY (id_animal, cpf_veterinario, data_hora),
    CONSTRAINT fk1_consulta FOREIGN KEY (id_animal) REFERENCES animal(id),
    CONSTRAINT fk2_consulta FOREIGN KEY (cpf_veterinario) REFERENCES veterinarios(cpf)
);
/
CREATE TABLE tratamento OF tp_tratamento (
    CONSTRAINT pk_tratamento PRIMARY KEY (id_animal, cpf_veterinario, nome, dosagem, data_hora),
    CONSTRAINT fk1_tratamento FOREIGN KEY (nome, dosagem) REFERENCES medicamento(nome, dosagem),
    CONSTRAINT fk2_tratamento FOREIGN KEY (id_animal, cpf_veterinario, data_hora) REFERENCES Consulta(id_animal, cpf_veterinario, data_hora)
);
/
CREATE TABLE manutencao OF tp_manutencao (
    id_habitat PRIMARY KEY,
    CONSTRAINT fk_manutencao FOREIGN KEY (id_habitat) REFERENCES habitat(id)
);
/
CREATE TABLE manutencao_tratadores OF tp_manutencao_tratadores (
    CONSTRAINT pk_man_trat PRIMARY KEY (id_habitat, cpf_tratador),
    CONSTRAINT fk1_man_trat FOREIGN KEY (id_habitat) REFERENCES habitat(id),
    CONSTRAINT fk2_man_trat FOREIGN KEY (cpf_tratador) REFERENCES tratadores(cpf)
);
/
CREATE TABLE data_contrato OF tp_contrato (
    CONSTRAINT pf_dt_cont PRIMARY KEY (num_carteira),
    CONSTRAINT fk_dt_cont FOREIGN KEY (num_carteira) REFERENCES tratadores(num_carteira_trabalho)
);
/
CREATE TABLE alimentacao OF tp_alimentacao(
    CONSTRAINT pk_alimentacao PRIMARY KEY (id_animal, horario_refeicao),
    CONSTRAINT fk_alimentecao FOREIGN KEY (id_animal) REFERENCES animal(id)
);
/
CREATE OR REPLACE TYPE BODY tp_alimentacao AS
    MEMBER PROCEDURE obter_ultima_refeicao (p_id_animal INTEGER) IS
        v_horario VARCHAR2(5);
    BEGIN
        SELECT MAX(horario_refeicao)
        INTO v_horario
        FROM alimentacao a
        WHERE a.id_animal = p_id_animal;
 
        IF v_horario IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Última refeição do animal ' || TO_CHAR(p_id_animal) || ': ' || v_horario);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Nenhuma refeição encontrada para o animal ' || p_id_animal);
        END IF;
    END;
END;
/