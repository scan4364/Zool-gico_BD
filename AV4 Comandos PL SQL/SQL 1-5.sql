ALTER TABLE Medicamento
ADD unidades Integer;
ALTER TABLE Medicamento
ADD unidades Integer;

INSERT INTO Medicamento
    VALUES ('400ml','Vetagloss',7);
INSERT INTO Medicamento
    VALUES ('40mg','Ivermectina',2);
INSERT INTO Medicamento
    VALUES ('80ml','Ecovet',10);
INSERT INTO Medicamento
    VALUES ('400ml','Lema',9);

CREATE INDEX ind_medicamento_unidades ON Medicamento(unidades);

UPDATE Medicamento
SET unidades = 5
WHERE unidades IS NULL;

SELECT Nome, Dosagem, unidades FROM Medicamento;

DELETE FROM Medicamento 
    WHERE unidades <= 5;

SELECT Nome, Dosagem, unidades FROM Medicamento;