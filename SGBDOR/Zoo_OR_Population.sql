--------------------------------------------------------------------------------
-- Inserindo dados na tabela Visitante
--------------------------------------------------------------------------------

insert into visitante 
values (tp_visitante(
    'João', 
    '12345678901', 
    TO_DATE('2013-05-10', 'YYYY-MM-DD')
));

insert into visitante 
values (tp_visitante(
    'Timoteo', 
    '38517646589', 
    TO_DATE('1995-12-27', 'YYYY-MM-DD')
));

insert into visitante (cpf,nome, data_de_visita, email)
values (
    '98765432101',
    'Maria',
    TO_DATE('1995-08-25', 'YYYY-MM-DD')
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela promoção
--------------------------------------------------------------------------------

CREATE SEQUENCE promocao_seq START WITH 1 INCREMENT BY 1;

INSERT INTO promocao (id, requisito, data_de_inicio, data_de_termino, desconto) 
VALUES (
    promocao_seq.NEXTVAL, 'estudantes', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 20
);

INSERT INTO promocao (id, requisito, data_de_inicio, data_de_termino, desconto) 
VALUES (
    promocao_seq.NEXTVAL, 'Nenhum requisito', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2030-01-01', 'YYYY-MM-DD'), 0
);

INSERT INTO promocao (id, requisito, data_de_inicio, data_de_termino, desconto) 
VALUES (
    promocao_seq.NEXTVAL, 'Idade < 12', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 50
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela entrada
--------------------------------------------------------------------------------

CREATE SEQUENCE entrada_seq START WITH 1 INCREMENT BY 1;

insert into entrada (data_visita, numero_entrada, tipo_entrada, hora_entrada) values (
    TO_DATE('2024-03-01', 'YYYY-MM-DD'),
    entrada_seq.NEXTVAL,
    1,
    '10:00'
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela compra
--------------------------------------------------------------------------------

insert into compra (cpf_visitante, numero_entrada, id_promocao) values (
    (SELECT REF(v) FROM visitante v WHERE v.cpf = '12345678901'),
    (SELECT REF(e) FROM entrada e WHERE e.data_visita = TO_DATE('2024-03-01', 'YYYY-MM-DD') 
      AND e.numero_entrada = (SELECT MAX(numero_entrada) FROM entrada WHERE data_visita = TO_DATE('2024-03-01', 'YYYY-MM-DD'))),
    NULL
);


--------------------------------------------------------------------------------
-- Inserindo dados na tabela funcionario
--------------------------------------------------------------------------------

-- Inserir João (sem supervisor)
INSERT INTO funcionario
VALUES (
    tp_funcionario(
        NULL,
        '11122233344',
        'João',
        'Ferreira',
        123456,
        30,
        TO_DATE('1993-06-15', 'YYYY-MM-DD'),
        nt_fones(tp_fone('11', '999991111')),
        'joao.funcionario@zoo.com'
    )
);

-- Inserir Maria (supervisionada por João)
INSERT INTO funcionario
VALUES (
    tp_funcionario(
        (SELECT REF(f) FROM funcionario f WHERE f.cpf = '11122233344'),
        '22233344455',
        'Maria',
        'Almeida',
        789012,
        40,
        TO_DATE('1983-09-20', 'YYYY-MM-DD'),
        nt_fones(tp_fone('11', '987654321')),
        'maria.supervisor@zoo.com'
    )
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela tratadores
--------------------------------------------------------------------------------

-- Inserir Carlos (Tratador, supervisionado por Maria)
INSERT INTO tratadores
VALUES (
    tp_tratador(
        (SELECT REF(f) FROM funcionario f WHERE f.cpf = '22233344455'),
        '33344455566',
        'Carlos',
        'Santos',
        345678,
        28,
        TO_DATE('1996-02-10', 'YYYY-MM-DD'),
        nt_fones(tp_fone('11', '912345678')),
        'carlos.tratador@zoo.com'
    )
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela veterinarios
--------------------------------------------------------------------------------

-- Inserir Ana (Veterinária, supervisionada por Maria)
INSERT INTO veterinarios
VALUES (
    tp_veterinario(
        (SELECT REF(f) FROM funcionario f WHERE f.cpf = '22233344455'),
        '44455566677',
        'Ana',
        'Mendes',
        567890,
        35,
        TO_DATE('1989-08-22', 'YYYY-MM-DD'),
        nt_fones(tp_fone('11', '923456789')),
        'ana.veterinaria@zoo.com'
    )
);
--------------------------------------------------------------------------------
-- Inserindo dados na animal
--------------------------------------------------------------------------------

INSERT INTO animal
VALUES (
    tp_animal(
        'ANIM001', 
        'Panthera leo', 
        nt_nome_popular( 
            tp_nome_popular('Leão', 'Brasil'),
            tp_nome_popular('Lion', 'Estados Unidos'),
            tp_nome_popular('León', 'Espanha')
        ),
        'Simba', 
        'Mamífero' 
    )
);

INSERT INTO animal
VALUES (
    tp_animal(
        'ANIM002', 
        'Elephas maximus', 
        nt_nome_popular(
            tp_nome_popular('Elefante', 'Brasil'),
            tp_nome_popular('Elephant', 'Estados Unidos'),
            tp_nome_popular('Elefante asiático', 'Portugal')
        ),
        'Dumbo', 
        'Mamífero' 
    )
);

--------------------------------------------------------------------------------
-- Inserindo dados na tabela Alimentacao
--------------------------------------------------------------------------------
INSERT INTO alimentacao VALUES (
    tp_alimentacao(
        (SELECT REF(a) FROM animal a WHERE a.id = 'ANIM001'),
        'Ração seca',
        '08:00',
        'Sem restrições',
        250.50
    )
);

BEGIN
    tp_alimentacao.obter_ultima_refeicao('ANIM001');
END;

--------------------------------------------------------------------------------
-- Inserindo dados na tabela consulta
--------------------------------------------------------------------------------
INSERT INTO consulta VALUES (
    tp_consulta(
        (SELECT REF(a) FROM animal a WHERE a.id = 'ANIM001'), 
        (SELECT REF(v) FROM veterinario v WHERE v.cpf = '12345678901'), 
        TO_DATE('2023-10-10', 'YYYY-MM-DD'), 
        'Infecção respiratória', 
        'Prescrever antibióticos' 
    )
)

