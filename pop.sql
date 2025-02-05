-- Inserindo dados na tabela Habitat
INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (500, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 30, 2); -- Leao

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (300, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 45, 1); -- Zebra

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (600, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 30, 1); -- Girafa

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (600, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 45, 1); -- Hipopotamo

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (200, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 20, 2); -- Suricato 

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (400, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 50, 1); -- Onca

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (500, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 50, 1); -- Primatas

INSERT INTO Habitat (tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (900, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 50, 3); -- Aviario

-- Inserindo dados na tabela Medicamento
INSERT INTO Medicamento (dosagem, nome)
VALUES ('5mg', 'Paracetamol'); -- Medicamento genérico

INSERT INTO Medicamento (dosagem, nome)
VALUES ('10ml', 'Antibiótico X'); -- Antibiótico veterinário

-- Inserindo dados na tabela Promocao
INSERT INTO Promocao (data_inicio, data_termino, requisitos, desconto)
VALUES (TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Crianças até 12 anos', 50.00);

INSERT INTO Promocao (data_inicio, data_termino, requisitos, desconto)
VALUES (TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Estudantes', 20.00);

-- Inserindo dados na tabela Visitante
INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (12345678901, 'João', 'Silva', TO_DATE('2014-05-10', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (98765432101, 'Maria', 'Santos', TO_DATE('1995-08-25', 'YYYY-MM-DD'));

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (11122233344, NULL, 'joao.funcionario@zoo.com', 'João', 'Ferreira', 1001, 30, TO_DATE('1993-06-15', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (22233344455, 11122233344, 'maria.supervisor@zoo.com', 'Maria', 'Almeida', 1002, 40, TO_DATE('1983-09-20', 'YYYY-MM-DD'));

-- Inserindo dados na tabela Data_Contrato
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1001, TO_DATE('2023-01-10', 'YYYY-MM-DD'));

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1002, TO_DATE('2022-05-15', 'YYYY-MM-DD'));

-- Inserindo dados na tabela Tratador
INSERT INTO Tratador (cpf_funcionario)
VALUES (11122233344);

-- Inserindo dados na tabela Veterinario
INSERT INTO Veterinario (cpf_funcionario)
VALUES (22233344455);

-- Inserindo dados na tabela Animal
INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera leo', 'Leão', 'Macho', 'Simba', 1, NULL, TO_DATE('2020-07-01', 'YYYY-MM-DD')); -- Leão da Savana Africana

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera leo', 'Leão', 'Masculino', 'Alex', 1, NULL, TO_DATE('2020-06-12','YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Equus quagga', 'Zebra', 'Masculino', 'Marty', 2, NULL, TO_DATE('2019-09-14', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Giraffa', 'Girafa', 'Masculino', 'Melman', 3, NULL, TO_DATE('2018-03-30', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Hippopotamus amphibius', 'Hipopótamo', 'Feminino', 'Glória', 4, NULL, TO_DATE('2017-12-06', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Suricata suricatta', 'Suricato', 'Masculino', 'Julian', 5, NULL, TO_DATE('2016-10-20', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Suricata suricatta', 'Suricato', 'Masculino', 'Mauricio', 5, NULL, TO_DATE('2020-09-22', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera onca', 'Onça-pintada', 'Feminino', 'Isabela', 6, NULL, TO_DATE('2018-12-23', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Pongo pygmaeus', 'Orangotango-de-Bornéu', 'Feminino', 'Diva', 7, NULL, TO_DATE('2016-04-18', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Sapajus apella', 'Macaco-prego', 'Masculino', 'Thiago', 7, NULL, TO_DATE('2019-03-20', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Anodorhynchus hyacinthinus', 'Arara-azul-grande', 'Masculino', 'Blu', 8, NULL, TO_DATE('2022-02-27', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Anodorhynchus hyacinthinus', 'Arara-azul-grande', 'Feminino', 'Jade', 8, NULL, TO_DATE('2023-06-19', 'YYYY-MM-DD'));

INSERT INTO Animal(nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Ara chloropterus', 'Arara-vermelha', 'Feminino', 'Esmeralda', 8, NULL, TO_DATE('2021-08-16', 'YYYY-MM-DD'));    

-- Inserindo dados na tabela Entrada
INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada)
VALUES (1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-03-01 10:00:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada)
VALUES (2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'Família', TIMESTAMP '2024-07-02 14:30:00');

-- Inserindo dados na tabela Compra
INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 12345678901, 1);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 98765432101, 2);

-- Inserindo dados na tabela Consulta
INSERT INTO Consulta (id_animal, cpf_veterinario, data_hora, obs_medica)
VALUES (1, 22233344455, TIMESTAMP '2024-03-01 09:00:00', 'Exame de rotina no leão Simba');

INSERT INTO Consulta (id_animal, cpf_veterinario, data_hora, obs_medica)
VALUES (2, 22233344455, TIMESTAMP '2024-03-02 11:30:00', 'Verificação de ferimento no elefante Dumbo');

-- Inserindo dados na tabela Tratamento
INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (1, 22233344455, TIMESTAMP '2024-03-01 09:00:00', '5mg', 'Paracetamol'); -- Tratamento para o leão Simba

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (2, 22233344455, TIMESTAMP '2024-03-02 11:30:00', '10ml', 'Antibiótico X'); -- Tratamento para o elefante Dumbo

-- Inserindo dados na tabela Manutencao
INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (1, 'Limpeza', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Limpeza geral do habitat da Savana Africana');

INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (2, 'Reparo', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Reparo na cerca do habitat da Floresta Tropical');

-- Inserindo dados na tabela Manutencao_Tratadores
INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (1, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (2, 11122233344);

-- Inserindo dados na tabela Alimentacao (com HORARIO_REFEICAO no formato HH:MM)
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (1, '08:00', 'Sem restrições', 5.00, 'Carne fresca'); -- Refeição do leão Simba

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (2, '09:30', 'Dieta especial', 10.00, 'Frutas e vegetais'); -- Refeição do elefante Dumbo
