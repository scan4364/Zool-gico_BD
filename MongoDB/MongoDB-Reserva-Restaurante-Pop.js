db = db.getSiblingDB("ReservaRestaurantes");

db.createCollection("Restaurantes");
db.createCollection("Mesas");
db.createCollection("Clientes");
db.createCollection("Cardapio");
db.createCollection("Reservas");
db.createCollection("Convidados");

db.Restaurantes.insertMany([
    { _id: 1, CNPJ: "12345678000199", Nome: "Restaurante Bella Vita", Nome_Gerente: "Carlos Silva", num_Tel: "11987654321", Email: "contato@restaurante1.com", Endereco: { Numero: 100, Rua: "Rua A", Cidade: "São Paulo", CEP: "01001000", Complemento: "Loja 1" }, Horario_Funcionamento: "08:00 - 23:00", Capacidade_Lotacao: 50 },
    { _id: 2, CNPJ: "22345678000288", Nome: "Sabores do Mar", Nome_Gerente: "Fernanda Souza", num_Tel: "21987651234", Email: "contato@restaurante2.com", Endereco: { Numero: 200, Rua: "Avenida B", Cidade: "Rio de Janeiro", CEP: "22021010", Complemento: "Loja 5" }, Horario_Funcionamento: "10:00 - 22:00", Capacidade_Lotacao: 80 },
    { _id: 3, CNPJ: "33456789000177", Nome: "La Tavola", Nome_Gerente: "Ricardo Oliveira", num_Tel: "31999998888", Email: "contato@restaurante3.com", Endereco: { Numero: 300, Rua: "Rua C", Cidade: "Belo Horizonte", CEP: "30110010", Complemento: "Sala 3" }, Horario_Funcionamento: "11:00 - 00:00", Capacidade_Lotacao: 70 },
    { _id: 4, CNPJ: "44567890000166", Nome: "Sabor & Arte", Nome_Gerente: "Juliana Santos", num_Tel: "41988887777", Email: "contato@restaurante4.com", Endereco: { Numero: 400, Rua: "Avenida D", Cidade: "Curitiba", CEP: "80010010", Complemento: "Loja 10" }, Horario_Funcionamento: "09:00 - 23:30", Capacidade_Lotacao: 100 },
    { _id: 5, CNPJ: "55678900000155", Nome: "Bistrô Doce & Salgado", Nome_Gerente: "Lucas Pereira", num_Tel: "11977776666", Email: "contato@restaurante5.com", Endereco: { Numero: 500, Rua: "Rua E", Cidade: "Porto Alegre", CEP: "90010020", Complemento: "Andar 2" }, Horario_Funcionamento: "12:00 - 22:00", Capacidade_Lotacao: 60 },
    { _id: 6, CNPJ: "66789000000144", Nome: "Cores e Sabores", Nome_Gerente: "Amanda Costa", num_Tel: "21966665555", Email: "contato@restaurante6.com", Endereco: { Numero: 600, Rua: "Avenida F", Cidade: "Salvador", CEP: "40010030", Complemento: "Loja 7" }, Horario_Funcionamento: "10:30 - 23:00", Capacidade_Lotacao: 90 },
    { _id: 7, CNPJ: "77890000000133", Nome: "Recanto do Sabor", Nome_Gerente: "Pedro Almeida", num_Tel: "31955554444", Email: "contato@restaurante7.com", Endereco: { Numero: 700, Rua: "Rua G", Cidade: "Recife", CEP: "50010040", Complemento: "Sobrado" }, Horario_Funcionamento: "08:30 - 22:30", Capacidade_Lotacao: 85 },
    { _id: 8, CNPJ: "88900000000122", Nome: "Restaurante Fortaleza", Nome_Gerente: "Camila Lima", num_Tel: "41944443333", Email: "contato@restaurante8.com", Endereco: { Numero: 800, Rua: "Avenida H", Cidade: "Fortaleza", CEP: "60010050", Complemento: "Loja 12" }, Horario_Funcionamento: "11:30 - 23:45", Capacidade_Lotacao: 120 },
    { _id: 9, CNPJ: "99000000000111", Nome: "Sabor Amazônico", Nome_Gerente: "Gustavo Mendes", num_Tel: "11933332222", Email: "contato@restaurante9.com", Endereco: { Numero: 900, Rua: "Rua I", Cidade: "Manaus", CEP: "69010060", Complemento: "Galpão 5" }, Horario_Funcionamento: "10:00 - 22:00", Capacidade_Lotacao: 200 },
    { _id: 10, CNPJ: "10111213000100", Nome: "Café & Cia", Nome_Gerente: "Mariana Rocha", num_Tel: "21922221111", Email: "contato@restaurante10.com", Endereco: { Numero: 1000, Rua: "Avenida J", Cidade: "Brasília", CEP: "70010070", Complemento: "Bloco C" }, Horario_Funcionamento: "07:00 - 21:00", Capacidade_Lotacao: 150 },
    { _id: 11, CNPJ: "11121314000199", Nome: "Sabor do Sul", Nome_Gerente: "Bruno Carvalho", num_Tel: "31911110000", Email: "contato@restaurante11.com", Endereco: { Numero: 1100, Rua: "Rua K", Cidade: "Florianópolis", CEP: "88010080", Complemento: "Loja 15" }, Horario_Funcionamento: "09:30 - 23:15", Capacidade_Lotacao: 95 },
    { _id: 12, CNPJ: "12131415000188", Nome: "Cozinha Brasileira", Nome_Gerente: "Patrícia Nunes", num_Tel: "41900009999", Email: "contato@restaurante12.com", Endereco: { Numero: 1200, Rua: "Avenida L", Cidade: "Vitória", CEP: "29010090", Complemento: "Sala 8" }, Horario_Funcionamento: "08:00 - 22:45", Capacidade_Lotacao: 75 },
    { _id: 13, CNPJ: "13141516000177", Nome: "Sabor de Natal", Nome_Gerente: "Roberto Fernandes", num_Tel: "11999998888", Email: "contato@restaurante13.com", Endereco: { Numero: 1300, Rua: "Rua M", Cidade: "Natal", CEP: "59010100", Complemento: "Loja 3" }, Horario_Funcionamento: "11:00 - 23:30", Capacidade_Lotacao: 110 },
    { _id: 14, CNPJ: "14151617000166", Nome: "Tempero de Campo", Nome_Gerente: "Tatiane Martins", num_Tel: "21988887777", Email: "contato@restaurante14.com", Endereco: { Numero: 1400, Rua: "Avenida N", Cidade: "Campo Grande", CEP: "79010110", Complemento: "Andar 4" }, Horario_Funcionamento: "12:00 - 00:00", Capacidade_Lotacao: 130 },
    { _id: 15, CNPJ: "15161718000155", Nome: "Gourmet Grill", Nome_Gerente: "Diego Souza", num_Tel: "31977776666", Email: "contato@restaurante15.com", Endereco: { Numero: 1500, Rua: "Rua O", Cidade: "Cuiabá", CEP: "78010120", Complemento: "Galpão 2" }, Horario_Funcionamento: "10:00 - 22:00", Capacidade_Lotacao: 180 }
]);

db.Mesas.insertMany([
    { _id: 1, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 1 },
    { _id: 2, Numero: 2, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 1 },
    { _id: 3, Numero: 3, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 1 },
    { _id: 4, Numero: 4, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 1 },
    { _id: 5, Numero: 5, Capacidade: 6, Localizacao: "Área VIP", ID_Restaurante: 1 },
    { _id: 6, Numero: 6, Capacidade: 6, Localizacao: "Área VIP", ID_Restaurante: 1 },
    { _id: 7, Numero: 7, Capacidade: 8, Localizacao: "Varanda", ID_Restaurante: 1 },
    { _id: 8, Numero: 8, Capacidade: 8, Localizacao: "Varanda", ID_Restaurante: 1 },
    { _id: 9, Numero: 9, Capacidade: 4, Localizacao: "Jardim", ID_Restaurante: 1 },
    { _id: 10, Numero: 10, Capacidade: 4, Localizacao: "Jardim", ID_Restaurante: 1 },
    { _id: 11, Numero: 11, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 1 },
    { _id: 12, Numero: 12, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 1 },
    { _id: 13, Numero: 13, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 1 },
    { _id: 14, Numero: 14, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 1 },
    { _id: 15, Numero: 15, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 1 },
    { _id: 16, Numero: 16, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 1 },
    { _id: 17, Numero: 17, Capacidade: 12, Localizacao: "Salão Privativo", ID_Restaurante: 1 },
    { _id: 18, Numero: 18, Capacidade: 12, Localizacao: "Salão Privativo", ID_Restaurante: 1 },
    { _id: 19, Numero: 19, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 1 },
    { _id: 20, Numero: 20, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 1 },
    { _id: 21, Numero: 21, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 1 },
    { _id: 22, Numero: 22, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 1 },
    { _id: 23, Numero: 23, Capacidade: 8, Localizacao: "Área Smoking", ID_Restaurante: 1 },
    { _id: 24, Numero: 24, Capacidade: 8, Localizacao: "Área Smoking", ID_Restaurante: 1 },
    { _id: 25, Numero: 25, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 1 },
    { _id: 26, Numero: 26, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 1 },
    { _id: 27, Numero: 27, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 1 },
    { _id: 28, Numero: 28, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 1 },
    { _id: 29, Numero: 29, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 1 },
    { _id: 30, Numero: 30, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 1 }
]);

db.Mesas.insertMany([
    { _id: 31, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 2 },
    { _id: 32, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 2 },
    { _id: 33, Numero: 3, Capacidade: 4, Localizacao: "Varanda", ID_Restaurante: 2 },
    { _id: 34, Numero: 4, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 2 },
    { _id: 35, Numero: 5, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 2 },
    { _id: 36, Numero: 6, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 2 },
    { _id: 37, Numero: 7, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 2 },
    { _id: 38, Numero: 8, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 2 },
    { _id: 39, Numero: 9, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 2 },
    { _id: 40, Numero: 10, Capacidade: 12, Localizacao: "Salão de Eventos", ID_Restaurante: 2 },
    { _id: 41, Numero: 11, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 2 },
    { _id: 42, Numero: 12, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 2 },
    { _id: 43, Numero: 13, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 2 },
    { _id: 44, Numero: 14, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 2 },
    { _id: 45, Numero: 15, Capacidade: 6, Localizacao: "Mezanino", ID_Restaurante: 2 },
    { _id: 46, Numero: 16, Capacidade: 8, Localizacao: "Área Smoking", ID_Restaurante: 2 },
    { _id: 47, Numero: 17, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 2 },
    { _id: 48, Numero: 18, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 2 },
    { _id: 49, Numero: 19, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 2 },
    { _id: 50, Numero: 20, Capacidade: 10, Localizacao: "Salão Privativo", ID_Restaurante: 2 },
    { _id: 51, Numero: 21, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 2 },
    { _id: 52, Numero: 22, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 2 },
    { _id: 53, Numero: 23, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 2 },
    { _id: 54, Numero: 24, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 2 },
    { _id: 55, Numero: 25, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 2 }
]);

db.Mesas.insertMany([
    { _id: 56, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 3 },
    { _id: 57, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 3 },
    { _id: 58, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 3 },
    { _id: 59, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 3 },
    { _id: 60, Numero: 5, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 3 },
    { _id: 61, Numero: 6, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 3 },
    { _id: 62, Numero: 7, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 3 },
    { _id: 63, Numero: 8, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 3 },
    { _id: 64, Numero: 9, Capacidade: 12, Localizacao: "Salão de Eventos", ID_Restaurante: 3 },
    { _id: 65, Numero: 10, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 3 },
    { _id: 66, Numero: 11, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 3 },
    { _id: 67, Numero: 12, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 3 },
    { _id: 68, Numero: 13, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 3 },
    { _id: 69, Numero: 14, Capacidade: 6, Localizacao: "Mezanino", ID_Restaurante: 3 },
    { _id: 70, Numero: 15, Capacidade: 8, Localizacao: "Área Smoking", ID_Restaurante: 3 },
    { _id: 71, Numero: 16, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 3 },
    { _id: 72, Numero: 17, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 3 },
    { _id: 73, Numero: 18, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 3 },
    { _id: 74, Numero: 19, Capacidade: 10, Localizacao: "Salão Privativo", ID_Restaurante: 3 },
    { _id: 75, Numero: 20, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 3 }
]);

db.Mesas.insertMany([
    { _id: 76, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 4 },
    { _id: 77, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 4 },
    { _id: 78, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 4 },
    { _id: 79, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 4 },
    { _id: 80, Numero: 5, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 4 },
    { _id: 81, Numero: 6, Capacidade: 4, Localizacao: "Jardim", ID_Restaurante: 4 },
    { _id: 82, Numero: 7, Capacidade: 6, Localizacao: "Salão de Eventos", ID_Restaurante: 4 },
    { _id: 83, Numero: 8, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 4 },
    { _id: 84, Numero: 9, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 4 },
    { _id: 85, Numero: 10, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 4 },
    { _id: 86, Numero: 11, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 4 },
    { _id: 87, Numero: 12, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 4 },
    { _id: 88, Numero: 13, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 4 },
    { _id: 89, Numero: 14, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 4 },
    { _id: 90, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 4 },
    { _id: 91, Numero: 16, Capacidade: 6, Localizacao: "Salão Privativo", ID_Restaurante: 4 },
    { _id: 92, Numero: 17, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 4 },
    { _id: 93, Numero: 18, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 4 }
]);

db.Mesas.insertMany([
    { _id: 94, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 5 },
    { _id: 95, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 5 },
    { _id: 96, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 5 },
    { _id: 97, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 5 },
    { _id: 98, Numero: 5, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 5 },
    { _id: 99, Numero: 6, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 5 },
    { _id: 100, Numero: 7, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 5 },
    { _id: 101, Numero: 8, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 5 },
    { _id: 102, Numero: 9, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 5 },
    { _id: 103, Numero: 10, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 5 },
    { _id: 104, Numero: 11, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 5 },
    { _id: 105, Numero: 12, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 5 },
    { _id: 106, Numero: 13, Capacidade: 4, Localizacao: "Rooftop", ID_Restaurante: 5 },
    { _id: 107, Numero: 14, Capacidade: 6, Localizacao: "Salão Privativo", ID_Restaurante: 5 },
    { _id: 108, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 5 },
    { _id: 109, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 5 }
]);

db.Mesas.insertMany([
    { _id: 110, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 6 },
    { _id: 111, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 6 },
    { _id: 112, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 6 },
    { _id: 113, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 6 },
    { _id: 114, Numero: 5, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 6 },
    { _id: 115, Numero: 6, Capacidade: 4, Localizacao: "Jardim", ID_Restaurante: 6 },
    { _id: 116, Numero: 7, Capacidade: 6, Localizacao: "Salão de Eventos", ID_Restaurante: 6 },
    { _id: 117, Numero: 8, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 6 },
    { _id: 118, Numero: 9, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 6 },
    { _id: 119, Numero: 10, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 6 },
    { _id: 120, Numero: 11, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 6 },
    { _id: 121, Numero: 12, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 6 },
    { _id: 122, Numero: 13, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 6 },
    { _id: 123, Numero: 14, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 6 },
    { _id: 124, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 6 },
    { _id: 125, Numero: 16, Capacidade: 6, Localizacao: "Salão Privativo", ID_Restaurante: 6 },
    { _id: 126, Numero: 17, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 6 },
    { _id: 127, Numero: 18, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 6 },
    { _id: 128, Numero: 19, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 6 },
    { _id: 129, Numero: 20, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 6 }
]);

db.Mesas.insertMany([
    { _id: 130, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 7 },
    { _id: 131, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 7 },
    { _id: 132, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 7 },
    { _id: 133, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 7 },
    { _id: 134, Numero: 5, Capacidade: 2, Localizacao: "Bar", ID_Restaurante: 7 },
    { _id: 135, Numero: 6, Capacidade: 4, Localizacao: "Jardim", ID_Restaurante: 7 },
    { _id: 136, Numero: 7, Capacidade: 6, Localizacao: "Salão de Eventos", ID_Restaurante: 7 },
    { _id: 137, Numero: 8, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 7 },
    { _id: 138, Numero: 9, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 7 },
    { _id: 139, Numero: 10, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 7 },
    { _id: 140, Numero: 11, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 7 },
    { _id: 141, Numero: 12, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 7 },
    { _id: 142, Numero: 13, Capacidade: 4, Localizacao: "Rooftop", ID_Restaurante: 7 },
    { _id: 143, Numero: 14, Capacidade: 6, Localizacao: "Salão Privativo", ID_Restaurante: 7 },
    { _id: 144, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 7 },
    { _id: 145, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 7 },
    { _id: 146, Numero: 17, Capacidade: 4, Localizacao: "Varanda", ID_Restaurante: 7 }
]);

db.Mesas.insertMany([
    { _id: 147, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 8 },
    { _id: 148, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 8 },
    { _id: 149, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 8 },
    { _id: 150, Numero: 4, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 8 },
    { _id: 151, Numero: 5, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 8 },
    { _id: 152, Numero: 6, Capacidade: 8, Localizacao: "Jardim", ID_Restaurante: 8 },
    { _id: 153, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 8 },
    { _id: 154, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 8 },
    { _id: 155, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 8 },
    { _id: 156, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 8 },
    { _id: 157, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 8 },
    { _id: 158, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 8 },
    { _id: 159, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 8 },
    { _id: 160, Numero: 14, Capacidade: 8, Localizacao: "Salão Privativo", ID_Restaurante: 8 },
    { _id: 161, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 8 },
    { _id: 162, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 8 }
]);

db.Mesas.insertMany([
    { _id: 163, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 9 },
    { _id: 164, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 9 },
    { _id: 165, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 9 },
    { _id: 166, Numero: 4, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 9 },
    { _id: 167, Numero: 5, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 9 },
    { _id: 168, Numero: 6, Capacidade: 8, Localizacao: "Jardim", ID_Restaurante: 9 },
    { _id: 169, Numero: 7, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 9 },
    { _id: 170, Numero: 8, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 9 },
    { _id: 171, Numero: 9, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 9 },
    { _id: 172, Numero: 10, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 9 },
    { _id: 173, Numero: 11, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 9 },
    { _id: 174, Numero: 12, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 9 },
    { _id: 175, Numero: 13, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 9 },
    { _id: 176, Numero: 14, Capacidade: 4, Localizacao: "Salão Privativo", ID_Restaurante: 9 },
    { _id: 177, Numero: 15, Capacidade: 6, Localizacao: "Piso Superior", ID_Restaurante: 9 },
    { _id: 178, Numero: 16, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 9 },
    { _id: 179, Numero: 17, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 9 },
    { _id: 180, Numero: 18, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 9 }
]);

db.Mesas.insertMany([
    { _id: 181, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 10 },
    { _id: 182, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 10 },
    { _id: 183, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 10 },
    { _id: 184, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 10 },
    { _id: 185, Numero: 5, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 10 },
    { _id: 186, Numero: 6, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 10 },
    { _id: 187, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 10 },
    { _id: 188, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 10 },
    { _id: 189, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 10 },
    { _id: 190, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 10 },
    { _id: 191, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 10 },
    { _id: 192, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 10 },
    { _id: 193, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 10 },
    { _id: 194, Numero: 14, Capacidade: 4, Localizacao: "Salão Privativo", ID_Restaurante: 10 },
    { _id: 195, Numero: 15, Capacidade: 6, Localizacao: "Piso Superior", ID_Restaurante: 10 }
]);

db.Mesas.deleteMany({ ID_Restaurante: 10 });

db.Mesas.insertMany([
    { _id: 181, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 100 },
    { _id: 182, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 100 },
    { _id: 183, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 100 },
    { _id: 184, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 100 },
    { _id: 185, Numero: 5, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 100 },
    { _id: 186, Numero: 6, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 100 },
    { _id: 187, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 100 },
    { _id: 188, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 100 },
    { _id: 189, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 100 },
    { _id: 190, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 100 },
    { _id: 191, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 100 },
    { _id: 192, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 100 },
    { _id: 193, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 100 },
    { _id: 194, Numero: 14, Capacidade: 4, Localizacao: "Salão Privativo", ID_Restaurante: 100 },
    { _id: 195, Numero: 15, Capacidade: 6, Localizacao: "Piso Superior", ID_Restaurante: 100 }
]);

db.Mesas.updateMany(
    { ID_Restaurante: 100 },
    {
        $set: { ID_Restaurante: 10 }
    }
)

db.Mesas.insertMany([
    { _id: 196, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 11 },
    { _id: 197, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 11 },
    { _id: 198, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 11 },
    { _id: 199, Numero: 4, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 11 },
    { _id: 200, Numero: 5, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 11 },
    { _id: 201, Numero: 6, Capacidade: 8, Localizacao: "Jardim", ID_Restaurante: 11 },
    { _id: 202, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 11 },
    { _id: 203, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 11 },
    { _id: 204, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 11 },
    { _id: 205, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 11 },
    { _id: 206, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 11 },
    { _id: 207, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 11 },
    { _id: 208, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 11 },
    { _id: 209, Numero: 14, Capacidade: 8, Localizacao: "Salão Privativo", ID_Restaurante: 11 },
    { _id: 210, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 11 },
    { _id: 211, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 11 }
]);

db.Mesas.deleteMany({ ID_Restaurante: 11 });

db.Mesas.insertMany([
    { _id: 196, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 110 },
    { _id: 197, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 110 },
    { _id: 198, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 110 },
    { _id: 199, Numero: 4, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 110 },
    { _id: 200, Numero: 5, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 110 },
    { _id: 201, Numero: 6, Capacidade: 8, Localizacao: "Jardim", ID_Restaurante: 110 },
    { _id: 202, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 110 },
    { _id: 203, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 110 },
    { _id: 204, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 110 },
    { _id: 205, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 110 },
    { _id: 206, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 110 },
    { _id: 207, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 110 },
    { _id: 208, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 110 },
    { _id: 209, Numero: 14, Capacidade: 8, Localizacao: "Salão Privativo", ID_Restaurante: 110 },
    { _id: 210, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 110 },
    { _id: 211, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 110 }
]);

db.Mesas.updateMany(
    { ID_Restaurante: 110 },
    {
        $set: { ID_Restaurante: 11 }
    }
)

db.Mesas.insertMany([
    { _id: 212, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 12 },
    { _id: 213, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 12 },
    { _id: 214, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 12 },
    { _id: 215, Numero: 4, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 12 },
    { _id: 216, Numero: 5, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 12 },
    { _id: 217, Numero: 6, Capacidade: 8, Localizacao: "Jardim", ID_Restaurante: 12 },
    { _id: 218, Numero: 7, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 12 },
    { _id: 219, Numero: 8, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 12 },
    { _id: 220, Numero: 9, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 12 },
    { _id: 221, Numero: 10, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 12 },
    { _id: 222, Numero: 11, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 12 },
    { _id: 223, Numero: 12, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 12 },
    { _id: 224, Numero: 13, Capacidade: 4, Localizacao: "Rooftop", ID_Restaurante: 12 },
    { _id: 225, Numero: 14, Capacidade: 6, Localizacao: "Salão Privativo", ID_Restaurante: 12 },
    { _id: 226, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 12 },
    { _id: 227, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 12 },
    { _id: 228, Numero: 17, Capacidade: 4, Localizacao: "Varanda", ID_Restaurante: 12 }
]);

db.Mesas.insertMany([
    { _id: 229, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 13 },
    { _id: 230, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 13 },
    { _id: 231, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 13 },
    { _id: 232, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 13 },
    { _id: 233, Numero: 5, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 13 },
    { _id: 234, Numero: 6, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 13 },
    { _id: 235, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 13 },
    { _id: 236, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 13 },
    { _id: 237, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 13 },
    { _id: 238, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 13 },
    { _id: 239, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 13 },
    { _id: 240, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 13 },
    { _id: 241, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 13 },
    { _id: 242, Numero: 14, Capacidade: 4, Localizacao: "Salão Privativo", ID_Restaurante: 13 },
    { _id: 243, Numero: 15, Capacidade: 6, Localizacao: "Piso Superior", ID_Restaurante: 13 }
]);

db.Mesas.insertMany([
    { _id: 244, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 14 },
    { _id: 245, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 14 },
    { _id: 246, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 14 },
    { _id: 247, Numero: 4, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 14 },
    { _id: 248, Numero: 5, Capacidade: 6, Localizacao: "Bar", ID_Restaurante: 14 },
    { _id: 249, Numero: 6, Capacidade: 8, Localizacao: "Jardim", ID_Restaurante: 14 },
    { _id: 250, Numero: 7, Capacidade: 10, Localizacao: "Salão de Eventos", ID_Restaurante: 14 },
    { _id: 251, Numero: 8, Capacidade: 4, Localizacao: "Terraço", ID_Restaurante: 14 },
    { _id: 252, Numero: 9, Capacidade: 6, Localizacao: "Área Externa", ID_Restaurante: 14 },
    { _id: 253, Numero: 10, Capacidade: 8, Localizacao: "Mezanino", ID_Restaurante: 14 },
    { _id: 254, Numero: 11, Capacidade: 4, Localizacao: "Área Smoking", ID_Restaurante: 14 },
    { _id: 255, Numero: 12, Capacidade: 6, Localizacao: "Lounge", ID_Restaurante: 14 },
    { _id: 256, Numero: 13, Capacidade: 8, Localizacao: "Rooftop", ID_Restaurante: 14 },
    { _id: 257, Numero: 14, Capacidade: 4, Localizacao: "Salão Privativo", ID_Restaurante: 14 },
    { _id: 258, Numero: 15, Capacidade: 6, Localizacao: "Piso Superior", ID_Restaurante: 14 },
    { _id: 259, Numero: 16, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 14 },
    { _id: 260, Numero: 17, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 14 },
    { _id: 261, Numero: 18, Capacidade: 4, Localizacao: "Área VIP", ID_Restaurante: 14 }
]);

db.Mesas.insertMany([
    { _id: 262, Numero: 1, Capacidade: 2, Localizacao: "Área Interna", ID_Restaurante: 15 },
    { _id: 263, Numero: 2, Capacidade: 4, Localizacao: "Área Interna", ID_Restaurante: 15 },
    { _id: 264, Numero: 3, Capacidade: 6, Localizacao: "Varanda", ID_Restaurante: 15 },
    { _id: 265, Numero: 4, Capacidade: 8, Localizacao: "Área VIP", ID_Restaurante: 15 },
    { _id: 266, Numero: 5, Capacidade: 4, Localizacao: "Bar", ID_Restaurante: 15 },
    { _id: 267, Numero: 6, Capacidade: 6, Localizacao: "Jardim", ID_Restaurante: 15 },
    { _id: 268, Numero: 7, Capacidade: 4, Localizacao: "Salão de Eventos", ID_Restaurante: 15 },
    { _id: 269, Numero: 8, Capacidade: 6, Localizacao: "Terraço", ID_Restaurante: 15 },
    { _id: 270, Numero: 9, Capacidade: 8, Localizacao: "Área Externa", ID_Restaurante: 15 },
    { _id: 271, Numero: 10, Capacidade: 4, Localizacao: "Mezanino", ID_Restaurante: 15 },
    { _id: 272, Numero: 11, Capacidade: 6, Localizacao: "Área Smoking", ID_Restaurante: 15 },
    { _id: 273, Numero: 12, Capacidade: 4, Localizacao: "Lounge", ID_Restaurante: 15 },
    { _id: 274, Numero: 13, Capacidade: 6, Localizacao: "Rooftop", ID_Restaurante: 15 },
    { _id: 275, Numero: 14, Capacidade: 8, Localizacao: "Salão Privativo", ID_Restaurante: 15 },
    { _id: 276, Numero: 15, Capacidade: 4, Localizacao: "Piso Superior", ID_Restaurante: 15 },
    { _id: 277, Numero: 16, Capacidade: 6, Localizacao: "Área Interna", ID_Restaurante: 15 }
]);

db.Clientes.insertMany([
    { CPF: "12345678900", Nome: "Ana Souza", Email: "ana@gmail.com", Num_Tel: "11999998888", Endereco: { Numero: 25, Rua: "Av. Brasil", Cidade: "Rio de Janeiro", CEP: "22041001", Complemento: "Apto 202" } },
    { CPF: "98765432100", Nome: "Marcos Pereira", Email: "marcos@gmail.com", Num_Tel: "11988887777", Endereco: { Numero: 50, Rua: "Rua das Flores", Cidade: "São Paulo", CEP: "01310920", Complemento: "Casa" } },
    { CPF: "65432198700", Nome: "Juliana Costa", Email: "juliana@gmail.com", Num_Tel: "21977776666", Endereco: { Numero: 80, Rua: "Avenida Central", Cidade: "Belo Horizonte", CEP: "30110010", Complemento: "Bloco B" } },
    { CPF: "32165498700", Nome: "Rafael Lima", Email: "rafael@gmail.com", Num_Tel: "21966665555", Endereco: { Numero: 120, Rua: "Rua das Palmeiras", Cidade: "Niterói", CEP: "24020010", Complemento: "Apto 501" } },
    { CPF: "78912345600", Nome: "Carla Dias", Email: "carla@hotmail.com", Num_Tel: "11955554444", Endereco: { Numero: 200, Rua: "Alameda Santos", Cidade: "São Paulo", CEP: "01418000", Complemento: "Sala 10" } },
    { CPF: "45678912300", Nome: "Fernando Alves", Email: "fernando@yahoo.com", Num_Tel: "31944443333", Endereco: { Numero: 300, Rua: "Avenida Paulista", Cidade: "São Paulo", CEP: "01311000", Complemento: "Conjunto 3" } },
    { CPF: "15975348620", Nome: "Larissa Gomes", Email: "larissa@outlook.com", Num_Tel: "41933332222", Endereco: { Numero: 150, Rua: "Rua da Praia", Cidade: "Florianópolis", CEP: "88010000", Complemento: "Cobertura" } },
    { CPF: "35715985246", Nome: "Gabriel Rocha", Email: "gabriel@protonmail.com", Num_Tel: "11922221111", Endereco: { Numero: 75, Rua: "Travessa das Acácias", Cidade: "Porto Alegre", CEP: "90010000", Complemento: "Fundos" } },
    { CPF: "25836914700", Nome: "Patrícia Nascimento", Email: "patricia@icloud.com", Num_Tel: "21911110000", Endereco: { Numero: 90, Rua: "Rua dos Coqueiros", Cidade: "Salvador", CEP: "40010000", Complemento: "Loja 5" } },
    { CPF: "95175385246", Nome: "Rodrigo Silva", Email: "rodrigo@fastmail.com", Num_Tel: "31900009999", Endereco: { Numero: 45, Rua: "Avenida das Américas", Cidade: "Rio de Janeiro", CEP: "22640000", Complemento: "Apto 1001" } },
    { CPF: "75395185246", Nome: "Mariana Oliveira", Email: "mariana@zoho.com", Num_Tel: "41999997777", Endereco: { Numero: 500, Rua: "Rua das Rosas", Cidade: "Curitiba", CEP: "80010000", Complemento: "Casa 2" } },
    { CPF: "85274196300", Nome: "Thiago Castro", Email: "thiago@mail.com", Num_Tel: "11988886666", Endereco: { Numero: 60, Rua: "Alameda Juazeiro", Cidade: "Fortaleza", CEP: "60010000", Complemento: "Sobrado" } },
    { CPF: "96385274100", Nome: "Isabela Santos", Email: "isabela@aol.com", Num_Tel: "21977775555", Endereco: { Numero: 35, Rua: "Avenida Beira Mar", Cidade: "Recife", CEP: "50010000", Complemento: "Apto 303" } },
    { CPF: "74185296300", Nome: "Leonardo Costa", Email: "leonardo@yandex.com", Num_Tel: "31966664444", Endereco: { Numero: 80, Rua: "Rua dos Ipês", Cidade: "Brasília", CEP: "70010000", Complemento: "Bloco D" } },
    { CPF: "36925814700", Nome: "Beatriz Almeida", Email: "beatriz@live.com", Num_Tel: "41955553333", Endereco: { Numero: 25, Rua: "Travessa das Flores", Cidade: "Manaus", CEP: "69010000", Complemento: "Galpão 1" } },
    { CPF: "14725836900", Nome: "Vitor Pereira", Email: "vitor@inbox.com", Num_Tel: "11944442222", Endereco: { Numero: 100, Rua: "Avenida Central", Cidade: "Vitória", CEP: "29010000", Complemento: "Loja 8" } },
    { CPF: "25814736900", Nome: "Camila Mendes", Email: "camila@gmx.com", Num_Tel: "21933331111", Endereco: { Numero: 200, Rua: "Rua das Acácias", Cidade: "Natal", CEP: "59010000", Complemento: "Apto 404" } },
    { CPF: "98765412300", Nome: "Lucas Barbosa", Email: "lucas@hushmail.com", Num_Tel: "31922220000", Endereco: { Numero: 150, Rua: "Alameda dos Anjos", Cidade: "Campo Grande", CEP: "79010000", Complemento: "Casa 5" } },
    { CPF: "65498732100", Nome: "Amanda Lima", Email: "amanda@tutanota.com", Num_Tel: "41911112222", Endereco: { Numero: 300, Rua: "Rua das Estrelas", Cidade: "Cuiabá", CEP: "78010000", Complemento: "Sala 12" } },
    { CPF: "32198765400", Nome: "Gustavo Martins", Email: "gustavo@mailinator.com", Num_Tel: "11900001111", Endereco: { Numero: 40, Rua: "Avenida das Palmeiras", Cidade: "Porto Velho", CEP: "76810000", Complemento: "Apto 201" } }
]);

db.Cardapio.insertMany([
    { _id: 1, Nome_Prato: "Pizza Margherita", Ingredientes: ["Massa", "Molho de Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 1 },
    { _id: 2, Nome_Prato: "Salmão Grelhado", Ingredientes: ["Salmão", "Limão", "Ervas Finas"], horarios: "11:00 - 23:00", status: "Disponível", Restaurante_Id: 1 },
    { _id: 3, Nome_Prato: "Risoto de Camarão", Ingredientes: ["Arroz Arbóreo", "Camarão", "Queijo Parmesão"], horarios: "12:00 - 21:00", status: "Indisponível", Restaurante_Id: 1 },
    { _id: 4, Nome_Prato: "Hambúrguer Artesanal", Ingredientes: ["Pão Brioche", "Carne Angus", "Queijo Cheddar"], horarios: "12:00 - 02:00", status: "Disponível", Restaurante_Id: 1 },
    { _id: 5, Nome_Prato: "Filé Mignon ao Molho Madeira", Ingredientes: ["Filé Mignon", "Molho Madeira", "Purê de Batata"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 1 },
    { _id: 6, Nome_Prato: "Tacos Mexicanos", Ingredientes: ["Tortilla", "Carne Moída", "Queijo", "Pimenta"], horarios: "13:00 - 22:00", status: "Disponível", Restaurante_Id: 1 },
    { _id: 7, Nome_Prato: "Lasanha à Bolonhesa", Ingredientes: ["Massa", "Carne Moída", "Molho Bechamel"], horarios: "11:30 - 21:30", status: "Disponível", Restaurante_Id: 1 },
    { _id: 8, Nome_Prato: "Sushi Variado", Ingredientes: ["Arroz", "Salmão", "Atum", "Alga Nori"], horarios: "18:00 - 23:00", status: "Indisponível", Restaurante_Id: 1 },
    { _id: 9, Nome_Prato: "Frango à Parmegiana", Ingredientes: ["Filé de Frango", "Molho de Tomate", "Queijo"], horarios: "11:00 - 22:00", status: "Disponível", Restaurante_Id: 1 },
    { _id: 10, Nome_Prato: "Carpaccio de Beterraba", Ingredientes: ["Beterraba", "Rúcula", "Queijo Grana Padano"], horarios: "10:00 - 20:00", status: "Disponível", Restaurante_Id: 1 },

    { _id: 11, Nome_Prato: "Pizza Napolitana", Ingredientes: ["Massa", "Molho de Tomate", "Mussarela", "Manjericão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 12, Nome_Prato: "Camarão ao Alho e Óleo", Ingredientes: ["Camarão", "Alho", "Óleo", "Ervas"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 13, Nome_Prato: "Feijoada Completa", Ingredientes: ["Feijão Preto", "Carne Seca", "Linguiça"], horarios: "11:30 - 17:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 14, Nome_Prato: "Espaguete à Carbonara", Ingredientes: ["Espaguete", "Bacon", "Queijo Pecorino", "Ovos"], horarios: "12:00 - 21:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 15, Nome_Prato: "Sopa de Abóbora", Ingredientes: ["Abóbora", "Alho", "Cebola", "Creme de Leite"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 16, Nome_Prato: "Churrasco de Costela", Ingredientes: ["Costela de Boi", "Sal grosso", "Carvão"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 17, Nome_Prato: "Tiramisù", Ingredientes: ["Biscoito Champagne", "Café", "Mascarpone"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 18, Nome_Prato: "Creme de Leite com Cogumelos", Ingredientes: ["Cogumelos", "Creme de Leite", "Cebola", "Alho"], horarios: "13:00 - 21:00", status: "Disponível", Restaurante_Id: 2 },
    { _id: 19, Nome_Prato: "Ceviche de Peixe", Ingredientes: ["Peixe Branco", "Limão", "Cebola Roxa", "Cilantro"], horarios: "11:00 - 19:00", status: "Indisponível", Restaurante_Id: 2 },

    { _id: 20, Nome_Prato: "Bacalhau à Brás", Ingredientes: ["Bacalhau", "Batatas", "Ovos", "Azeitonas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 21, Nome_Prato: "Bife à Parmegiana", Ingredientes: ["Filé Mignon", "Molho de Tomate", "Queijo Mussarela"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 22, Nome_Prato: "Lombinho de Porco", Ingredientes: ["Lombinho", "Alho", "Ervas"], horarios: "11:00 - 23:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 23, Nome_Prato: "Salada Caprese", Ingredientes: ["Tomate", "Mussarela de Búfala", "Manjericão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 24, Nome_Prato: "Moqueca de Peixe", Ingredientes: ["Peixe Branco", "Leite de Coco", "Azeite de Dendê"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 25, Nome_Prato: "Frango Grelhado com Legumes", Ingredientes: ["Filé de Frango", "Cenoura", "Abobrinha", "Brócolis"], horarios: "11:00 - 22:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 26, Nome_Prato: "Risoto de Cogumelos", Ingredientes: ["Arroz Arbóreo", "Cogumelos", "Queijo Parmesão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 27, Nome_Prato: "Tartar de Atum", Ingredientes: ["Atum", "Alho", "Ervas", "Azeite"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 3 },
    { _id: 28, Nome_Prato: "Nhoque de Batata", Ingredientes: ["Batata", "Farinha de Trigo", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 3 },

    { _id: 29, Nome_Prato: "Frango Assado", Ingredientes: ["Frango", "Ervas", "Alho", "Limão"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 30, Nome_Prato: "Picanha na Brasa", Ingredientes: ["Picanha", "Sal Grosso", "Carvão"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 31, Nome_Prato: "Coxinha de Frango", Ingredientes: ["Frango Desfiado", "Massa de Coxinha", "Requeijão"], horarios: "10:00 - 20:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 32, Nome_Prato: "Espetinho de Carne", Ingredientes: ["Carne de Alcatra", "Cebola", "Pimentão", "Temperos"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 33, Nome_Prato: "Salada de Frutas", Ingredientes: ["Melancia", "Abacaxi", "Uva", "Laranja"], horarios: "08:00 - 20:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 34, Nome_Prato: "Churrasco Vegetariano", Ingredientes: ["Cogumelos", "Pimentão", "Abobrinha", "Berinjela"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 35, Nome_Prato: "Mocotó", Ingredientes: ["Mocotó de boi", "Feijão Branco", "Temperos"], horarios: "11:00 - 19:00", status: "Indisponível", Restaurante_Id: 4 },
    { _id: 36, Nome_Prato: "Escondidinho de Carne Seca", Ingredientes: ["Carne Seca", "Purê de Mandioquinha", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 37, Nome_Prato: "Batata Rosti", Ingredientes: ["Batata Ralada", "Queijo", "Ervas Finas"], horarios: "11:00 - 21:00", status: "Disponível", Restaurante_Id: 4 },
    { _id: 38, Nome_Prato: "Feijão Tropeiro", Ingredientes: ["Feijão", "Torresmo", "Ovos", "Farinha de Mandioca"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 4 },

    { _id: 39, Nome_Prato: "Pizza de Calabresa", Ingredientes: ["Massa", "Calabresa", "Cebola", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 40, Nome_Prato: "Carne de Sol com Macaxeira", Ingredientes: ["Carne de Sol", "Macaxeira", "Azeite"], horarios: "11:00 - 22:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 41, Nome_Prato: "Peixe à Espanhola", Ingredientes: ["Peixe Branco", "Pimentão", "Tomate", "Cebola"], horarios: "11:00 - 21:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 42, Nome_Prato: "Escondidinho de Frango", Ingredientes: ["Frango Desfiado", "Purê de Batata", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 43, Nome_Prato: "Bacalhau à Gomes de Sá", Ingredientes: ["Bacalhau", "Batata", "Cebola", "Azeitona"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 44, Nome_Prato: "Feijão Carioca", Ingredientes: ["Feijão Carioca", "Linguiça", "Bacon"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 45, Nome_Prato: "Arroz de Pato", Ingredientes: ["Pato", "Arroz", "Ervas", "Azeite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 46, Nome_Prato: "Acarajé", Ingredientes: ["Feijão Fradinho", "Camarão", "Pimenta"], horarios: "10:00 - 20:00", status: "Indisponível", Restaurante_Id: 5 },
    { _id: 47, Nome_Prato: "Cuscuz Paulista", Ingredientes: ["Milho", "Frango", "Linguiça", "Tomate"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 5 },
    { _id: 48, Nome_Prato: "Mousse de Maracujá", Ingredientes: ["Maracujá", "Leite Condensado", "Creme de Leite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 5 },

    { _id: 49, Nome_Prato: "Pizza Quatro Queijos", Ingredientes: ["Massa", "Mussarela", "Parmesão", "Gorgonzola", "Provolone"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 50, Nome_Prato: "Frango à Milanesa", Ingredientes: ["Frango", "Farinha de Trigo", "Óleo"], horarios: "12:00 - 21:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 51, Nome_Prato: "Salmão ao Molho de Maracujá", Ingredientes: ["Salmão", "Maracujá", "Ervas Finas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 52, Nome_Prato: "Torta de Frango", Ingredientes: ["Massa", "Frango", "Requeijão", "Milho"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 53, Nome_Prato: "Strogonoff de Carne", Ingredientes: ["Carne", "Creme de Leite", "Champignon"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 54, Nome_Prato: "Lasanha Vegetariana", Ingredientes: ["Massa", "Molho Bechamel", "Legumes"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 55, Nome_Prato: "Bacalhau à Lagareiro", Ingredientes: ["Bacalhau", "Batata", "Azeite de Oliva", "Alho"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 56, Nome_Prato: "Polenta Frita", Ingredientes: ["Milho", "Queijo", "Óleo"], horarios: "11:00 - 21:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 57, Nome_Prato: "Robalo Grelhado", Ingredientes: ["Robalo", "Limão", "Ervas Finas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 6 },
    { _id: 58, Nome_Prato: "Caldinho de Feijão", Ingredientes: ["Feijão", "Bacon", "Cebola"], horarios: "08:00 - 20:00", status: "Indisponível", Restaurante_Id: 6 },

    { _id: 59, Nome_Prato: "Pizza de Pepperoni", Ingredientes: ["Massa", "Pepperoni", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 60, Nome_Prato: "Bife de Chorizo", Ingredientes: ["Bife de Chorizo", "Sal Grosso"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 61, Nome_Prato: "Croissant de Queijo", Ingredientes: ["Massa Folhada", "Queijo"], horarios: "07:00 - 19:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 62, Nome_Prato: "Sopa de Cebola", Ingredientes: ["Cebola", "Caldo de Carne", "Queijo Gruyère"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 63, Nome_Prato: "Ratatouille", Ingredientes: ["Berinjela", "Abobrinha", "Tomate", "Alho"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 64, Nome_Prato: "Baguete de Salmão", Ingredientes: ["Pão Baguete", "Salmão", "Cream Cheese"], horarios: "08:00 - 20:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 65, Nome_Prato: "Moules Marinières", Ingredientes: ["Mexilhões", "Vinho Branco", "Alho", "Ervas"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 66, Nome_Prato: "Crepes de Nutella", Ingredientes: ["Crepe", "Nutella", "Morango"], horarios: "08:00 - 21:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 67, Nome_Prato: "Quiche Lorraine", Ingredientes: ["Massa", "Bacon", "Creme de Leite", "Queijo"], horarios: "11:00 - 22:00", status: "Disponível", Restaurante_Id: 7 },
    { _id: 68, Nome_Prato: "Escargots à la Bourguignonne", Ingredientes: ["Escargots", "Alho", "Manteiga"], horarios: "12:00 - 22:00", status: "Indisponível", Restaurante_Id: 7 },

    { _id: 69, Nome_Prato: "Pizza de Frango com Catupiry", Ingredientes: ["Massa", "Frango Desfiado", "Catupiry", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 70, Nome_Prato: "Lasanha de Carne", Ingredientes: ["Massa", "Carne Moída", "Molho de Tomate", "Queijo"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 71, Nome_Prato: "Feijoada Completa", Ingredientes: ["Feijão Preto", "Carne Seca", "Linguiça", "Arroz", "Farofa"], horarios: "11:00 - 16:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 72, Nome_Prato: "Moqueca de Peixe", Ingredientes: ["Peixe Branco", "Coco", "Cebola", "Tomate", "Pimentão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 73, Nome_Prato: "Risoto de Cogumelos", Ingredientes: ["Arroz", "Cogumelos", "Caldo de Legumes", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 74, Nome_Prato: "Bacalhau à Brás", Ingredientes: ["Bacalhau", "Batata Palha", "Ovo", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 75, Nome_Prato: "Pasta Carbonara", Ingredientes: ["Massa", "Bacon", "Ovo", "Queijo Parmesão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 76, Nome_Prato: "Frango ao Curry", Ingredientes: ["Frango", "Curry", "Cebola", "Coco"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 77, Nome_Prato: "Batata Assada com Alecrim", Ingredientes: ["Batata", "Alecrim", "Azeite", "Sal"], horarios: "11:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },
    { _id: 78, Nome_Prato: "Salmão Grelhado", Ingredientes: ["Salmão", "Limão", "Ervas Finas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 8 },

    { _id: 79, Nome_Prato: "Camarão na Moranga", Ingredientes: ["Camarão", "Abóbora", "Creme de Leite", "Ervas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 80, Nome_Prato: "Picanha na Chapa", Ingredientes: ["Picanha", "Sal Grosso", "Limão"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 81, Nome_Prato: "Feijão Tropeiro", Ingredientes: ["Feijão", "Torresmo", "Ovos", "Farinha de Mandioca"], horarios: "11:00 - 19:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 82, Nome_Prato: "Polenta Cremosa", Ingredientes: ["Milho", "Creme de Leite", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 83, Nome_Prato: "Risoto de Camarão", Ingredientes: ["Arroz", "Camarão", "Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 84, Nome_Prato: "Escondidinho de Carne Seca", Ingredientes: ["Carne Seca", "Purê de Batata", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 85, Nome_Prato: "Bacalhau à Lagareiro", Ingredientes: ["Bacalhau", "Batata", "Alho", "Azeite de Oliva"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 86, Nome_Prato: "Churrasco de Linguiça", Ingredientes: ["Linguiça", "Sal Grosso", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 87, Nome_Prato: "Moqueca de Camarão", Ingredientes: ["Camarão", "Coco", "Pimentão", "Tomate"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 9 },
    { _id: 88, Nome_Prato: "Carne de Sol com Queijo Coalho", Ingredientes: ["Carne de Sol", "Queijo Coalho", "Azeite", "Cebola"], horarios: "12:00 - 23:00", status: "Disponível", Restaurante_Id: 9 },

    { _id: 89, Nome_Prato: "Risoto de Limão Siciliano", Ingredientes: ["Arroz", "Limão Siciliano", "Creme de Leite", "Queijo Parmesão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 90, Nome_Prato: "Pizza Margherita", Ingredientes: ["Massa", "Mussarela", "Tomate", "Manjericão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 91, Nome_Prato: "Curry de Legumes", Ingredientes: ["Curry", "Legumes", "Arroz", "Creme de Leite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 92, Nome_Prato: "Bife à Parmegiana", Ingredientes: ["Carne", "Molho de Tomate", "Queijo", "Farinha de Rosca"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 93, Nome_Prato: "Sopa de Abóbora", Ingredientes: ["Abóbora", "Cebola", "Ervas Finas"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 94, Nome_Prato: "Tiramisu", Ingredientes: ["Mascarpone", "Café", "Biscoito", "Cacau"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 95, Nome_Prato: "Frango Assado com Batatas", Ingredientes: ["Frango", "Batata", "Alecrim", "Azeite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 96, Nome_Prato: "Canelone de Ricota", Ingredientes: ["Massa de Canelone", "Ricota", "Molho de Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 97, Nome_Prato: "Peixe Grelhado com Legumes", Ingredientes: ["Peixe", "Legumes", "Azeite", "Limão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },
    { _id: 98, Nome_Prato: "Pizza de Atum", Ingredientes: ["Massa", "Atum", "Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 10 },

    { _id: 99, Nome_Prato: "Feijão Tropeiro", Ingredientes: ["Feijão", "Linguiça", "Torresmo", "Farinha"], horarios: "11:00 - 19:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 100, Nome_Prato: "Filé à Parmegiana", Ingredientes: ["Filé de Carne", "Molho de Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 101, Nome_Prato: "Bacalhau à Brás", Ingredientes: ["Bacalhau", "Batata Palha", "Ovo", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 102, Nome_Prato: "Escondidinho de Carne Seca", Ingredientes: ["Carne Seca", "Purê de Batata", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 103, Nome_Prato: "Moqueca de Peixe", Ingredientes: ["Peixe Branco", "Coco", "Cebola", "Pimentão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 104, Nome_Prato: "Sopa de Feijão", Ingredientes: ["Feijão", "Bacon", "Cebola"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 105, Nome_Prato: "Arroz de Carne de Sol", Ingredientes: ["Arroz", "Carne de Sol", "Ervas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 106, Nome_Prato: "Salmão ao Molho de Laranja", Ingredientes: ["Salmão", "Laranja", "Ervas", "Azeite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 107, Nome_Prato: "Frango Grelhado com Molho de Mostarda", Ingredientes: ["Frango", "Mostarda", "Mel", "Ervas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 11 },
    { _id: 108, Nome_Prato: "Coxinha de Frango", Ingredientes: ["Frango", "Massa de Coxinha", "Requeijão"], horarios: "10:00 - 20:00", status: "Disponível", Restaurante_Id: 11 },

    { _id: 109, Nome_Prato: "Feijão Tropeiro", Ingredientes: ["Feijão", "Torresmo", "Linguiça", "Farinha de Mandioca"], horarios: "11:00 - 19:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 110, Nome_Prato: "Bacalhau à Lagareiro", Ingredientes: ["Bacalhau", "Batata", "Alho", "Azeite de Oliva"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 111, Nome_Prato: "Churrasco de Picanha", Ingredientes: ["Picanha", "Sal Grosso", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 112, Nome_Prato: "Escondidinho de Carne Seca", Ingredientes: ["Carne Seca", "Purê de Batata", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 113, Nome_Prato: "Moqueca de Camarão", Ingredientes: ["Camarão", "Coco", "Tomate", "Pimentão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 114, Nome_Prato: "Risoto de Limão Siciliano", Ingredientes: ["Arroz", "Limão Siciliano", "Creme de Leite", "Queijo Parmesão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 115, Nome_Prato: "Frango Assado com Batatas", Ingredientes: ["Frango", "Batata", "Alecrim", "Azeite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 116, Nome_Prato: "Tirinhas de Peixe Empanado", Ingredientes: ["Peixe", "Farinha de Rosca", "Óleo", "Limão"], horarios: "11:00 - 19:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 117, Nome_Prato: "Polenta Cremosa com Queijo", Ingredientes: ["Milho", "Creme de Leite", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },
    { _id: 118, Nome_Prato: "Pizza de Calabresa", Ingredientes: ["Massa", "Calabresa", "Queijo", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 12 },

    { _id: 119, Nome_Prato: "Pizza de Quatro Queijos", Ingredientes: ["Massa", "Mussarela", "Gorgonzola", "Parmesão", "Catupiry"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 120, Nome_Prato: "Lasanha de Berinjela", Ingredientes: ["Berinjela", "Molho de Tomate", "Queijo", "Massa"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 121, Nome_Prato: "Canelone de Ricota e Espinafre", Ingredientes: ["Canelone", "Ricota", "Espinafre", "Molho de Tomate"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 122, Nome_Prato: "Frango à Parmegiana", Ingredientes: ["Frango", "Molho de Tomate", "Queijo", "Farinha de Rosca"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 123, Nome_Prato: "Risoto de Cogumelos", Ingredientes: ["Arroz", "Cogumelos", "Caldo de Legumes", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 124, Nome_Prato: "Pizza de Pepperoni", Ingredientes: ["Massa", "Pepperoni", "Queijo", "Molho de Tomate"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 125, Nome_Prato: "Bacalhau à Brás", Ingredientes: ["Bacalhau", "Batata Palha", "Ovo", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 126, Nome_Prato: "Camarão na Moranga", Ingredientes: ["Camarão", "Abóbora", "Creme de Leite", "Ervas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 127, Nome_Prato: "Frango Grelhado com Molho de Mostarda", Ingredientes: ["Frango", "Mostarda", "Mel", "Ervas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 13 },
    { _id: 128, Nome_Prato: "Feijoada Completa", Ingredientes: ["Feijão Preto", "Carne Seca", "Linguiça", "Arroz", "Farofa"], horarios: "12:00 - 16:00", status: "Disponível", Restaurante_Id: 13 },

    { _id: 129, Nome_Prato: "Feijão Tropeiro", Ingredientes: ["Feijão", "Linguiça", "Torresmo", "Farinha"], horarios: "11:00 - 19:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 130, Nome_Prato: "Frango com Quiabo", Ingredientes: ["Frango", "Quiabo", "Arroz"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 131, Nome_Prato: "Arroz Carreteiro", Ingredientes: ["Arroz", "Carne Seca", "Linguiça", "Tomate"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 132, Nome_Prato: "Feijão Preto com Carne de Sol", Ingredientes: ["Feijão Preto", "Carne de Sol", "Arroz", "Farofa"], horarios: "11:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 133, Nome_Prato: "Bacalhau à Gomes de Sá", Ingredientes: ["Bacalhau", "Batata", "Cebola", "Azeite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 134, Nome_Prato: "Coxinha de Frango", Ingredientes: ["Frango", "Massa de Coxinha", "Requeijão"], horarios: "10:00 - 20:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 135, Nome_Prato: "Polenta Frita", Ingredientes: ["Polenta", "Óleo", "Sal"], horarios: "11:00 - 20:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 136, Nome_Prato: "Peixe Grelhado com Molho de Alho", Ingredientes: ["Peixe", "Alho", "Ervas", "Azeite"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 137, Nome_Prato: "Lasanha de Carne", Ingredientes: ["Massa", "Carne Moída", "Molho de Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },
    { _id: 138, Nome_Prato: "Risoto de Carne Seca", Ingredientes: ["Arroz", "Carne Seca", "Ervas", "Caldo de Carne"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 14 },

    { _id: 139, Nome_Prato: "Churrasco de Frango", Ingredientes: ["Frango", "Sal Grosso", "Ervas", "Limão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 140, Nome_Prato: "Feijão de Corda com Carne de Sol", Ingredientes: ["Feijão de Corda", "Carne de Sol", "Arroz"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 141, Nome_Prato: "Bacalhau com Natas", Ingredientes: ["Bacalhau", "Creme de Leite", "Batata", "Cebola"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 142, Nome_Prato: "Escondidinho de Frango", Ingredientes: ["Frango", "Purê de Batata", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 143, Nome_Prato: "Risoto de Camarão", Ingredientes: ["Arroz", "Camarão", "Molho de Tomate", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 144, Nome_Prato: "Camarão Empanado", Ingredientes: ["Camarão", "Farinha de Rosca", "Óleo", "Limão"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 145, Nome_Prato: "Feijão Tropeiro", Ingredientes: ["Feijão", "Linguiça", "Torresmo", "Farinha"], horarios: "11:00 - 19:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 146, Nome_Prato: "Arroz de Peixe", Ingredientes: ["Arroz", "Peixe", "Tomate", "Ervas"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 147, Nome_Prato: "Pizza de Frango com Catupiry", Ingredientes: ["Massa", "Frango", "Catupiry", "Queijo"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 },
    { _id: 148, Nome_Prato: "Bife à Milanesa", Ingredientes: ["Carne", "Farinha de Trigo", "Ovo", "Farinha de Rosca"], horarios: "12:00 - 22:00", status: "Disponível", Restaurante_Id: 15 }
]);



db.Reservas.insertMany([
    { _id: 1, CPF_C: "12345678900", ID_Restaurante: 1, Dia: "2025-03-27", Hora: "19:30", Status: "Confirmada", Mesas: [23, 56], Convidados: [{ ID: 1, Nome: "João Pereira" }, { ID: 2, Nome: "Fernanda Lima" }] },
    { _id: 2, CPF_C: "98765432100", ID_Restaurante: 2, Dia: "2025-03-28", Hora: "20:00", Status: "Pendente", Mesas: [34], Convidados: [{ ID: 3, Nome: "Carlos Almeida" }] },
    { _id: 3, CPF_C: "65432198700", ID_Restaurante: 1, Dia: "2025-04-01", Hora: "21:00", Status: "Cancelada", Mesas: [78], Convidados: [] },
    { _id: 4, CPF_C: "12345678900", ID_Restaurante: 2, Dia: "2025-04-02", Hora: "18:00", Status: "Confirmada", Mesas: [15, 23], Convidados: [{ ID: 4, Nome: "Ricardo Mendes" }, { ID: 5, Nome: "Sofia Martins" }] },
    { _id: 5, CPF_C: "98765432100", ID_Restaurante: 1, Dia: "2025-04-05", Hora: "19:45", Status: "Pendente", Mesas: [4], Convidados: [{ ID: 6, Nome: "Tatiane Oliveira" }] },
    { _id: 6, CPF_C: "32165498700", ID_Restaurante: 3, Dia: "2025-04-10", Hora: "20:30", Status: "Confirmada", Mesas: [27], Convidados: [{ ID: 7, Nome: "Luciana Costa" }, { ID: 8, Nome: "Felipe Rocha" }] },
    { _id: 7, CPF_C: "78912345600", ID_Restaurante: 4, Dia: "2025-04-12", Hora: "19:00", Status: "Confirmada", Mesas: [39, 45], Convidados: [] },
    { _id: 8, CPF_C: "45678912300", ID_Restaurante: 5, Dia: "2025-04-15", Hora: "21:15", Status: "Pendente", Mesas: [56], Convidados: [{ ID: 9, Nome: "Mariana Silva" }] },
    { _id: 9, CPF_C: "15975348620", ID_Restaurante: 6, Dia: "2025-04-18", Hora: "18:45", Status: "Cancelada", Mesas: [67], Convidados: [] },
    { _id: 10, CPF_C: "35715985246", ID_Restaurante: 7, Dia: "2025-04-20", Hora: "20:00", Status: "Confirmada", Mesas: [12, 34], Convidados: [{ ID: 10, Nome: "Roberto Nunes" }, { ID: 11, Nome: "Patrícia Alves" }] },
    { _id: 11, CPF_C: "25836914700", ID_Restaurante: 8, Dia: "2025-04-22", Hora: "19:30", Status: "Confirmada", Mesas: [13], Convidados: [{ ID: 12, Nome: "Gabriel Souza" }] },
    { _id: 12, CPF_C: "95175385246", ID_Restaurante: 9, Dia: "2025-04-25", Hora: "21:00", Status: "Pendente", Mesas: [29, 31], Convidados: [] },
    { _id: 13, CPF_C: "75395185246", ID_Restaurante: 10, Dia: "2025-04-28", Hora: "18:30", Status: "Confirmada", Mesas: [49], Convidados: [{ ID: 13, Nome: "Camila Fernandes" }, { ID: 14, Nome: "Lucas Oliveira" }] },
    { _id: 14, CPF_C: "85274196300", ID_Restaurante: 11, Dia: "2025-05-01", Hora: "20:15", Status: "Confirmada", Mesas: [58], Convidados: [] },
    { _id: 15, CPF_C: "96385274100", ID_Restaurante: 12, Dia: "2025-05-03", Hora: "19:00", Status: "Cancelada", Mesas: [62], Convidados: [{ ID: 15, Nome: "Isabela Costa" }] },
    { _id: 16, CPF_C: "74185296300", ID_Restaurante: 13, Dia: "2025-05-05", Hora: "20:45", Status: "Confirmada", Mesas: [71, 79], Convidados: [{ ID: 16, Nome: "Leonardo Mendes" }, { ID: 17, Nome: "Beatriz Lima" }] },
    { _id: 17, CPF_C: "36925814700", ID_Restaurante: 14, Dia: "2025-05-08", Hora: "18:00", Status: "Confirmada", Mesas: [82], Convidados: [] },
    { _id: 18, CPF_C: "14725836900", ID_Restaurante: 15, Dia: "2025-05-10", Hora: "21:30", Status: "Pendente", Mesas: [5, 11], Convidados: [{ ID: 18, Nome: "Vitor Barbosa" }] },
    { _id: 19, CPF_C: "25814736900", ID_Restaurante: 1, Dia: "2025-05-12", Hora: "19:45", Status: "Confirmada", Mesas: [16, 22], Convidados: [{ ID: 19, Nome: "Camila Martins" }, { ID: 20, Nome: "Gustavo Nascimento" }] },
    { _id: 20, CPF_C: "98765412300", ID_Restaurante: 2, Dia: "2025-05-15", Hora: "20:00", Status: "Confirmada", Mesas: [13, 18], Convidados: [] }
]);

db.Convidados.insertMany([
    { _id: 1, Nome: "João Pereira", CPF: "11122233344", Email: "joao@gmail.com", Telefone: "11987654321" },
    { _id: 2, Nome: "Fernanda Lima", CPF: "22233344455", Email: "fernanda@hotmail.com", Telefone: "21987654321" },
    { _id: 3, Nome: "Carlos Almeida", CPF: "33344455566", Email: "carlos@yahoo.com", Telefone: "31987654321" },
    { _id: 4, Nome: "Ricardo Mendes", CPF: "44455566677", Email: "ricardo@outlook.com", Telefone: "41987654321" },
    { _id: 5, Nome: "Sofia Martins", CPF: "55566677788", Email: "sofia@protonmail.com", Telefone: "11976543210" },
    { _id: 6, Nome: "Tatiane Oliveira", CPF: "66677788899", Email: "tatiane@icloud.com", Telefone: "21976543210" },
    { _id: 7, Nome: "Luciana Costa", CPF: "77788899900", Email: "luciana@zoho.com", Telefone: "31976543210" },
    { _id: 8, Nome: "Felipe Rocha", CPF: "88899900011", Email: "felipe@aol.com", Telefone: "41976543210" },
    { _id: 9, Nome: "Mariana Silva", CPF: "99900011122", Email: "mariana@yandex.com", Telefone: "11965432109" },
    { _id: 10, Nome: "Roberto Nunes", CPF: "00011122233", Email: "roberto@live.com", Telefone: "21965432109" },
    { _id: 11, Nome: "Patrícia Alves", CPF: "11122233344", Email: "patricia@gmx.com", Telefone: "31965432109" },
    { _id: 12, Nome: "Gabriel Souza", CPF: "22233344455", Email: "gabriel@inbox.com", Telefone: "41965432109" },
    { _id: 13, Nome: "Camila Fernandes", CPF: "33344455566", Email: "camila@hushmail.com", Telefone: "11954321098" },
    { _id: 14, Nome: "Lucas Oliveira", CPF: "44455566677", Email: "lucas@tutanota.com", Telefone: "21954321098" },
    { _id: 15, Nome: "Isabela Costa", CPF: "55566677788", Email: "isabela@mail.com", Telefone: "31954321098" },
    { _id: 16, Nome: "Leonardo Mendes", CPF: "66677788899", Email: "leonardo@mailinator.com", Telefone: "41954321098" },
    { _id: 17, Nome: "Beatriz Lima", CPF: "77788899900", Email: "beatriz@fastmail.com", Telefone: "11943210987" },
    { _id: 18, Nome: "Vitor Barbosa", CPF: "88899900011", Email: "vitor@yandex.com", Telefone: "21943210987" },
    { _id: 19, Nome: "Camila Martins", CPF: "99900011122", Email: "camila2@protonmail.com", Telefone: "31943210987" },
    { _id: 20, Nome: "Gustavo Nascimento", CPF: "00011122233", Email: "gustavo2@icloud.com", Telefone: "41943210987" }
]);
