--------------------------------------------------------------------------------
-- Inserindo dados na tabela Visitante
--------------------------------------------------------------------------------

insert into visitante 
values (tp_visitante(
    'João', 
    '12345678901', 
    TO_DATE('2013-05-10', 'YYYY-MM-DD')
));
/
insert into visitante 
values (tp_visitante(
    'Timoteo', 
    '38517646589', 
    TO_DATE('1995-12-27', 'YYYY-MM-DD')
));
/
INSERT INTO visitante 
VALUES (tp_visitante(
    'Maria',
    '98765432101',
    TO_DATE('1995-08-25', 'YYYY-MM-DD')
));
/
--------------------------------------------------------------------------------
-- Inserindo dados na tabela promoção
--------------------------------------------------------------------------------

-- /
INSERT INTO promocao (id, requisito, data_de_inicio, data_de_termino, desconto) 
VALUES (
    promocao_seq.NEXTVAL, 'estudantes', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 20
);
/
INSERT INTO promocao (id, requisito, data_de_inicio, data_de_termino, desconto) 
VALUES (
    promocao_seq.NEXTVAL, 'Nenhum requisito', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2030-01-01', 'YYYY-MM-DD'), 0
);
/
INSERT INTO promocao (id, requisito, data_de_inicio, data_de_termino, desconto) 
VALUES (
    promocao_seq.NEXTVAL, 'Idade < 12', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 50
);
/

--------------------------------------------------------------------------------
-- Inserindo dados na tabela entrada
--------------------------------------------------------------------------------

insert into entrada (data_visita, numero_entrada, tipo_entrada, hora_entrada) values (
    TO_DATE('2024-03-01', 'YYYY-MM-DD'),
    entrada_seq.NEXTVAL,
    1,
    '10:00'
);
/
--------------------------------------------------------------------------------
-- Inserindo dados na tabela compra
--------------------------------------------------------------------------------

INSERT INTO compra (cpf_visitante, numero_entrada, data_visita, id_promocao) VALUES (
    '12345678901',
    (SELECT MAX(numero_entrada) FROM entrada WHERE data_visita = TO_DATE('2024-03-01', 'YYYY-MM-DD')),
    TO_DATE('2024-03-01', 'YYYY-MM-DD'),
    1
);
/

--------------------------------------------------------------------------------
-- Inserindo dados na tabela veterinarios
--------------------------------------------------------------------------------

-- Inserir João (sem supervisor)
INSERT INTO veterinarios
VALUES (
    tp_veterinario(
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
/
-- Inserir Maria (supervisionada por João)
INSERT INTO veterinarios
VALUES (
    tp_veterinario(
        (SELECT REF(v) 
           FROM veterinarios v 
          WHERE v.cpf = '11122233344'),
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
/
-- Inserir Ana (Veterinária, supervisionada por Maria)
INSERT INTO veterinarios
VALUES (
    tp_veterinario(
        (SELECT REF(v)
           FROM veterinarios v
          WHERE v.cpf = '22233344455'),
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
/
--------------------------------------------------------------------------------
-- Inserindo dados na tabela tratadores
--------------------------------------------------------------------------------

-- Inserir Carlos (Tratador, supervisionado por Maria)
INSERT INTO tratadores
VALUES (
    tp_tratador(
        (SELECT REF(v)
           FROM veterinarios v 
          WHERE v.cpf = '22233344455'),
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
/
-- Inserção de dados na tabela HABITAT 

-- Habitat 1: Savana Africana (Leões)
COMMENT ON TABLE habitat IS 'Tabela de habitats do zoológico';
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        1500.50, 
        TO_DATE('15-03-2023', 'DD-MM-YYYY'), 
        90, 
        12
    )
);
/
-- Habitat 2: Planície Africana (Girafas)
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        800.75, 
        TO_DATE('05-05-2023', 'DD-MM-YYYY'), 
        60, 
        8
    )
);
/
-- Habitat 3: Floresta de Bambu (Pandas)
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        2500.00, 
        TO_DATE('22-01-2023', 'DD-MM-YYYY'), 
        120, 
        5
    )
);
/
-- Habitat 4: Recinto Aquático (Golfinhos)
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        350.25, 
        TO_DATE('10-06-2023', 'DD-MM-YYYY'), 
        45, 
        15
    )
);
/
-- Habitat 5: Floresta Tropical Asiática (Tigres)
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        5000.00, 
        TO_DATE('30-04-2023', 'DD-MM-YYYY'), 
        180, 
        3
    )
);
/
-- Habitat 6: Aviário Tropical (Araras)
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        750.50, 
        TO_DATE('12-02-2023', 'DD-MM-YYYY'), 
        60, 
        10
    )
);
/
-- Habitat 7: Pântano Africano (Hipopótamos)
INSERT INTO habitat VALUES(
    tp_habitat(
        habitat_seq.NEXTVAL, 
        1200.00, 
        TO_DATE('25-05-2023', 'DD-MM-YYYY'), 
        90, 
        6
    )
);
/

--------------------------------------------------------------------------------
-- Inserindo dados na animal
--------------------------------------------------------------------------------

-- Inserção de dados na tabela ANIMAL

-- Leões (Habitat 1)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Panthera leo',
        varray_nome_popular(
            tp_nome_popular('Leão', 'África Oriental'),
            tp_nome_popular('Rei da Selva', 'Global')
        ),
        'Simba',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 1)
    )
);
/
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Panthera leo',
        varray_nome_popular(
            tp_nome_popular('Leoa', 'África Oriental'),
            tp_nome_popular('Rainha da Savana', 'Quênia')
        ),
        'Nala',
        'Fêmea',
        (SELECT REF(h) FROM habitat h WHERE h.id = 1)
    )
);
/
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Panthera leo',
        varray_nome_popular(
            tp_nome_popular('Leão', 'África Oriental'),
            tp_nome_popular('Rei da Savana', 'Tanzânia')
        ),
        'Mufasa',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 1)
    )
);
/
-- Girafas (Habitat 2)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Giraffa camelopardalis',
        varray_nome_popular(
            tp_nome_popular('Girafa', 'África'),
            tp_nome_popular('Girafa-reticulada', 'Leste Africano')
        ),
        'Melman',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 2)
    )
);
/
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Giraffa camelopardalis',
        varray_nome_popular(
            tp_nome_popular('Girafa', 'África'),
            tp_nome_popular('Girafa-masai', 'Quênia/Tanzânia')
        ),
        'Mel',
        'Fêmea',
        (SELECT REF(h) FROM habitat h WHERE h.id = 2)
    )
);
/
-- Panda (Habitat 3)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Ailuropoda melanoleuca',
        varray_nome_popular(
            tp_nome_popular('Panda-gigante', 'China'),
            tp_nome_popular('Urso-panda', 'Global'),
            tp_nome_popular('Panda', 'Ásia')
        ),
        'Po',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 3)
    )
);
/
-- Golfinho (Habitat 4)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Tursiops truncatus',
        varray_nome_popular(
            tp_nome_popular('Golfinho', 'Oceanos'),
            tp_nome_popular('Boto', 'Brasil'),
            tp_nome_popular('Nariz-de-garrafa', 'Atlântico')
        ),
        'Flipper',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 4)
    )
);
/
-- Tigre (Habitat 5)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Panthera tigris',
        varray_nome_popular(
            tp_nome_popular('Tigre-de-bengala', 'Índia'),
            tp_nome_popular('Tigre-real', 'Bengala'),
            tp_nome_popular('Tigre-indiano', 'Subcontinente')
        ),
        'Rajah',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 5)
    )
);
/
-- Arara (Habitat 6)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Ara ararauna',
        varray_nome_popular(
            tp_nome_popular('Arara-azul', 'Brasil'),
            tp_nome_popular('Arara-canindé', 'Amazônia'),
            tp_nome_popular('Arara-amarela', 'Pantanal')
        ),
        'Blu',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 6)
    )
);
/
-- Hipopótamo (Habitat 7)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        NULL,
        'Hippopotamus amphibius',
        varray_nome_popular(
            tp_nome_popular('Hipopótamo', 'África'),
            tp_nome_popular('Hipopótamo-comum', 'Rios africanos'),
            tp_nome_popular('Hippo', 'Global')
        ),
        'Gloria',
        'Fêmea',
        (SELECT REF(h) FROM habitat h WHERE h.id = 7)
    )
);
/
-- Adicionando filhotes com referência às mães
-- Filhote de leão (Kiara - filha de Nala)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        (SELECT REF(a) FROM animal a WHERE a.nome_proprio = 'Nala'),
        'Panthera leo',
        varray_nome_popular(
            tp_nome_popular('Leão', 'África'),
            tp_nome_popular('Leãozinho', 'Zoológico')
        ),
        'Kiara',
        'Fêmea',
        (SELECT REF(h) FROM habitat h WHERE h.id = 1)
    )
);
/
-- Filhote de girafa (Spots - filho de Mel)
INSERT INTO animal VALUES(
    tp_animal(
        animal_seq.NEXTVAL,
        (SELECT REF(a) FROM animal a WHERE a.nome_proprio = 'Mel'),
        'Giraffa camelopardalis',
        varray_nome_popular(
            tp_nome_popular('Girafa', 'África'),
            tp_nome_popular('Girafinha', 'Zoológico')
        ),
        'Spots',
        'Macho',
        (SELECT REF(h) FROM habitat h WHERE h.id = 2)
    )
);
/
--------------------------------------------------------------------------------
-- Inserindo dados na tabela Alimentacao
--------------------------------------------------------------------------------
DECLARE
    v_alimentacao tp_alimentacao;

BEGIN
    v_alimentacao := tp_alimentacao(
        1,
        'Ração seca',
        '08:00',
        'Sem restrições',
        250.50

    );
    INSERT INTO alimentacao VALUES (
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;
-- Inserção de dados na tabela ALIMENTAÇÃO com chamadas ao procedimento de rastreamento

-- Alimentações dos Leões (Habitat 1)
-- Simba (ID 1)

    v_alimentacao := tp_alimentacao(
        1,
        'Carne bovina premium', 
        '10:00', 
        'Alimentação matinal com carne fresca - 4kg de costela e 2kg de acém',
        15.5

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        1,
        'Carne bovina com suplementos', 
        '16:00', 
        'Alimentação vespertina - Enriquecida com cálcio e vitaminas',
        12.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Nala (ID 2)

    v_alimentacao := tp_alimentacao(
        2,
        'Carne bovina selecionada', 
        '10:30', 
        'Alimentação matinal - Cortes magros para manter o peso ideal',
        12.5

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Mufasa (ID 3)

    v_alimentacao := tp_alimentacao(
        3,
        'Carne bovina e suína mista', 
        '11:00', 
        'Dieta especial para leão mais velho - Inclui suplementos articulares',
        14.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentações das Girafas (Habitat 2)
-- Melman (ID 4)

    v_alimentacao := tp_alimentacao(
        4,
        'Folhas de acácia frescas', 
        '09:00', 
        'Colhidas diariamente - Alimento preferido da espécie',
        25.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    ); 


    v_alimentacao := tp_alimentacao(
        4,
        'Mix de folhagens e vegetais', 
        '15:00', 
        'Variedade de folhas, feno e vegetais para balanceamento nutricional',
        20.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Mel (ID 5)

    v_alimentacao := tp_alimentacao(
        5,
        'Folhas e brotos altos', 
        '09:30', 
        'Folhas de árvores altas simulando alimentação natural',
        22.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentação do Panda (Habitat 3)
-- Po (ID 6)

    v_alimentacao := tp_alimentacao(
        6,
        'Bambu fresco variedade Phyllostachys', 
        '08:00', 
        'Bambu colhido diariamente - Variedade preferida',
        18.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        6,
        'Bambu e brotos tenros', 
        '13:00', 
        'Brotos jovens ricos em nutrientes',
        15.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        6,
        'Bambu fresco com frutas sazonais', 
        '18:00', 
        'Complemento com maçãs e outras frutas para variedade nutricional',
        12.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentação do Golfinho (Habitat 4)
-- Flipper (ID 7)

    v_alimentacao := tp_alimentacao(
        7,
        'Peixes variados frescos', 
        '11:00', 
        'Mix de arenque, sardinha e lula - Rica em ômega 3',
        8.5

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        7,
        'Peixes enriquecidos', 
        '16:00', 
        'Peixes com suplementos vitamínicos inseridos',
        7.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentação do Tigre (Habitat 5)
-- Rajah (ID 8)

    v_alimentacao := tp_alimentacao(
        8,
        'Carne bovina com ossos', 
        '09:30', 
        'Alimentação que simula caça natural - Inclui ossos para saúde dental',
        20.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        8,
        'Carne de aves inteiras', 
        '17:30', 
        'Frangos inteiros para estimular comportamento de caça',
        15.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentação da Arara (Habitat 6)
-- Blu (ID 9)

    v_alimentacao := tp_alimentacao(
        9,
        'Mix de sementes tropicais', 
        '08:30', 
        'Sementes de girassol, nozes e castanhas brasileiras',
        1.5

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        9,
        'Frutas tropicais frescas', 
        '16:30', 
        'Manga, mamão, banana e outras frutas nativas da região amazônica',
        1.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentação do Hipopótamo (Habitat 7)
-- Gloria (ID 10)

    v_alimentacao := tp_alimentacao(
        10,
        'Vegetação aquática e gramíneas', 
        '10:00', 
        'Plantas aquáticas, capim e vegetação ribeirinha',
        45.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        10,
        'Feno, melancia e vegetais', 
        '17:00', 
        'Mix de vegetais com melancia para hidratação adicional',
        35.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Alimentação dos Filhotes
-- Kiara - Filhote de leão (ID 11)

    v_alimentacao := tp_alimentacao(
        11,
        'Carne moída macia', 
        '11:00', 
        'Carne moída com alto teor de proteína para desenvolvimento',
        5.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    ); 


    v_alimentacao := tp_alimentacao(
        11,
        'Leite enriquecido e carne', 
        '17:30', 
        'Fórmula láctea especial com carne moída para transição alimentar',
        2.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;

-- Spots - Filhote de girafa (ID 12)

    v_alimentacao := tp_alimentacao(
        12,
        'Folhas tenras selecionadas', 
        '09:30', 
        'Folhas jovens de baixa altura para facilitar acesso',
        8.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );


    v_alimentacao := tp_alimentacao(
        12,
        'Fórmula láctea especial para girafas', 
        '15:30', 
        'Suplementação nutricional rica em cálcio para crescimento ósseo',
        3.0

    );
    INSERT INTO alimentacao VALUES(
    v_alimentacao

    );    
    v_alimentacao.obter_ultima_refeicao;
END;
/

--------------------------------------------------------------------------------
-- Inserindo dados na tabela consulta
--------------------------------------------------------------------------------
INSERT INTO consulta (id_animal, cpf_veterinario, data_hora, observacoes)
VALUES (
    (SELECT id FROM animal WHERE nome_proprio = 'Simba'),
    '44455566677', -- CPF da veterinária Ana
    TO_TIMESTAMP('2023-10-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'Infecção respiratória'
);
/

-- Inserindo dados na tabela medicamento
INSERT INTO medicamento (nome, dosagem) VALUES ('Antibiótico', '500mg');
INSERT INTO medicamento (nome, dosagem) VALUES ('Vermífugo', '10ml');
INSERT INTO medicamento (nome, dosagem) VALUES ('Anti-inflamatório', '200mg');
/

-- Inserindo dados na tabela tratamento
INSERT INTO tratamento (id_animal, cpf_veterinario, nome, dosagem, data_hora)
VALUES (
    1, 
    '44455566677', -- CPF da veterinária Ana
    'Antibiótico', 
    '500mg', 
    TO_TIMESTAMP('2023-10-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
/

-- Inserindo dados na tabela manutencao
INSERT INTO manutencao (id_habitat, tipo)
VALUES (
    1,
    'mata atlântica'
);
/

-- inserindo dados na tabela manutencao_tratadores
INSERT INTO manutencao_tratadores (id_habitat, cpf_tratador)
VALUES (
    1,
    '33344455566' -- CPF do tratador Carlos
);

/
-- inserindo dados na tabela contrato

INSERT INTO data_contrato (num_carteira, funcionario, data_contrato)
VALUES (
    345678,
    (SELECT REF(T) FROM tratadores T WHERE T.num_carteira_trabalho = 345678), -- Número da carteira de trabalho do tratador Carlos
    TO_DATE('2024-01-01', 'YYYY-MM-DD')
);
/
