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

-- Inserção de dados na tabela PROMOCAO
INSERT INTO Promocao (id_promocao, descricao, data_inicio, data_fim, desconto)
VALUES 
    (1, 'Promoção Inverno', '2025-06-01', '2025-08-31', 15),
    (2, 'Promoção Verão', '2025-12-01', '2026-02-28', 20),
    (3, 'Promoção Outono', '2025-03-15', '2025-05-15', 10),
    (4, 'Promoção Primavera', '2025-09-01', '2025-11-30', 25);

-- Inserção de dados na tabela CONSULTA
INSERT INTO Consulta (id_consulta, id_animal, id_veterinario, data_consulta, observacoes)
VALUES 
    (1, 101, 201, '2025-03-01', 'Consulta de rotina'),
    (2, 102, 202, '2025-03-02', 'Avaliação pós-cirúrgica'),
    (3, 103, 203, '2025-03-03', 'Check-up anual'),
    (4, 104, 204, '2025-03-04', 'Avaliação de comportamento');

-- Inserção de dados na tabela TRATAMENTO
INSERT INTO Tratamento (id_tratamento, id_consulta, medicamento, dosagem, data_inicio, data_fim)
VALUES 
    (1, 1, 'Antibiótico', '50mg', '2025-03-02', '2025-03-09'),
    (2, 2, 'Analgésico', '100mg', '2025-03-03', '2025-03-10'),
    (3, 3, 'Anti-inflamatório', '75mg', '2025-03-04', '2025-03-11'),
    (4, 4, 'Antipirético', '200mg', '2025-03-05', '2025-03-12');

-- Inserção de dados na tabela MANUTENCAO
INSERT INTO Manutencao (id_manutencao, descricao, data_manutencao, custo)
VALUES 
    (1, 'Limpeza do habitat', '2025-03-05', 150.00),
    (2, 'Reparação de cercas', '2025-03-06', 200.00),
    (3, 'Pintura das instalações', '2025-03-07', 300.00),
    (4, 'Verificação do sistema de segurança', '2025-03-08', 250.00);

-- Inserção de dados na tabela MANUTENCAO_TRATADORES
INSERT INTO Manutencao_tratadores (id_manutencao_tratador, id_tratador, id_manutencao, descricao, data_execucao)
VALUES 
    (1, 301, 1, 'Treinamento para manutenção do habitat', '2025-03-06'),
    (2, 302, 2, 'Revisão dos equipamentos de segurança', '2025-03-07'),
    (3, 303, 3, 'Acompanhamento na pintura das instalações', '2025-03-08'),
    (4, 304, 4, 'Inspeção de rotina pós-manutencao', '2025-03-09');

-- Inserção de dados na tabela COMPRA
INSERT INTO Compra (id_compra, item, quantidade, data_compra, valor)
VALUES 
    (1, 'Ração para leões', 10, '2025-03-07', 500.00),
    (2, 'Suplementos vitamínicos', 5, '2025-03-08', 250.00),
    (3, 'Medicamentos para animais', 20, '2025-03-09', 750.00),
    (4, 'Equipamentos de limpeza', 2, '2025-03-10', 300.00);

