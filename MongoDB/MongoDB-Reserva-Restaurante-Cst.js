/* 1. USE */
use ReservaRestaurantes;

/* 2. FIND */
db.Clientes.find();
db.Mesas.find({ Capacidade: { $gte: 4 } });
db.Reservas.find({ "Convidados.0": { $exists: true } });

/* 3. SIZE */
db.Reservas.find({ "Convidados": { $size: 2 } });
db.Reservas.find({ $expr: { $gt: [{ $size: "$Convidados" }, 1] } });
db.Reservas.find({ "Convidados": { $size: 1 } });
db.Reservas.find({ "Convidados": { $size: 0 } });

/* 4. AGGREGATE */
db.Restaurantes.aggregate([{ $group: { _id: null, total: { $sum: "$Capacidade_Lotacao" } } }]);
db.Reservas.aggregate([{ $project: { totalConvidados: { $size: "$Convidados" } } }, { $group: { _id: null, media: { $avg: "$totalConvidados" } } }]);
db.Cardapio.aggregate([{ $group: { _id: "$Restaurante_Id", totalPratos: { $sum: 1 } } }]);

/* 5. MATCH */
db.Reservas.aggregate([{ $match: { Status: "Confirmada", Dia: { $regex: /2025-04/ } } }]);
db.Cardapio.aggregate([{ $match: { status: "Disponível" } }]);
db.Mesas.aggregate([{ $match: { ID_Restaurante: 1 } }]);

/* 6. PROJECT */
db.Clientes.aggregate([{ $project: { Nome: 1, Num_Tel: 1, _id: 0 } }]);
db.Reservas.aggregate([{ $project: { TotalMesas: { $size: "$Mesas" }, CPF_C: 1 } }]);

/* 7. GTE */
db.Mesas.find({ Capacidade: { $gte: 4 } });
db.Restaurantes.find({ Capacidade_Lotacao: { $gte: 100 } });
db.Restaurantes.find({ Capacidade_Lotacao: { $gte: 80, $lte: 120 } });

/* 8. GROUP */
db.Reservas.aggregate([{ $group: { _id: "$Status", total: { $sum: 1 } } }]);
db.Cardapio.aggregate([{ $group: { _id: "$status", total: { $sum: 1 } } }]);

/* 9. SUM */
db.Restaurantes.aggregate([{ $group: { _id: null, total: { $sum: "$Capacidade_Lotacao" } } }]);
db.Reservas.aggregate([{ $unwind: "$Mesas" }, { $group: { _id: null, total: { $sum: 1 } } }]);

/* 10. COUNTDOCUMENTS */
db.Clientes.countDocuments();
db.Reservas.countDocuments({ Status: "Pendente" });

/* 11. MAX */
db.Restaurantes.aggregate([{ $group: { _id: null, max: { $max: "$Capacidade_Lotacao" } } }]);
db.Reservas.aggregate([{ $group: { _id: null, ultimaData: { $max: "$Dia" } } }]);

/* 12. AVG */
db.Mesas.aggregate([{ $group: { _id: null, media: { $avg: "$Capacidade" } } }]);
db.Reservas.aggregate([{ $project: { total: { $size: "$Convidados" } }}, { $group: { _id: null, media: { $avg: "$total" } } }]);
db.Mesas.aggregate([{ $group: { _id: "$ID_Restaurante", mediaCapacidade: { $avg: "$Capacidade" } } }]);

/* 13. EXISTS */
db.Reservas.find({ "Convidados.0": { $exists: true } });
db.Clientes.find({ "Endereco.Complemento": { $exists: true } });

/* 14. SORT */
db.Cardapio.find().sort({ Nome_Prato: 1 });
db.Restaurantes.find().sort({ Capacidade_Lotacao: -1 });
db.Restaurantes.find().sort({ Capacidade_Lotacao: -1 }).limit(5);

/* 15. LIMIT */
db.Reservas.find().limit(5);
db.Cardapio.find({ status: "Disponível" }).limit(3);

/* 16. $WHERE */
db.Reservas.find({ $where: "this.Hora > '19:00'" });
db.Mesas.find({ $where: "this.Numero % 2 === 0" });
db.Reservas.find({ $where: "this.Hora < '19:00'" });

/* 17. MAPREDUCE */
db.Reservas.mapReduce(
  function () { emit(this.ID_Restaurante, 1); },
  function (key, values) { return Array.sum(values); },
  { out: "reservas_por_restaurante" }
);

/* 18. FUNCTION */
const buscarReservas = (clienteId) => db.Reservas.find({ CPF_C: clienteId }).toArray();
const gerarRelatorio = () => ({
  clientes: db.Clientes.countDocuments(),
  reservas: db.Reservas.countDocuments(),
  restaurantes: db.Restaurantes.countDocuments()
});

/* 19. PRETTY */
db.Clientes.find().pretty();
db.Reservas.find().pretty();

/* 20. ALL */
db.Reservas.find({ Mesas: { $all: [23, 56] } });
db.Cardapio.find({ Ingredientes: { $all: ["Queijo", "Tomate"] } });

/* 21. SET */
db.Clientes.updateOne({ CPF: "12345678900" }, { $set: { Num_Tel: "11999997777" } });
db.Restaurantes.updateMany({}, { $set: { Ativo: true } });
db.Reservas.updateMany({ Status: "Pendente" }, { $set: { Status: "Confirmada" } });

/* 22. TEXT */
db.Cardapio.createIndex({ Nome_Prato: "text" });
db.Cardapio.find({ $text: { $search: "Pizza" } });
db.Cardapio.find({ $text: { $search: "Salmão -grelhado" } });
db.Cardapio.find({ $text: { $search: "frango" } });

/* 24. FILTER */
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
db.Reservas.updateOne({ _id: 5 }, { $set: { Status: "Cancelada" } });
db.Restaurantes.updateMany({ Capacidade_Lotacao: { $lt: 50 } }, { $set: { Pequeno: true } });

/* 26. SAVE */
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

/* 28. COND */
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
db.Clientes.findOne({ CPF: "12345678900" });
db.Reservas.findOne({}, { sort: { Dia: -1 } });

/* 31. ADDTOSET */
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

/* 35. INDEX OPERATIONS */
db.Reservas.createIndex({ ID_Restaurante: 1, Dia: 1 });

/* 36. TRANSACTIONS */
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
