CREATE TABLE Entrada(
    numero_entrada INTEGER, 
    dia_entrada DATE, 
    tipo_entrada VARCHAR2(20), 
    hora_entrada TIMESTAMP,
    CONSTRAINT entrada_pkey 
        PRIMARY KEY(dia_entrada, numero_entrada)
);

CREATE TABLE Visitante(
    cpf INTEGER,
    nome VARCHAR2(20),
    sobrenome VARCHAR2(20),
    data_nascimento DATE,
    CONSTRAINT visitante_pkey 
        PRIMARY KEY(cpf)
);

CREATE TABLE Promocao(
    id INTEGER,
    data_inicio DATE,
    data_termino DATE,
    requisitos VARCHAR2(20),
    desconto DECIMAL(5,2),
    CONSTRAINT promocao_pkey 
        PRIMARY KEY(id)
);

CREATE TABLE Compra(
    numero_entrada INTEGER,
    dia_entrada DATE,
    cpf INTEGER,
    id_promocao INTEGER,
    CONSTRAINT compra_pkey 
        PRIMARY KEY(numero_entrada, dia_entrada, cpf, id_promocao),
    CONSTRAINT compra_fkey1
        FOREIGN KEY(numero_entrada) REFERENCES Entrada(numero_entrada), 
    CONSTRAINT compra_fkey2
        FOREIGN KEY(dia_entrada) REFERENCES Entrada(dia_entrada),
    CONSTRAINT compra_fkey3
        FOREIGN KEY(cpf) REFERENCES Visitante(cpf),
    CONSTRAINT compra_fkey4
        FOREIGN KEY(id_promocao) REFERENCES Promocao(id)
    
);



CREATE TABLE Entrada(
    numero_entrada INTEGER, 
    dia_entrada DATE, 
    tipo_entrada VARCHAR2(20), 
    hora_entrada TIMESTAMP,
    CONSTRAINT entrada_pkey 
        PRIMARY KEY(dia_entrada, numero_entrada)
);

CREATE TABLE Visitante(
    cpf INTEGER,
    nome VARCHAR2(20),
    sobrenome VARCHAR2(20),
    data_nascimento DATE,
    CONSTRAINT visitante_pkey 
        PRIMARY KEY(cpf)
);

CREATE TABLE Promocao(
    id INTEGER,
    data_inicio DATE,
    data_termino DATE,
    requisitos VARCHAR2(20),
    desconto DECIMAL(5,2),
    CONSTRAINT promocao_pkey 
        PRIMARY KEY(id)
);


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

CREATE TABLE Habitat (
    id INTEGER PRIMARY KEY,
    tamanho DECIMAL(10, 2),
    ultima_manutencao DATE,
    intervalo_manutencao INTEGER,
    qtd_animais INTEGER
);

CREATE TABLE Animal (
    id INTEGER PRIMARY KEY,
    nome_cientifico VARCHAR2(255),
    nome_popular VARCHAR2(100),
    genero VARCHAR2(50),
    nome_proprio VARCHAR2(100),
    habitat INTEGER,
    id_mae INTEGER,
    data_nascimento DATE,
    CONSTRAINT animal_habitat_fkey FOREIGN KEY (habitat) REFERENCES Habitat(id),
    CONSTRAINT animal_mae_fkey FOREIGN KEY (id_mae) REFERENCES Animal(id)
);

CREATE TABLE Alimentacao (
    id_animal INTEGER,
    horario_refeicao TIMESTAMP,
    observacoes VARCHAR2(255),
    quantidade DECIMAL(10, 2),
    descricao VARCHAR2(255),
    CONSTRAINT alimentacao_pkey PRIMARY KEY (id_animal, horario_refeicao),
    CONSTRAINT alimentacao_fkey FOREIGN KEY (id_animal) REFERENCES Animal(id)
);


