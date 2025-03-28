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

SELECT a.nome_proprio,
       t.nome AS nome_popular,
       t.regiao
FROM animal a,
     TABLE(a.nomes_populares) t
WHERE a.nome_cientifico = 'Panthera leo';
/

SELECT f.nome,
       t.ddd || '-' || t.numero AS telefone
FROM tratadores f,
     TABLE(f.telefones) t;
/

SELECT v.nome,
       t.ddd || '-' || t.numero AS telefone
FROM veterinarios v,
     TABLE(v.telefones) t;

SELECT t.exibir_dados() AS dados
FROM tratadores t;
/

SELECT v.exibir_dados() AS dados
FROM veterinarios v;
/

DECLARE
    a tp_alimentacao;
BEGIN
    SELECT VALUE(a) INTO a
    FROM alimentacao a
    WHERE id_animal = 1 AND horario_refeicao = '10:00';

    a.obter_ultima_refeicao;
END;
/

SELECT a.id_animal, MAX(a.horario_refeicao) AS ultima_refeicao
FROM alimentacao a
GROUP BY a.id_animal
HAVING MAX(a.horario_refeicao) > '15:00';
/

SELECT a.nome_proprio AS filho,
       DEREF(a.mae).nome_proprio AS mae,
       DEREF(a.habitat).id AS habitat_id
FROM animal a
WHERE a.mae IS NOT NULL
  AND DEREF(a.habitat).id = DEREF(a.mae).habitat.id;
/

SELECT a.id_animal,
       COUNT(*) AS total_refeicoes
FROM alimentacao a
GROUP BY a.id_animal
HAVING COUNT(*) > 2;
/

SELECT v.nome AS supervisor
FROM veterinarios v
WHERE EXISTS (
    SELECT 1
    FROM veterinarios v2
    WHERE v2.supervisor = REF(v)
);
/

-- Análise de distribuição de funcionários por tipo e experiência
SELECT 
    'Veterinários' AS tipo_funcionario,
    COUNT(*) AS quantidade,
    ROUND(AVG(idade)) AS idade_media,
    MIN(idade) AS idade_minima,
    MAX(idade) AS idade_maxima
FROM 
    veterinarios
UNION ALL
SELECT 
    'Tratadores' AS tipo_funcionario,
    COUNT(*) AS quantidade,
    ROUND(AVG(idade)) AS idade_media,
    MIN(idade) AS idade_minima,
    MAX(idade) AS idade_maxima
FROM 
    tratadores;
/
-- Análise de contratos por período e tipo de funcionário
SELECT 
    EXTRACT(YEAR FROM dc.data_contrato) AS ano_contratacao,
    EXTRACT(MONTH FROM dc.data_contrato) AS mes_contratacao,
    COUNT(CASE WHEN EXISTS (SELECT 1 FROM veterinarios v WHERE v.num_carteira_trabalho = dc.num_carteira) THEN 1 END) AS veterinarios_contratados,
    COUNT(CASE WHEN EXISTS (SELECT 1 FROM tratadores t WHERE t.num_carteira_trabalho = dc.num_carteira) THEN 1 END) AS tratadores_contratados,
    COUNT(*) AS total_contratacoes
FROM 
    data_contrato dc
GROUP BY 
    EXTRACT(YEAR FROM dc.data_contrato),
    EXTRACT(MONTH FROM dc.data_contrato)
ORDER BY 
    ano_contratacao DESC, 
    mes_contratacao DESC;
/
-- Histórico médico completo dos animais
SELECT 
    a.nome_proprio AS nome_animal,
    a.nome_cientifico,
    c.data_hora,
    v.nome || ' ' || v.sobrenome AS veterinario,
    c.observacoes AS diagnostico,
    t.nome AS medicamento,
    t.dosagem
FROM 
    consulta c
JOIN 
    animal a ON c.id_animal = a.id
JOIN 
    veterinarios v ON c.cpf_veterinario = v.cpf
LEFT JOIN 
    tratamento t ON c.id_animal = t.id_animal 
                AND c.cpf_veterinario = t.cpf_veterinario 
                AND c.data_hora = t.data_hora
ORDER BY 
    a.nome_proprio, 
    c.data_hora DESC;
/

-- Análise de manutenções por habitat com tratamento de valores negativos
SELECT 
    h.id AS id_habitat,
    h.tamanho,
    m.tipo AS tipo_manutencao,
    COUNT(mt.cpf_tratador) AS numero_tratadores,
    LISTAGG(t.nome || ' ' || t.sobrenome, ', ') 
        WITHIN GROUP (ORDER BY t.nome) AS tratadores_responsaveis,
    h.data_ultima_manutencao,
    CASE 
        WHEN ROUND(SYSDATE - h.data_ultima_manutencao) < 0 THEN NULL
        ELSE ROUND(SYSDATE - h.data_ultima_manutencao)
    END AS dias_desde_ultima_manutencao,
    CASE 
        WHEN ROUND(h.intervalo_manutencao - (SYSDATE - h.data_ultima_manutencao)) < 0 THEN NULL
        ELSE ROUND(h.intervalo_manutencao - (SYSDATE - h.data_ultima_manutencao))
    END AS dias_ate_proxima_manutencao
FROM 
    habitat h
JOIN 
    manutencao m ON h.id = m.id_habitat
LEFT JOIN 
    manutencao_tratadores mt ON h.id = mt.id_habitat
LEFT JOIN 
    tratadores t ON mt.cpf_tratador = t.cpf
GROUP BY 
    h.id, h.tamanho, m.tipo, h.data_ultima_manutencao, h.intervalo_manutencao
ORDER BY 
    CASE 
        WHEN ROUND(h.intervalo_manutencao - (SYSDATE - h.data_ultima_manutencao)) < 0 THEN 999999
        ELSE ROUND(h.intervalo_manutencao - (SYSDATE - h.data_ultima_manutencao))
    END;
/

-- Distribuição de carga de trabalho entre tratadores
SELECT 
    t.nome || ' ' || t.sobrenome AS tratador,
    t.cpf,
    COUNT(DISTINCT mt.id_habitat) AS num_habitats_responsavel,
    LISTAGG(h.id || ' (' || m.tipo || ')', ', ') 
        WITHIN GROUP (ORDER BY h.id) AS habitats_responsavel,
    SUM(h.tamanho) AS area_total_manutencao,
    MAX(h.data_ultima_manutencao) AS ultima_manutencao_realizada
FROM 
    tratadores t
LEFT JOIN 
    manutencao_tratadores mt ON t.cpf = mt.cpf_tratador
LEFT JOIN 
    habitat h ON mt.id_habitat = h.id
LEFT JOIN 
    manutencao m ON h.id = m.id_habitat
GROUP BY 
    t.nome, t.sobrenome, t.cpf
ORDER BY 
    num_habitats_responsavel DESC, area_total_manutencao DESC;
/

-- Saúde dos animais por habitat
SELECT 
    h.id AS id_habitat,
    h.tamanho,
    COUNT(DISTINCT a.id) AS total_animais,
    ROUND(COUNT(DISTINCT a.id) / h.qtd_animais * 100, 2) AS percentual_ocupacao,
    COUNT(DISTINCT c.data_hora) AS total_consultas,
    COUNT(DISTINCT c.data_hora) / COUNT(DISTINCT a.id) AS media_consultas_por_animal,
    COUNT(DISTINCT t.data_hora) AS total_tratamentos,
    LISTAGG(DISTINCT a.nome_proprio, ', ') WITHIN GROUP (ORDER BY a.nome_proprio) AS animais_residentes
FROM 
    habitat h
LEFT JOIN 
    animal a ON DEREF(a.habitat).id = h.id
LEFT JOIN 
    consulta c ON a.id = c.id_animal
LEFT JOIN 
    tratamento t ON c.id_animal = t.id_animal AND c.data_hora = t.data_hora
GROUP BY 
    h.id, h.tamanho, h.qtd_animais
ORDER BY 
    id_habitat;
/

-- Perfil demográfico completo de todos os visitantes
SELECT 
    CASE 
        WHEN MONTHS_BETWEEN(SYSDATE, v.data_nascimento)/12 < 12 THEN 'Criança (0-11)'
        WHEN MONTHS_BETWEEN(SYSDATE, v.data_nascimento)/12 < 18 THEN 'Adolescente (12-17)'
        WHEN MONTHS_BETWEEN(SYSDATE, v.data_nascimento)/12 < 60 THEN 'Adulto (18-59)'
        ELSE 'Idoso (60+)'
    END AS faixa_etaria,
    COUNT(v.cpf) AS total_visitantes,
    ROUND(COUNT(v.cpf) * 100.0 / (SELECT COUNT(*) FROM visitante), 2) AS percentual,
    ROUND(AVG(NVL(p.desconto, 0))) AS desconto_medio_obtido,
    COUNT(DISTINCT e.data_visita) AS dias_com_visitas
FROM 
    visitante v
LEFT JOIN 
    compra c ON v.cpf = c.cpf_visitante
LEFT JOIN 
    entrada e ON c.numero_entrada = e.numero_entrada AND c.data_visita = e.data_visita
LEFT JOIN 
    promocao p ON c.id_promocao = p.id
GROUP BY 
    CASE 
        WHEN MONTHS_BETWEEN(SYSDATE, v.data_nascimento)/12 < 12 THEN 'Criança (0-11)'
        WHEN MONTHS_BETWEEN(SYSDATE, v.data_nascimento)/12 < 18 THEN 'Adolescente (12-17)'
        WHEN MONTHS_BETWEEN(SYSDATE, v.data_nascimento)/12 < 60 THEN 'Adulto (18-59)'
        ELSE 'Idoso (60+)'
    END
ORDER BY 
    total_visitantes DESC;