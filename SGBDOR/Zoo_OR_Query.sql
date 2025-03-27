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
