--------------------------------------------------------------------------------
-- Criação de Objetos
--------------------------------------------------------------------------------

create or replace TYPE tp_email AS OBJECT (
    email VARCHAR2(100)
);

create or replace type varray_email as varray(50) of tp_email;

create or replace TYPE tp_visitante AS OBJECT (
    nome VARCHAR2(40),
    cpf VARCHAR2(11),
    data_de_visita date,
    email varray_email
)FINAL;

create or replace TYPE tp_promocao AS OBJECT (
    id VARCHAR2(12),
    requisito VARCHAR2(50),  
    data_de_inicio DATE,
    data_de_termino DATE,
    desconto NUMBER
);

create or replace TYPE tp_entrada AS OBJECT (
    data DATE,
    numero_entrada VARCHAR2(15),
    tipo_entrada NUMBER,
    hora_entrada VARCHAR2(50)
);

create or replace TYPE tp_compra AS OBJECT (
    cpf_visitante VARCHAR2(11),  
    num_entrada VARCHAR2(15),  
    id_promocao VARCHAR2(12) 
);

create or replace TYPE tp_funcionario AS OBJECT (
    oid REF tp_funcionario,
    cpf VARCHAR2(11),
    nome VARCHAR2(100),
    sobrenome VARCHAR2(100),
    data_contrato DATE,
    idade NUMBER,
    telefone VARCHAR2(15),
    email VARCHAR2(150),
    CONSTRUCTOR FUNCTION tp_funcionario (
        cpf VARCHAR2,
        nome VARCHAR2,
        sobrenome VARCHAR2,
        data_contrato DATE,
        idade NUMBER,
        telefone VARCHAR2,
        email VARCHAR2
    ) RETURN SELF AS RESULT
) NOT FINAL;

create or replace TYPE tp_tratador UNDER tp_funcionario (
);
    
create or replace TYPE tp_veterinario UNDER tp_funcionario (
);


--------------------------------------------------------------------------------
-- Criação de Tabelas
--------------------------------------------------------------------------------

CREATE TABLE visitante OF tp_visitante;
ALTER TABLE visitante ADD CONSTRAINT pk_visitante PRIMARY KEY (cpf);

CREATE TABLE entrada OF tp_entrada;
ALTER TABLE entrada ADD CONSTRAINT pk_entrada PRIMARY KEY (numero_entrada);

CREATE TABLE promocao OF tp_promocao;
ALTER TABLE promocao ADD CONSTRAINT pk_promocao PRIMARY KEY (id);

CREATE TABLE compra (
    cpf_visitante REF tp_visitante SCOPE IS visitantes,
    num_entrada REF tp_entrada SCOPE IS entrada,
    id_promocao REF tp_promocao SCOPE IS promocao
);

CREATE TABLE funcionario OF tp_funcionario (
    cpf PRIMARY KEY,
    oid WITH ROWID REFERENCES tp_funcionario
) OBJECT IDENTIFIER IS SYSTEM GENERATED;


-- Tabela para armazenar objetos do tipo tp_tratador
CREATE TABLE tratadores OF tp_tratador (
    cpf PRIMARY KEY
);

-- Tabela para armazenar objetos do tipo tp_veterinario
CREATE TABLE veterinarios OF tp_veterinario (
    cpf PRIMARY KEY
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela Visitante
--------------------------------------------------------------------------------

insert into visitante 
values (tp_visitante(
    'João', 
    '12345678901', 
    TO_DATE('2013-05-10', 'YYYY-MM-DD'), 
    varray_email(tp_email('joao@email.com'))  
));

insert into visitante 
values (tp_visitante(
    'Timoteo', 
    '38517646589', 
    TO_DATE('1995-12-27', 'YYYY-MM-DD'),
    varray_email(tp_email('timoteo@email.com'))  
));

insert into visitante (cpf,nome, data_de_visita, email)
values (
    '98765432101',
    'Maria',
    TO_DATE('1995-08-25', 'YYYY-MM-DD'),
    varray_email(tp_email('maria@email.com'))
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela promoção
--------------------------------------------------------------------------------

CREATE SEQUENCE promocao_seq START WITH 1 INCREMENT BY 1

insert into promocao values (
    tp_promocao(promocao_seq.NEXTVAL, 'estudantes', to_date('2024-07-01', 'yyyy-mm-dd'), to_date('2024-07-15', 'yyyy-mm-dd'), 20.00)
);

insert into promocao values (
     tp_promocao(promocao_seq.NEXTVAL, 'Nenhum requisito', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2030-01-01', 'YYYY-MM-DD'), 0.00)
);

insert into promocao values (
    tp_promocao(promocao_seq.NEXTVAL, 'Idade < 12', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 50.00)
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela entrada
--------------------------------------------------------------------------------

insert into entrada (data, numero_entrada, tipo_entrada, hora_entrada) values (
    TO_DATE('2024-03-01', 'YYYY-MM-DD'),
    '1',
    1,
    '10:00:00'
);


--------------------------------------------------------------------------------
-- Inserindo dados na funcionario
--------------------------------------------------------------------------------

-- Inserir joao (sem supervisor)
insert into funcionarios
values (
    tp_funcionario(
        NULL, -- NULL significa que não tem supervisor
        '11122233344',
        'João',
        'Ferreira',
        TO_DATE('1993-06-15', 'YYYY-MM-DD'),
        30,
        '(11) 99999-1111',
        'joao.funcionario@zoo.com'
    )
);

-- Inserir ana (supervisionado por joao)
insert into funcionarios
values (
    tp_funcionario(
        (SELECT REF(f) FROM funcionarios f WHERE f.cpf = '11122233344'), -- Referência ao oid de Ana
        '22233344455',
        'Maria',
        'Almeida',
        TO_DATE('1983-09-20', 'YYYY-MM-DD'),
        40,
        '(11) 98765-4321',
        'maria.supervisor@zoo.com'
    )
);

