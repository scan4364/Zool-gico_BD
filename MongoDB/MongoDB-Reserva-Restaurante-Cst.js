/* 1. USE */
/* Define o banco de dados a ser utilizado na sessão. */
use ReservaRestaurantes;

/* 2. FIND */
/* Realiza consultas para recuperar documentos em uma coleção. */
db.Clientes.find();
db.Mesas.find({ Capacidade: { $gte: 4 } });
db.Reservas.find({ "Convidados.0": { $exists: true } });

/* 3. SIZE */
/* Filtra documentos com base no tamanho de arrays dentro deles. */
db.Reservas.find({ "Convidados": { $size: 2 } });
db.Reservas.find({ $expr: { $gt: [{ $size: "$Convidados" }, 1] } });
db.Reservas.find({ "Convidados": { $size: 1 } });
db.Reservas.find({ "Convidados": { $size: 0 } });

/* 4. AGGREGATE */
/* Executa operações complexas como agrupamento, projeção e cálculos em coleções. */
db.Restaurantes.aggregate([{ $group: { _id: null, total: { $sum: "$Capacidade_Lotacao" } } }]);
db.Reservas.aggregate([{ $project: { totalConvidados: { $size: "$Convidados" } } }, { $group: { _id: null, media: { $avg: "$totalConvidados" } } }]);
db.Cardapio.aggregate([{ $group: { _id: "$Restaurante_Id", totalPratos: { $sum: 1 } } }]);

/* 5. MATCH */
/* Filtra documentos dentro de uma agregação com base em critérios específicos. */
db.Reservas.aggregate([{ $match: { Status: "Confirmada", Dia: { $regex: /2025-04/ } } }]);
db.Cardapio.aggregate([{ $match: { status: "Disponível" } }]);
db.Mesas.aggregate([{ $match: { ID_Restaurante: 1 } }]);

/* 6. PROJECT */
/* Seleciona e exibe apenas campos específicos dos documentos. */
db.Clientes.aggregate([{ $project: { Nome: 1, Num_Tel: 1, _id: 0 } }]);
db.Reservas.aggregate([{ $project: { TotalMesas: { $size: "$Mesas" }, CPF_C: 1 } }]);

/* 7. GTE */
/* Filtra documentos onde um campo numérico é maior ou igual a um valor especificado. */
db.Mesas.find({ Capacidade: { $gte: 4 } });
db.Restaurantes.find({ Capacidade_Lotacao: { $gte: 100 } });
db.Restaurantes.find({ Capacidade_Lotacao: { $gte: 80, $lte: 120 } });

/* 8. GROUP */
/* Agrupa documentos com base em um campo e aplica operações como soma e contagem. */
db.Reservas.aggregate([{ $group: { _id: "$Status", total: { $sum: 1 } } }]);
db.Cardapio.aggregate([{ $group: { _id: "$status", total: { $sum: 1 } } }]);

/* 9. SUM */
/* Calcula a soma dos valores de um campo dentro de um agrupamento. */
db.Restaurantes.aggregate([{ $group: { _id: null, total: { $sum: "$Capacidade_Lotacao" } } }]);
db.Reservas.aggregate([{ $unwind: "$Mesas" }, { $group: { _id: null, total: { $sum: 1 } } }]);

/* 10. COUNTDOCUMENTS */
/* Conta a quantidade de documentos em uma coleção com ou sem filtro. */
db.Clientes.countDocuments();
db.Reservas.countDocuments({ Status: "Pendente" });

/* 11. MAX */
/* Obtém o valor máximo de um campo numérico dentro de uma agregação. */
db.Restaurantes.aggregate([{ $group: { _id: null, max: { $max: "$Capacidade_Lotacao" } } }]);
db.Reservas.aggregate([{ $group: { _id: null, ultimaData: { $max: "$Dia" } } }]);

/* 12. AVG */
/* Calcula a média dos valores de um campo numérico em uma coleção. */
db.Mesas.aggregate([{ $group: { _id: null, media: { $avg: "$Capacidade" } } }]);
db.Reservas.aggregate([{ $project: { total: { $size: "$Convidados" } } }, { $group: { _id: null, media: { $avg: "$total" } } }]);
db.Mesas.aggregate([{ $group: { _id: "$ID_Restaurante", mediaCapacidade: { $avg: "$Capacidade" } } }]);

/* 13. EXISTS */
/* Filtra documentos verificando a existência de um campo. */
db.Reservas.find({ "Convidados.0": { $exists: true } });
db.Clientes.find({ "Endereco.Complemento": { $exists: true } });

/* 14. SORT */
/* Ordena os resultados de uma consulta de forma crescente ou decrescente. */
db.Cardapio.find().sort({ Nome_Prato: 1 });
db.Restaurantes.find().sort({ Capacidade_Lotacao: -1 });
db.Restaurantes.find().sort({ Capacidade_Lotacao: -1 }).limit(5);

/* 15. LIMIT */
/*  Restringe o número de documentos retornados em uma consulta. */
db.Reservas.find().limit(5);
db.Cardapio.find({ status: "Disponível" }).limit(3);

/* 16. $WHERE */
/* Executa consultas usando expressões JavaScript personalizadas. */
db.Reservas.find({ $where: "this.Hora > '19:00'" });
db.Mesas.find({ $where: "this.Numero % 2 === 0" });
db.Reservas.find({ $where: "this.Hora < '19:00'" });

/* 17. MAPREDUCE */
/* Processa grandes volumes de dados em etapas de mapeamento e redução. */
db.Reservas.mapReduce(
  function () { emit(this.ID_Restaurante, 1); },
  function (key, values) { return Array.sum(values); },
  { out: "reservas_por_restaurante" }
);

/* 18. FUNCTION */
/* Define funções personalizadas para buscar ou manipular dados. */
const buscarReservas = (clienteId) => db.Reservas.find({ CPF_C: clienteId }).toArray();
const gerarRelatorio = () => ({
  clientes: db.Clientes.countDocuments(),
  reservas: db.Reservas.countDocuments(),
  restaurantes: db.Restaurantes.countDocuments()
});

/* 19. PRETTY */
/* Formata a exibição dos documentos de forma mais legível. */
db.Clientes.find().pretty();
db.Reservas.find().pretty();

/* 20. ALL */
/* Filtra documentos contendo arrays que possuem todos os valores especificados. */
db.Reservas.find({ Mesas: { $all: [23, 56] } });
db.Cardapio.find({ Ingredientes: { $all: ["Queijo", "Tomate"] } });

/* 21. SET */
/* Atualiza ou adiciona valores específicos em um documento. */
db.Clientes.updateOne({ CPF: "12345678900" }, { $set: { Num_Tel: "11999997777" } });
db.Restaurantes.updateMany({}, { $set: { Ativo: true } });
db.Reservas.updateMany({ Status: "Pendente" }, { $set: { Status: "Confirmada" } });

/* 22. TEXT e 23. SEARCH */
/* Text permite buscar documentos que contenham determinadas palavras após a criação de um indice de texto*/
/* Search permite buscas eficientes em índices criados previamente. */
db.Cardapio.createIndex({ Nome_Prato: "text" });
db.Cardapio.find({ $text: { $search: "Pizza" } });
db.Cardapio.find({ $text: { $search: "Salmão -grelhado" } });
db.Cardapio.find({ $text: { $search: "frango" } });

/* 24. FILTER */
/* Filtra elementos dentro de arrays de um documento durante uma agregação. */
db.Reservas.aggregate([{
  $project: {
    ConvidadosVIP: {
      $filter: {
        input: "$Convidados",
        as: "conv",
        cond: { $eq: ["$$conv.Nome", "João Pereira"] }
      }
    }
  }
}]);
db.Reservas.aggregate([
  {
    $project: {
      ReservaID: "$_id",
      ConvidadosEspeciais: {
        $filter: {
          input: "$Convidados",
          as: "conv",
          cond: { $in: ["$$conv.Nome", ["João Pereira", "Fernanda Lima"]] }
        }
      }
    }
  }
]);

/* 25. UPDATE */
/* Atualiza um ou mais documentos com novos valores. */
db.Reservas.updateOne({ _id: 5 }, { $set: { Status: "Cancelada" } });
db.Restaurantes.updateMany({ Capacidade_Lotacao: { $lt: 50 } }, { $set: { Pequeno: true } });

/* 26. SAVE */
/* Substitui um documento existente ou o insere se ele não existir. */
db.Clientes.replaceOne({ CPF: "11122233344" }, {
  CPF: "11122233344",
  Nome: "João Pereira Atualizado",
  Email: "joao.novo@email.com",
  Num_Tel: "11999998888",
  Endereco: {
    Numero: 30,
    Rua: "Av. Brasil",
    Cidade: "Rio de Janeiro",
    CEP: "22041001",
    Complemento: "Apto 301"
  }
}, { upsert: true });

/* 27. RENAMECOLLECTION */
/* Renomeia uma coleção dentro do banco de dados. */
db.Clientes.renameCollection("Cl13nt35");
db.Cl13nt35.find();
db.Cl13nt35.renameCollection("Clientes");
db.Clientes.find();

/* 28. COND */
/* Usa uma estrutura condicional para definir valores dentro de uma agregação. */
db.Restaurantes.aggregate([{
  $project: {
    Tamanho: {
      $cond: {
        if: { $gte: ["$Capacidade_Lotacao", 100] },
        then: "Grande",
        else: "Pequeno"
      }
    }
  }
}]);
db.Mesas.aggregate([
  {
    $project: {
      Numero: 1,
      Tipo: {
        $cond: {
          if: { $gte: ["$Capacidade", 6] },
          then: "Grande",
          else: {
            $cond: {
              if: { $gte: ["$Capacidade", 4] },
              then: "Média",
              else: "Pequena"
            }
          }
        }
      }
    }
  }
]);

/* 29. LOOKUP */
/* Realiza junções entre coleções para trazer dados relacionados. */
db.Reservas.aggregate([{
  $lookup: {
    from: "Restaurantes",
    localField: "ID_Restaurante",
    foreignField: "_id",
    as: "Restaurante"
  }
}]);
db.Reservas.aggregate([
  {
    $lookup: {
      from: "Restaurantes",
      localField: "ID_Restaurante",
      foreignField: "_id",
      as: "Restaurante"
    }
  },
  {
    $unwind: "$Restaurante"
  },
  {
    $project: {
      "Restaurante.Nome": 1,
      Dia: 1,
      Hora: 1,
      Status: 1
    }
  }
]);

/* 30. FINDONE */
/* Retorna apenas um documento que atenda ao critério especificado. */
db.Clientes.findOne({ CPF: "12345678900" });
db.Reservas.findOne({}, { sort: { Dia: -1 } });

/* 31. ADDTOSET */
/* Adiciona um valor a um array dentro de um documento, evitando duplicatas. */
db.Reservas.updateOne({ _id: 10 }, { $addToSet: { Mesas: 7 } });
db.Reservas.updateOne({ _id: 15 }, { $addToSet: { Convidados: { Nome: "Novo Convidado", ID: 21 } } });
db.Reservas.updateOne({ _id: 1 }, { $addToSet: { Mesas: { $each: [24, 25] } } });

/* 32. ELEMMATCH */
db.Reservas.find({
  Convidados: {
    $elemMatch: {
      Nome: { $regex: "João", $options: "i" }
    }
  }
});

/* 33. ARRAY OPERATIONS */
db.Reservas.aggregate([
  { $unwind: "$Convidados" },
  { $group: { _id: "$Convidados.Nome", total: { $sum: 1 } } },
  { $sort: { total: -1 } }
]);

/* 34. DATE OPERATIONS */
db.Reservas.find({
  Dia: { $regex: /^2025-04/ }
});

/* 35. TRANSACTIONS */
const session = db.getMongo().startSession();
session.startTransaction();
try {
  const reserva = db.Reservas.findOne({ _id: 1 });
  db.Reservas.updateOne({ _id: 1 }, { $set: { Status: "Confirmada" } });
  session.commitTransaction();
} catch (error) {
  session.abortTransaction();
  throw error;
} finally {
  session.endSession();
}
