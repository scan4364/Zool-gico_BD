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
/
SELECT nome, cpf, TO_CHAR(data_nascimento, 'YYYY-MM-DD') AS data_nascimento
FROM visitante
WHERE data_nascimento < TO_DATE('2000-01-01', 'YYYY-MM-DD')
ORDER BY nome;
/
SELECT 
    data_visita,
    numero_entrada,
    tipo_entrada,
    hora_entrada
FROM entrada
WHERE data_visita = TO_DATE('2024-03-01', 'YYYY-MM-DD')
  AND hora_entrada > '09:00';
/
SELECT 
    id,
    requisito,
    TO_CHAR(data_de_inicio, 'YYYY-MM-DD') AS data_de_inicio,
    TO_CHAR(data_de_termino, 'YYYY-MM-DD') AS data_de_termino,
    desconto
FROM promocao
WHERE requisito = 'estudantes'
/
SELECT 
    c.cpf_visitante,
    c.numero_entrada,
    TO_CHAR(c.data_visita, 'YYYY-MM-DD') AS data_visita,
    c.id_promocao
FROM compra c
WHERE c.cpf_visitante LIKE '123%';
/
SELECT 
    cpf,
    nome,
    sobrenome,
    num_carteira_trabalho,
    email
FROM veterinarios
WHERE LOWER(email) LIKE '%veterinaria%';
/
SELECT 
    t.cpf,
    t.nome,
    t.sobrenome,
    t.num_carteira_trabalho,
    t.email
FROM tratadores t
WHERE t.supervisor IS NOT NULL
  AND DEREF(t.supervisor).cpf = '22233344455';
/
SELECT 
    id,
    tamanho,
    TO_CHAR(data_ultima_manutencao, 'YYYY-MM-DD') AS data_ultima_manutencao,
    intervalo_manutencao,
    qtd_animais
FROM habitat
WHERE tamanho > 1000
  AND data_ultima_manutencao < ADD_MONTHS(SYSDATE, -12);
/
SELECT 
    a.id,
    a.nome_proprio,
    a.nome_cientifico
FROM animal a,
     TABLE(a.nomes_populares) np
WHERE LOWER(np.nome) LIKE '%leão%';
/
SELECT 
    nome,
    dosagem
FROM medicamento
WHERE dosagem = '500mg';
/
SELECT 
    c.id_animal,
    c.cpf_veterinario,
    TO_CHAR(c.data_hora, 'YYYY-MM-DD HH24:MI:SS') AS data_hora,
    c.observacoes
FROM consulta c
WHERE c.id_animal = (
    SELECT id 
    FROM animal 
    WHERE nome_proprio = 'Simba'
);
/
SELECT 
    id_animal,
    cpf_veterinario,
    nome,
    dosagem,
    TO_CHAR(data_hora, 'YYYY-MM-DD HH24:MI:SS') AS data_hora
FROM tratamento
WHERE cpf_veterinario = '44455566677';
/
SELECT 
    id_habitat,
    tipo
FROM manutencao
WHERE LOWER(tipo) LIKE '%mata atlântica%';
/
SELECT 
    id_habitat,
    cpf_tratador
FROM manutencao_tratadores
WHERE id_habitat = 1;
/
SELECT 
    num_carteira,
    TO_CHAR(data_contrato, 'YYYY-MM-DD') AS data_contrato
FROM data_contrato
WHERE num_carteira LIKE '%567%';
/
SELECT 
    id_animal,
    descricao,
    horario_refeicao,
    observacoes,
    quantidade
FROM alimentacao
WHERE horario_refeicao = '11:00';
/