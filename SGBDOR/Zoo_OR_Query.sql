--------------------------------------------------------------------------------
--------------------------------- Consultas
--------------------------------------------------------------------------------

SELECT v.nome, v.cpf, t.ddd, t.numero  FROM veterinarios v, TABLE(v.telefones) t
WHERE DEREF(v.supervisor).nome LIKE 'João'
/
SELECT tr.nome, tr.cpf, t.ddd, t.numero  FROM tratadores tr, TABLE(tr.telefones) t
WHERE DEREF(tr.supervisor).nome LIKE 'Maria'
/
SELECT a.nome_cientifico, a.nome_proprio, DEREF(a.habitat) FROM animal a
WHERE DEREF(a.habitat).id=1
/
SELECT a.nome_cientifico, a.nome_proprio, DEREF(a.habitat) FROM animal a
WHERE DEREF(a.habitat).id=2
/
SELECT REF(p)
FROM promocao p
WHERE TO_DATE('2025-03-27', 'YYYY-MM-DD') BETWEEN p.data_de_inicio AND p.data_de_termino;
/
SELECT v.cpf, DEREF(REF(v)).nome AS nome_visitante
FROM visitante v
WHERE v.data_nascimento < TO_DATE('1996-01-01', 'YYYY-MM-DD');
/
SELECT REF(e)
FROM entrada e
WHERE e.data_visita = TO_DATE('2024-03-01', 'YYYY-MM-DD');

