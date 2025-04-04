--------------------------------------------------------------------------------
-- Criação de Tabelas
--------------------------------------------------------------------------------

-- Criação da tabela Entrada
CREATE TABLE Entrada(
    numero_entrada INTEGER, 
    dia_entrada DATE, 
    tipo_entrada VARCHAR2(20), 
    hora_entrada TIMESTAMP,
    CONSTRAINT entrada_pkey 
        PRIMARY KEY(dia_entrada, numero_entrada)
);

-- Criação da tabela Visitante
CREATE TABLE Visitante(
    cpf INTEGER,
    nome VARCHAR2(20),
    sobrenome VARCHAR2(20),
    data_nascimento DATE,
    CONSTRAINT visitante_pkey 
        PRIMARY KEY(cpf)
);

-- Criação da tabela Promoção
CREATE SEQUENCE promocao_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
CREATE TABLE Promocao(
    id INTEGER,
    data_inicio DATE,
    data_termino DATE,
    requisitos VARCHAR2(20),
    desconto DECIMAL(5,2),
    CONSTRAINT promocao_pkey 
        PRIMARY KEY(id),
    CONSTRAINT chk_data_valida 
        CHECK (data_termino > data_inicio)
);

-- Criação da tabela Compra
CREATE TABLE Compra(
    numero_entrada INTEGER,
    dia_entrada DATE,
    cpf INTEGER,
    id_promocao INTEGER,
    CONSTRAINT compra_pkey 
        PRIMARY KEY(numero_entrada, dia_entrada, cpf, id_promocao),
    CONSTRAINT compra_fkey1
        FOREIGN KEY(dia_entrada, numero_entrada) REFERENCES Entrada(dia_entrada, numero_entrada), 
    CONSTRAINT compra_fkey2
        FOREIGN KEY(cpf) REFERENCES Visitante(cpf),
    CONSTRAINT compra_fkey3
        FOREIGN KEY(id_promocao) REFERENCES Promocao(id)
);

-- Criação da tabela Habitat
CREATE SEQUENCE habitat_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
CREATE TABLE Habitat (
    id INTEGER,
    tamanho DECIMAL(10, 2),
    ultima_manutencao DATE,
    intervalo_manutencao INTEGER,
    qtd_animais INTEGER,
    CONSTRAINT habitat_pkey PRIMARY KEY (id)
);

-- Criação da tabela Animal
CREATE SEQUENCE animal_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
CREATE TABLE Animal (
    id INTEGER,
    nome_cientifico VARCHAR2(255),
    nome_popular VARCHAR2(100),
    genero VARCHAR2(50),
    nome_proprio VARCHAR2(100),
    habitat INTEGER,
    id_mae INTEGER NULL,
    data_nascimento DATE,
    CONSTRAINT animal_pkey PRIMARY KEY (id),
    CONSTRAINT animal_habitat_fkey FOREIGN KEY (habitat) REFERENCES Habitat(id),
    CONSTRAINT animal_mae_fkey FOREIGN KEY (id_mae) REFERENCES Animal(id)
);

-- Criação da tabela Alimentacao
CREATE TABLE Alimentacao (
    id_animal INTEGER,
    horario_refeicao VARCHAR2(5),
    observacoes VARCHAR2(255),
    quantidade DECIMAL(10, 2),
    descricao VARCHAR2(255),
    CONSTRAINT alimentacao_pkey PRIMARY KEY (id_animal, horario_refeicao),
    CONSTRAINT alimentacao_fkey FOREIGN KEY (id_animal) REFERENCES Animal(id)
);

-- Criação da tabela Funcionario
CREATE TABLE Funcionario (
    cpf INTEGER,
    cpf_supervisor INTEGER,
    email VARCHAR2(100),
    nome VARCHAR2(100),
    sobrenome VARCHAR(255),
    num_cart_trabalho INTEGER UNIQUE,
    idade INTEGER,
    data_nascimento DATE,
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf)
);

-- Criação da tabela Telefone
CREATE TABLE Telefone (
    cpf_funcionario INTEGER,
    ddd INTEGER,
    numero INTEGER,
    CONSTRAINT telefone_pkey PRIMARY KEY (ddd, numero),
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

-- Criação da tabela Tratador
CREATE TABLE Tratador (
    cpf_funcionario INTEGER,
    CONSTRAINT tratador_pkey PRIMARY KEY (cpf_funcionario),
    CONSTRAINT tratador_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

-- Criação da tabela Veterinario
CREATE TABLE Veterinario (
    cpf_funcionario INTEGER,
    CONSTRAINT veterinario_pkey PRIMARY KEY (cpf_funcionario),
    CONSTRAINT veterinario_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

-- Criação da tabela Medicamento
CREATE TABLE Medicamento (
    dosagem VARCHAR2(20),
    nome VARCHAR2(50),
    CONSTRAINT medicamento_pkey PRIMARY KEY (dosagem, nome)
);

-- Criação da tabela Consulta
CREATE TABLE Consulta (
    id_animal INTEGER,
    cpf_veterinario INTEGER,
    data_hora TIMESTAMP,
    obs_medica VARCHAR2(100),
    CONSTRAINT consulta_pkey PRIMARY KEY (id_animal, cpf_veterinario, data_hora),
    CONSTRAINT consulta_fkey1 FOREIGN KEY (cpf_veterinario) REFERENCES Veterinario(cpf_funcionario),
    CONSTRAINT consulta_fkey2 FOREIGN KEY (id_animal) REFERENCES Animal(id)
);

-- Criação da tabela Tratamento
CREATE TABLE Tratamento (
    id_animal INTEGER,
    cpf_veterinario INTEGER,
    data_hora TIMESTAMP,
    dosagem VARCHAR2(20),
    nome VARCHAR2(50),
    CONSTRAINT tratamento_pkey PRIMARY KEY (id_animal, cpf_veterinario, data_hora, dosagem, nome),
    CONSTRAINT tratamento_fkey1 FOREIGN KEY (cpf_veterinario, id_animal, data_hora) REFERENCES Consulta(cpf_veterinario, id_animal, data_hora),
    CONSTRAINT tratamento_fkey2 FOREIGN KEY (dosagem, nome) REFERENCES Medicamento(dosagem, nome)
);

-- Criação da tabela Manutencao
CREATE SEQUENCE manutencao_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
CREATE TABLE Manutencao (
    id_manutencao     INTEGER,
    habitat_id        INTEGER NOT NULL,
    tipo_manutencao   VARCHAR2(100) NOT NULL,
    data_manutencao   DATE NOT NULL,
    descricao         VARCHAR2(255),
    CONSTRAINT manuntencao_pkey PRIMARY KEY (id_manutencao),
    CONSTRAINT manuntencao_fkey FOREIGN KEY (habitat_id) REFERENCES HABITAT(id) 
);

-- Criação da tabela Manutencao_tratadores
CREATE TABLE Manutencao_Tratadores (
    id_manutencao   INTEGER NOT NULL,
    id_tratador     INTEGER NOT NULL,
    CONSTRAINT manuntencao_tratadores_pkey PRIMARY KEY (id_manutencao, id_tratador),
    CONSTRAINT manuntencao_tratadores_fkey1 FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id_manutencao),
    CONSTRAINT manuntencao_tratadores_fkey2 FOREIGN KEY (id_tratador) REFERENCES Tratador(cpf_funcionario) 
);

-- Criação da tabela Data_Contrato
CREATE TABLE Data_Contrato (
    num_carteira_trabalho INTEGER,
    data_contrato DATE NOT NULL,
    CONSTRAINT data_contrato_pkey PRIMARY KEY (num_carteira_trabalho),
    CONSTRAINT data_contrato_fkey FOREIGN KEY (num_carteira_trabalho) REFERENCES Funcionario(num_cart_trabalho)
);


--------------------------------------------------------------------------------
-- População das tabelas criadas
--------------------------------------------------------------------------------

-- Inserindo dados na tabela Habitat

-- Leao
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 500, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 30, 3);

-- Zebra
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 300, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 45, 1);

-- Girafa
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 600, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 30, 1);

-- Hipopotamo
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 600, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 45, 1);

-- Suricato 
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 200, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 20, 2);

-- Onca
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 400, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 50, 1);

-- Primatas
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 500, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 50, 1);

-- Aviario
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 900, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 50, 4);

-- Elefante
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 900, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 90, 1);

-- Cobra
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 200, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 90, 1);

-- Tigre
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 400, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 90, 1);

-- Urso
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 500, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 90, 1);

-- Pinguim
INSERT INTO Habitat (id, tamanho, ultima_manutencao, intervalo_manutencao, qtd_animais)
VALUES (habitat_seq.NEXTVAL, 800, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 90, 1);


-- Inserindo dados na tabela Medicamento

-- Medicamento genérico
INSERT INTO Medicamento (dosagem, nome)
VALUES ('5mg', 'Paracetamol');

-- Antibiótico veterinário
INSERT INTO Medicamento (dosagem, nome)
VALUES ('10ml', 'Antibiótico X');

-- Remedio anti-inflamatório
INSERT INTO Medicamento (dosagem, nome)
VALUES ('10mg', 'Ibuprofeno');

-- Inserindo dados na tabela Promocao
INSERT INTO Promocao (id, data_inicio, data_termino, requisitos, desconto)
VALUES (promocao_seq.NEXTVAL, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Idade < 12', 50.00);

INSERT INTO Promocao (id, data_inicio, data_termino, requisitos, desconto)
VALUES (promocao_seq.NEXTVAL, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Estudantes', 20.00);

INSERT INTO Promocao (id, data_inicio, data_termino, requisitos, desconto) 
VALUES (promocao_seq.NEXTVAL, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2030-01-01', 'YYYY-MM-DD'), 'nenhum requisito', 0.00);

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

-- João Ferreira
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1001, TO_DATE('2023-01-10', 'YYYY-MM-DD'));

-- Carlos Oliveira
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1002, TO_DATE('2022-05-15', 'YYYY-MM-DD'));

-- Carlos Oliveira
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1003, TO_DATE('2021-08-20', 'YYYY-MM-DD')); 

-- Ana Santos
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1004, TO_DATE('2020-03-12', 'YYYY-MM-DD')); 

-- Pedro Costa
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1005, TO_DATE('2023-02-25', 'YYYY-MM-DD')); 

-- Julia Fernandes
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1006, TO_DATE('2019-11-30', 'YYYY-MM-DD')); 

-- Lucas Martins
INSERT INTO Data_Contrato (num_carteira_trabalho, data_contrato)
VALUES (1007, TO_DATE('2022-07-05', 'YYYY-MM-DD')); 


-- Inserindo dados na tabela Tratador

-- João Ferreira (Tratador)
INSERT INTO Tratador (cpf_funcionario)
VALUES (11122233344); 

-- Carlos Oliveira (Tratador)
INSERT INTO Tratador (cpf_funcionario)
VALUES (33344455566); 

-- Pedro Costa (Tratador)
INSERT INTO Tratador (cpf_funcionario)
VALUES (55566677788); 


-- Inserindo dados na tabela Veterinario

-- Maria Silva (Veterinário)
INSERT INTO Veterinario (cpf_funcionario)
VALUES (22233344455); 

-- Ana Santos (Veterinário)
INSERT INTO Veterinario (cpf_funcionario)
VALUES (44455566677); 

-- Julia Fernandes (Veterinário)
INSERT INTO Veterinario (cpf_funcionario)
VALUES (66677788899); 

-- Lucas Martins (Veterinário)
INSERT INTO Veterinario (cpf_funcionario)
VALUES (77788899900); 


-- Inserindo dados na tabela Animal
INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (20, 'Panthera leo', 'Leão', 'Feminino', 'Kiara', 1, NULL, TO_DATE('2023-05-10', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Panthera leo', 'Leão', 'Masculino', 'Simba', 1, 20, TO_DATE('2020-07-01', 'YYYY-MM-DD')); 

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Panthera leo', 'Leão', 'Masculino', 'Alex', 1, 20, TO_DATE('2020-06-12','YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Equus quagga', 'Zebra', 'Masculino', 'Marty', 2, NULL, TO_DATE('2019-09-14', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Giraffa', 'Girafa', 'Masculino', 'Melman', 3, NULL, TO_DATE('2018-03-30', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Hippopotamus amphibius', 'Hipopótamo', 'Feminino', 'Glória', 4, NULL, TO_DATE('2017-12-06', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Suricata suricatta', 'Suricato', 'Masculino', 'Julian', 5, NULL, TO_DATE('2016-10-20', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Suricata suricatta', 'Suricato', 'Masculino', 'Mauricio', 5, NULL, TO_DATE('2020-09-22', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Panthera onca', 'Onça-pintada', 'Feminino', 'Isabela', 6, NULL, TO_DATE('2018-12-23', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Pongo pygmaeus', 'Orangotango-de-Bornéu', 'Feminino', 'Diva', 7, NULL, TO_DATE('2016-04-18', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Sapajus apella', 'Macaco-prego', 'Masculino', 'Thiago', 7, NULL, TO_DATE('2019-03-20', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Anodorhynchus hyacinthinus', 'Arara-azul-grande', 'Masculino', 'Blu', 8, NULL, TO_DATE('2022-02-27', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Anodorhynchus hyacinthinus', 'Arara-azul-grande', 'Feminino', 'Jade', 8, NULL, TO_DATE('2023-06-19', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Ara chloropterus', 'Arara-vermelha', 'Feminino', 'Esmeralda', 8, NULL, TO_DATE('2021-08-16', 'YYYY-MM-DD'));    

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Elephas maximus', 'Elefante-asiático', 'Feminino', 'Daisy', 9, NULL, TO_DATE('2015-08-10', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Python regius', 'Píton-real', 'Feminino', 'Nala', 10, NULL, TO_DATE('2021-04-25', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Panthera tigris', 'Tigre-de-bengala', 'Masculino', 'Rajah', 11, NULL, TO_DATE('2019-11-15', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Ursus arctos', 'Urso-pardo', 'Feminino', 'Masha', 12, NULL, TO_DATE('2014-07-03', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Spheniscus demersus', 'Pinguim-do-cabo', 'Masculino', 'Pingu', 13, NULL, TO_DATE('2022-02-14', 'YYYY-MM-DD'));

INSERT INTO Animal (id, nome_cientifico, nome_popular, genero, nome_proprio, habitat, id_mae, data_nascimento)
VALUES (animal_seq.NEXTVAL, 'Bubo bubo', 'Bufo-real', 'Feminino', 'Luna', 8, NULL, TO_DATE('2020-10-31', 'YYYY-MM-DD'));


-- Inserindo dados na tabela Entrada
INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada)
VALUES (1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-03-01 10:00:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada)
VALUES (2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'Família', TIMESTAMP '2024-07-02 14:30:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada) 
VALUES (3, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-05-01 10:00:00'); 

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada) 
VALUES (4, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-05-01 10:00:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada) 
VALUES (5, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-06-05 13:00:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada)
VALUES (6, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-06-05 15:00:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada) 
VALUES (7, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-08-01 12:00:00');

INSERT INTO Entrada (numero_entrada, dia_entrada, tipo_entrada, hora_entrada) 
VALUES (8, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Individual', TIMESTAMP '2024-09-05 18:00:00');


-- Inserindo dados na tabela Compra
INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 12345678901, 1);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 98765432101, 2);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (3, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 98765432101, 3);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (4, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 69561898258, 3);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (5, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 86969751416, 2);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (6, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 63845561739, 3);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (7, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 61464843054, 3);

INSERT INTO Compra (numero_entrada, dia_entrada, cpf, id_promocao)
VALUES (8, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 01834472805, 3);


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
VALUES (1, 22233344455, TIMESTAMP '2024-03-01 09:00:00', '5mg', 'Paracetamol');

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (2, 22233344455, TIMESTAMP '2024-03-02 11:30:00', '10ml', 'Antibiótico X');

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (3, 44455566677, TIMESTAMP '2024-03-03 14:00:00', '10ml', 'Antibiótico X' );

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (8, 22233344455, TIMESTAMP '2024-03-04 10:15:00', '10mg', 'Ibuprofeno');

INSERT INTO Tratamento (id_animal, cpf_veterinario, data_hora, dosagem, nome)
VALUES (5, 44455566677, TIMESTAMP '2024-03-05 16:30:00', '10mg', 'Ibuprofeno');


-- Inserindo dados na tabela Manutencao
INSERT INTO Manutencao (id_manutencao, habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (manutencao_seq.NEXTVAL, 1, 'Limpeza', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Limpeza geral do habitat da Savana Africana');

INSERT INTO Manutencao (id_manutencao, habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (manutencao_seq.NEXTVAL, 2, 'Reparo', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Reparo na cerca do habitat da Floresta Tropical');

INSERT INTO Manutencao (id_manutencao, habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (manutencao_seq.NEXTVAL, 3, 'Alimentação', TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Reabastecimento de feno para girafas');

INSERT INTO Manutencao (id_manutencao, habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (manutencao_seq.NEXTVAL, 4, 'Segurança', TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'Inspeção de sistemas de refrigeração para pinguins');

INSERT INTO Manutencao (id_manutencao, habitat_id, tipo_manutencao, data_manutencao, descricao)
VALUES (manutencao_seq.NEXTVAL, 5, 'Limpeza', TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'Higienização do viveiro das araras');


-- Inserindo dados na tabela Manutencao_Tratadores
INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (1, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (2, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (3, 33344455566);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (4, 11122233344);

INSERT INTO Manutencao_Tratadores (id_manutencao, id_tratador)
VALUES (5, 33344455566);


-- Inserindo dados na tabela Alimentação

-- Refeição 1 do leão Simba 
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (1, '08:00', 'Sem restrições', 3.50, 'Carne fresca');

-- Refeição 2 do leão Simba
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (1, '16:00', 'Sem restrições', 3.50, 'Carne fresca');

-- Refeição 1 do leão Alex
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (2, '08:00', 'Sem restrições', 3.50, 'Carne fresca');

-- Refeição 2 do leão Alex
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (2, '16:00', 'Sem restrições', 3.50, 'Carne fresca');

-- Refeição zebra
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (3, '09:00', 'Sem restrições', 25.00, 'Gramíneas, folhas, galhos e ervas');

-- Refeição girafa
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (4, '08:00', 'Sem restrições', 34.00, 'Folhas, caules, flores e frutos');

-- Refeição hipopótamo
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (5, '09:30', 'Sem restrições', 36.00, 'Folhas, gramíneas, brotos e juncos');

-- Refeição suricato Julian
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (6, '10:00', 'Sem restrições', 0.30, 'Insetos');

-- Refeição suricato Mauricio
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (7, '10:00', 'Sem restrições', 0.30, 'Insetos');

-- Refeição 1 da onça 
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (8, '11:00', 'Sem restrições', 2.50, 'Carne fresca');

-- Refeição 2 da onça 
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (8, '19:00', 'Sem restrições', 2.50, 'Carne fresca');

-- Refeição orangotango
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (9, '08:00', 'Sem restrições', 5.00, 'Figos selvagens, duriões, sementes, iogurte, semente de linhaça, mel');

-- Refeição macaco prego
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (10, '08:00', 'Sem restrições', 0.50, 'Frutas, verduras, legumes, sementes, ovos, peixe, frango e arroz cozido');

-- Refeição arara Blu
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (11, '10:30', 'Sem restrições', 0.30, 'Frutas frescas, legumes, verduras, ração específica para aves exóticas e sementes');

-- Refeição arara Jade 
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (12, '10:30', 'Sem restrições', 0.30, 'Frutas frescas, legumes, verduras, ração específica para aves exóticas e sementes');

-- Refeição arara Esmeralda
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (13, '10:30', 'Sem restrições', 0.30, 'Frutas frescas, legumes, verduras, ração específica para aves exóticas e sementes');

-- Refeição 1 do elefante
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (14, '11:00', 'Sem restrições', 50.00, 'Gramíneas, folhas, frutas, raízes, cascas de árvores e galhos');

-- Refeição 2 do elefante
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (14, '21:00', 'Sem restrições', 50.00, 'Gramíneas, folhas, frutas, raízes, cascas de árvores e galhos');

-- Refeição piton
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (15, '10:00', 'Comer a cada 2 dias', 0.50, 'Pequenos roedores');

-- Refeição 1 do tigre de bengala
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (16, '11:00', 'Sem restrições', 13.50, 'Carne fresca');

-- Refeição 2 do tigre de bengala
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (16, '20:00', 'Sem restrições', 13.50, 'Carne fresca');

-- Refeição urso pardo
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (17, '10:00', 'Sem restrições', 30.00, 'Salmão e frutas');

-- Refeição pinguim
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (18, '11:00', 'Sem restrições', 0.50, 'Ração, peixes, lulas e crustáceos');

-- Refeição bufo real
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (19, '21:00', 'Sem restrições', 0.50, 'Pequenos roedores');

-- Refeição 1 da leõa kiara
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (20, '08:00', 'Sem restrições', 3.50, 'Carne fresca');

-- Refeição 2 da leõa kiara
INSERT INTO Alimentacao (id_animal, horario_refeicao, observacoes, quantidade, descricao)
VALUES (20, '16:00', 'Sem restrições', 3.50, 'Carne fresca');


-- Inserindo dados na tabela Telefone
INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (11122233344, 01, 123456);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (11122233344, 03, 987654);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (22233344455, 01, 234567);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (22233344455, 01, 322332);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (33344455566, 01, 345678);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES (44455566677, 01, 456789);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES(44455566677, 01, 976532);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES(55566677788, 02, 213245);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES(66677788899, 02, 546789);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES(77788899900, 02, 267134);

INSERT INTO Telefone (CPF_FUNCIONARIO, DDD, NUMERO) 
VALUES(77788899900, 02, 231444);