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
    CONSTRAINT manuntencao_tratadores_fkey PRIMARY KEY (id_manutencao),
    CONSTRAINT manuntencao_tratadores_fkey FOREIGN KEY (habitat_id) REFERENCES HABITAT(id) 
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
