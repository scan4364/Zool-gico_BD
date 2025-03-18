--------------------------------------------------------------------------------
-- Criação de Objetos
--------------------------------------------------------------------------------

create or replace TYPE tp_visitante AS OBJECT (
    nome VARCHAR2(40),
    cpf VARCHAR2(11),
    data_nascimento date
)FINAL;

create or replace TYPE tp_promocao AS OBJECT (
    id VARCHAR2(12),
    requisito VARCHAR2(50),  
    data_de_inicio DATE,
    data_de_termino DATE,
    desconto INTEGER
);

create or replace TYPE tp_entrada AS OBJECT (
    data_visita DATE,
    numero_entrada VARCHAR2(15),
    tipo_entrada INTEGER,
    hora_entrada VARCHAR2(5)
);

create or replace TYPE tp_compra AS OBJECT (
    cpf_visitante VARCHAR2(11),  
    data_visita DATE,
    numero_entrada VARCHAR2(15),  
    id_promocao VARCHAR2(12) 
);

create or replace TYPE tp_fone AS OBJECT (
    ddd VARCHAR2(2),
    numero VARCHAR2(9)
);

create or replace TYPE nt_fones AS table OF tp_fone;


create or replace TYPE tp_funcionario AS OBJECT (
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
        telefone nt_fones,
        email VARCHAR2
    ) RETURN SELF AS RESULT
) NOT FINAL;

create or replace TYPE tp_tratador UNDER tp_funcionario (
);
    
create or replace TYPE tp_veterinario UNDER tp_funcionario (
);

create or replace TYPE tp_habitat AS OBJECT (
    id INTEGER,
    tamanho DECIMAL(10, 2),
    data_ultima_manutencao DATE,
    intervalo_manutencao INTEGER,
    qtd_animais INTEGER,

    MEMBER FUNCTION calcular_intervalo_manutencao RETURN INTEGER
);

create or replace type tp_nome_popular as object (
    nome varchar2 (20),
    regiao varchar2 (30)
);

create or replace type varray_nome_popular as VARRAY(5) of tp_nome_popular;

CREATE OR REPLACE TYPE tp_animal AS OBJECT (
    id INTEGER,
    mae REF tp_animal,           
    nome_cientifico VARCHAR2(100), 
    nomes_populares varray_nome_popular, 
    nome_proprio VARCHAR2(100), 
    genero VARCHAR2(10),
    habitat REF tp_habitat,
    CONSTRUCTOR FUNCTION tp_funcionario (
        id INTEGER,           
        nome_cientifico VARCHAR2(100), 
        nomes_populares varray_nome_popular, 
        nome_proprio VARCHAR2(100), 
        genero VARCHAR2(10),
        habitat REF tp_habitat,
    ) RETURN SELF AS RESULT        
);

CREATE OR REPLACE TYPE tp_alimentacao AS OBJECT (
    id_animal INTEGER,     
    descricao VARCHAR2(255),
    horario_refeicao VARCHAR2(5),
    observacoes VARCHAR2(255),
    quantidade DECIMAL(10, 2),

    MEMBER PROCEDURE obter_ultima_refeicao (p_id_animal VARCHAR2)
);

create or replace TYPE tp_consulta AS OBJECT (
    id_animal INTEGER,       
    cpf_veterinario VARCHAR2(11), 
    data_consulta DATE,            
    diagnostico VARCHAR2(255),     
    observacoes VARCHAR2(255),     

    MAP MEMBER FUNCTION get_observacoes RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY tp_consulta AS
    MAP MEMBER FUNCTION get_observacoes RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.observacoes; 
    END;
END;

CREATE OR REPLACE TYPE tp_medicamento AS OBJECT (
    nome VARCHAR2(50),
    dosagem VARCHAR2(20)
)

CREATE OR REPLACE TYPE tp_tratamento AS OBJECT (
    id_animal INTEGER,       
    cpf_veterinario VARCHAR2(11),
    nome VARCHAR2(50),
    dosagem VARCHAR2(20),
    data_hora TIMESTAMP
)


--------------------------------------------------------------------------------
-- Criação de Tabelas
--------------------------------------------------------------------------------

CREATE TABLE visitante OF tp_visitante;
ALTER TABLE visitante ADD CONSTRAINT pk_visitante PRIMARY KEY (cpf);

CREATE TABLE entrada OF tp_entrada;
ALTER TABLE entrada ADD CONSTRAINT pk_entrada PRIMARY KEY (numero_entrada, data_visita);

CREATE TABLE promocao OF tp_promocao;
ALTER TABLE promocao ADD CONSTRAINT pk_promocao PRIMARY KEY (id);

CREATE TABLE compra (
    CONSTRAINT pk_compra PRIMARY KEY (cpf_visitante, num_entrada, data_visita, id_promocao),
    CONSTRAINT fk1_compra FOREIGN KEY (cpf_visitante) REFERENCES visitante(cpf),
    CONSTRAINT fk2_compra FOREIGN KEY (num_entrada, data_visita) REFERENCES entrada(num_entrada, data_visita),
    CONSTRAINT fk3_compra FOREIGN KEY (id_promocao) REFERENCES promocao(id)
);

CREATE TABLE funcionario OF tp_funcionario (
    cpf PRIMARY KEY,
    supervisor WITH ROWID REFERENCES funcionario
) NESTED TABLE telefones STORE AS nt_fones;


CREATE TABLE tratadores OF tp_tratador (
    cpf PRIMARY KEY
);

CREATE TABLE veterinarios OF tp_veterinario (
    cpf PRIMARY KEY
);

CREATE TABLE habitat OF tp_habitat (
    id PRIMARY KEY
);

CREATE TABLE animal OF tp_animal (
    id PRIMARY KEY,
    mae REF tp_animal SCOPE IS animal
);

create table alimentacao of tp_alimentacao(
    CONSTRAINT pk_alimentacao PRIMARY KEY (id_animal, horario_refeicao),
    CONSTRAINT fk_alimentecao FOREIGN KEY (id_animal) REFERENCES animal(id)
);

CREATE OR REPLACE TYPE BODY tp_alimentacao AS
    STATIC PROCEDURE obter_ultima_refeicao (p_id_animal VARCHAR2) IS
        v_horario VARCHAR2(5);
    BEGIN
        SELECT MAX(horario_refeicao)
        INTO v_horario
        FROM alimentacao a
        WHERE DEREF(a.id_animal).id = p_id_animal;

        IF v_horario IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Última refeição do animal ' || p_id_animal || ': ' || v_horario);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Nenhuma refeição encontrada para o animal ' || p_id_animal);
        END IF;
    END;
END;
/
