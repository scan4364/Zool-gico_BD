ALTER TABLE Medicamento
ADD Quantidade Integer;

INSERT INTO Medicamento
    VALUES ('400ml','Vetagloss',7);
INSERT INTO Medicamento
    VALUES ('40mg','Ivermectina',7);
INSERT INTO Medicamento
    VALUES ('80ml','Ecovet',7);
INSERT INTO Medicamento
    VALUES ('400ml','Lema',7);

UPDATE Medicamento
SET Quantidade = 5
WHERE Quantidade IS NULL;

SELECT Nome, Dosagem, Quantidade FROM Medicamento;

DELETE FROM Medicamento 
    WHERE Quantidade > 5;

SELECT Nome, Dosagem, Quantidade FROM Medicamento;