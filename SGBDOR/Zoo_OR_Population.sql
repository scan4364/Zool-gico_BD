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
-- Inserindo dados na tabela veterinario
--------------------------------------------------------------------------------
INSERT INTO veterinarios VALUES (
    tp_veterinario(
        NULL, 
        '12345678901', 
        'Carlos', 
        'Silva', 
        TO_DATE('2022-06-15', 'YYYY-MM-DD'),
        35, 
        '11987654321',
        'carlos.silva@email.com' 
    )
);
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

