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
