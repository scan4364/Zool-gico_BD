-- Adicionando uma nova coluna para medir a quantidade de cada medicamento
ALTER TABLE Medicamento
ADD unidades Integer;

-- São adicionados novos medicamentos
INSERT INTO medicamento (Dosagem, Nome, unidades) 
VALUES ('50mg', 'Antibiótico Felino', 20);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('10ml', 'Vermífugo Canino', 15);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('5mg', 'Analgésico para Elefantes', 5);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('100ml', 'Xarope para Gripe Aviária', 12);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('20mg', 'Sedativo para Grandes Felinos', 8);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('30ml', 'Suplemento Nutricional para Répteis', 25);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('15mg', 'Anti-inflamatório para Primatas', 10);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('50ml', 'Hidratante Oral para Mamíferos', 30);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('2mg', 'Analgésico para Aves', 18);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('200mg', 'Antibiótico para Rinocerontes', 7);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('40ml', 'Vitamínico para Ursos', 22);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('75mg', 'Antifúngico para Felinos', 9);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('25ml', 'Suplemento de Cálcio para Répteis', 14);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('60mg', 'Antiparasitário para Mamíferos', 11);

INSERT INTO Medicamento (Dosagem, Nome, unidades) 
VALUES ('80ml', 'Desinfetante Bucal para Hipopótamos', 6);

-- É criado um Index para poder acelerar o UPDATE de medicamentos baseado em unidades
CREATE INDEX ind_medicamento_unidades ON Medicamento(unidades);

-- Considerando que os Medicamentos que existiam antes e que não tinham informações sobre unidades todos tinham 5 unidades
UPDATE Medicamento
SET unidades = 5
WHERE unidades IS NULL;

-- Mostra a tabela com todos os medicamentos
SELECT Nome, Dosagem, unidades FROM Medicamento;

-- Agora consideramos que o Zoológico vá doar medicamentos que tenham mais de 10 unidades para porque indica que esses não são utilizados com frequencia 
DELETE FROM Medicamento 
    WHERE unidades > 10;

-- Mostra a tabela agora com apenas os medicamentos com 10 ou menos unidades, já que os demais foram deletados
SELECT Nome, Dosagem, unidades FROM Medicamento;

-- Mostramos a média de unidades dentre os medicamentos que sobraram
SELECT AVG(unidades) FROM Medicamento;
