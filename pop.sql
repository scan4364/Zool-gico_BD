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

INSERT INTO Medicamento (dosagem, nome)
VALUES ('10mg', 'Ibuprofeno');

-- Inserindo dados na tabela Promocao
INSERT INTO Promocao (data_inicio, data_termino, requisitos, desconto)
VALUES (TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Idade < 12', 50.00);

INSERT INTO Promocao (data_inicio, data_termino, requisitos, desconto)
VALUES (TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Estudantes', 20.00);


-- Inserindo dados na tabela Visitante
INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (12345678901, 'João', 'Silva', TO_DATE('2014-05-10', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (98765432101, 'Maria', 'Santos', TO_DATE('1995-08-25', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (38517646589, 'Timoteo', 'Carvalho', TO_DATE('1995-12-27', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (69561898258, 'Talita', 'Silva', TO_DATE('1989-12-13', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (86969751416, 'Olivia', 'Rodrigues', TO_DATE('2003-02-20', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (63845561739, 'Rosa', 'Ferreira', TO_DATE('1998-02-19', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (61464843054, 'Benjamin', 'Barros', TO_DATE('1995-08-16', 'YYYY-MM-DD'));

INSERT INTO Visitante (cpf, nome, sobrenome, data_nascimento)
VALUES (01834472805, 'Natasha', 'Carneiro', TO_DATE('2004-12-06', 'YYYY-MM-DD'));


-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (11122233344, NULL, 'joao.funcionario@zoo.com', 'João', 'Ferreira', 1001, 30, TO_DATE('1993-06-15', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (22233344455, 11122233344, 'maria.supervisor@zoo.com', 'Maria', 'Almeida', 1002, 40, TO_DATE('1983-09-20', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (33344455566, 11122233344, 'carlos.oliveira@zoo.com', 'Carlos', 'Oliveira', 1003, 35, TO_DATE('1988-07-10', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (44455566677, 11122233344, 'ana.santos@zoo.com', 'Ana', 'Santos', 1004, 40, TO_DATE('1983-11-05', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (55566677788, 11122233344, 'pedro.costa@zoo.com', 'Pedro', 'Costa', 1005, 25, TO_DATE('1998-09-18', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (66677788899, 11122233344, 'julia.fernandes@zoo.com', 'Julia', 'Fernandes', 1006, 32, TO_DATE('1991-12-30', 'YYYY-MM-DD'));

INSERT INTO Funcionario (cpf, cpf_supervisor, email, nome, sobrenome, num_cart_trabalho, idade, data_nascimento)
VALUES (77788899900, 11122233344, 'lucas.martins@zoo.com', 'Lucas', 'Martins', 1007, 29, TO_DATE('1994-05-14', 'YYYY-MM-DD'));

-- Inserindo dados na tabela Data_Contrato
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1001, TO_DATE('2023-01-10', 'YYYY-MM-DD')); -- João Ferreira

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1002, TO_DATE('2022-05-15', 'YYYY-MM-DD')); -- Carlos Oliveira

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1003, TO_DATE('2021-08-20', 'YYYY-MM-DD'));  -- Carlos Oliveira

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1004, TO_DATE('2020-03-12', 'YYYY-MM-DD'));  -- Ana Santos

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1005, TO_DATE('2023-02-25', 'YYYY-MM-DD'));  -- Pedro Costa

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1006, TO_DATE('2019-11-30', 'YYYY-MM-DD'));  -- Julia Fernandes

INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1007, TO_DATE('2022-07-05', 'YYYY-MM-DD'));  -- Lucas Martins


-- Inserindo dados na tabela Tratador

INSERT INTO Tratador (cpf_funcionario)
VALUES (11122233344);  -- João Ferreira (Tratador)

INSERT INTO Tratador (cpf_funcionario)
VALUES (33344455566);  -- Carlos Oliveira (Tratador)

INSERT INTO Tratador (cpf_funcionario)
VALUES (55566677788);  -- Pedro Costa (Tratador)

-- Inserindo dados na tabela Veterinario

INSERT INTO Veterinario (cpf_funcionario)
VALUES (22233344455);  -- Maria Silva (Veterinário)

INSERT INTO Veterinario (cpf_funcionario)
VALUES (44455566677);  -- Ana Santos (Veterinário)

INSERT INTO Veterinario (cpf_funcionario)
VALUES (66677788899);  -- Julia Fernandes (Veterinário)

INSERT INTO Veterinario (cpf_funcionario)
VALUES (77788899900);  -- Lucas Martins (Veterinário)

-- Inserindo dados na tabela Animal
INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera leo', 'Leão', 'Masculino', 'Simba', 1, NULL, TO_DATE('2020-07-01', 'YYYY-MM-DD')); 

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera leo', 'Leão', 'Masculino', 'Alex', 1, NULL, TO_DATE('2020-06-12','YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Equus quagga', 'Zebra', 'Masculino', 'Marty', 2, NULL, TO_DATE('2019-09-14', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Giraffa', 'Girafa', 'Masculino', 'Melman', 3, NULL, TO_DATE('2018-03-30', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Hippopotamus amphibius', 'Hipopótamo', 'Feminino', 'Glória', 4, NULL, TO_DATE('2017-12-06', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Suricata suricatta', 'Suricato', 'Masculino', 'Julian', 5, NULL, TO_DATE('2016-10-20', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Suricata suricatta', 'Suricato', 'Masculino', 'Mauricio', 5, NULL, TO_DATE('2020-09-22', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera onca', 'Onça-pintada', 'Feminino', 'Isabela', 6, NULL, TO_DATE('2018-12-23', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Pongo pygmaeus', 'Orangotango-de-Bornéu', 'Feminino', 'Diva', 7, NULL, TO_DATE('2016-04-18', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Sapajus apella', 'Macaco-prego', 'Masculino', 'Thiago', 7, NULL, TO_DATE('2019-03-20', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Anodorhynchus hyacinthinus', 'Arara-azul-grande', 'Masculino', 'Blu', 8, NULL, TO_DATE('2022-02-27', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Anodorhynchus hyacinthinus', 'Arara-azul-grande', 'Feminino', 'Jade', 8, NULL, TO_DATE('2023-06-19', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Ara chloropterus', 'Arara-vermelha', 'Feminino', 'Esmeralda', 8, NULL, TO_DATE('2021-08-16', 'YYYY-MM-DD'));    

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Elephas maximus', 'Elefante-asiático', 'Feminino', 'Daisy', 2, NULL, TO_DATE('2015-08-10', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Python regius', 'Píton-real', 'Feminino', 'Nala', 6, NULL, TO_DATE('2021-04-25', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera tigris', 'Tigre-de-bengala', 'Masculino', 'Rajah', 1, NULL, TO_DATE('2019-11-15', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Ursus arctos', 'Urso-pardo', 'Feminino', 'Masha', 3, NULL, TO_DATE('2014-07-03', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Spheniscus demersus', 'Pinguim-do-cabo', 'Masculino', 'Pingu', 4, NULL, TO_DATE('2022-02-14', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Bubo bubo', 'Bufo-real', 'Feminino', 'Luna', 8, NULL, TO_DATE('2020-10-31', 'YYYY-MM-DD'));

INSERT INTO Animal (nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES ('Panthera leo', 'Leão', 'Feminino', 'Kiara', 1, NULL, TO_DATE('2023-05-10', 'YYYY-MM-DD'));


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

INSERT INTO Consulta (id_animal, cpf_veterinario, data_hora, obs_medica)
VALUES (3, 44455566677, TIMESTAMP '2024-03-03 14:00:00', 'Avaliação nutricional para a zebra Marty');

INSERT INTO Consulta (id_animal, cpf_veterinario, data_hora, obs_medica)
VALUES (8, 22233344455, TIMESTAMP '2024-03-04 10:15:00', 'Consulta de rotina para a onça Isabela');

INSERT INTO Consulta (id_animal, cpf_veterinario, data_hora, obs_medica)
VALUES (5, 44455566677, TIMESTAMP '2024-03-05 16:30:00', 'Check-up pós-operatório para o hipopótamo Glória');


-- Inserindo dados na tabela Tratamento
INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (1, 22233344455, TIMESTAMP '2024-03-01 09:00:00', '5mg', 'Paracetamol'); -- Tratamento para o leão Simba

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (2, 22233344455, TIMESTAMP '2024-03-02 11:30:00', '10ml', 'Antibiótico X'); -- Tratamento para o elefante Dumbo

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (3, 44455566677, TIMESTAMP '2024-03-03 14:00:00', '10ml', 'Antibiótico X' );

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (8, 22233344455, TIMESTAMP '2024-03-04 10:15:00', '10mg', 'Ibuprofeno');

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (5, 44455566677, TIMESTAMP '2024-03-05 16:30:00', '10mg', 'Ibuprofeno');


-- Inserindo dados na tabela Manutencao
INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (1, 'Limpeza', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Limpeza geral do habitat da Savana Africana');

INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (2, 'Reparo', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Reparo na cerca do habitat da Floresta Tropical');

INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (3, 'Alimentação', TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Reabastecimento de feno para girafas');

INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (4, 'Segurança', TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'Inspeção de sistemas de refrigeração para pinguins');

INSERT INTO Manutencao (habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (5, 'Limpeza', TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'Higienização do viveiro das araras');

-- Inserindo dados na tabela Manutencao_Tratadores
INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (7, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (8, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (9, 33344455566);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (10, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (11, 33344455566);

-- Inserindo dados na tabela Alimentacao
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (1, '08:00', 'Sem restrições', 7.00, 'Carne fresca'); -- Refeição do leão Simba

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (2, '08:00', 'Sem restrições', 7.00, 'Carne fresca'); -- Refeição do leão Alex

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (3, '09:00', 'Sem restrições', 25.00, 'Gramíneas, folhas, galhos e ervas'); -- Refeição zebra

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (4, '08:00', 'Sem restrições', 34.00, 'Folhas, caules, flores e frutos'); -- Refeição girafa

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (5, '09:30', 'Sem restrições', 36.00, 'Folhas, gramíneas, brotos e juncos'); -- Refeição hipopótamo

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (6, '10:00', 'Sem restrições', 0.30, 'Insetos'); -- Refeição suricato Julian

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (7, '10:00', 'Sem restrições', 0.30, 'Insetos'); -- Refeição suricato Mauricio

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (8, '11:00', 'Sem restrições', 5.00, 'Carne fresca'); -- Refeição onça 

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (9, '08:00', 'Sem restrições', 5.00, 'Figos selvagens, duriões, sementes, iogurte, semente de linhaça, mel'); -- Refeição orangotango

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (10, '08:00', 'Sem restrições', 0.50, 'Frutas, verduras, legumes, sementes, ovos, peixe, frango e arroz cozido'); -- Refeição macaco prego

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (11, '10:30', 'Sem restrições', 0.30, 'Frutas frescas, legumes, verduras, ração específica para aves exóticas e sementes'); -- Refeição arara Blu

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (12, '10:30', 'Sem restrições', 0.30, 'Frutas frescas, legumes, verduras, ração específica para aves exóticas e sementes'); -- Refeição arara Jade 

INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (13, '10:30', 'Sem restrições', 0.30, 'Frutas frescas, legumes, verduras, ração específica para aves exóticas e sementes'); -- Refeição arara Esmeralda

-- Inserindo dados na tabela Telefone
insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(11122233344, 01, 123456);

insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(22233344455, 01, 234567);

insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(33344455566, 01, 345678);

insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(44455566677, 01, 456789);

insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(55566677788, 02, 213245);

insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(66677788899, 02, 546789);

insert into Telefone (CPF_FUNCIONARIO, DDD, NUMERO) VALUES(77788899900, 02, 267134);

