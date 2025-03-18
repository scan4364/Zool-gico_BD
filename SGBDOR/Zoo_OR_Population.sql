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

