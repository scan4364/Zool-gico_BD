
--------------------------------------------------------------------------------
--CASE WHEN
--------------------------------------------------------------------------------
-- de acordo com a entrada, saber se foi um visitante solitario ou visitantes em famila/grupo
DECLARE
    v_tipo_entrada VARCHAR2(20);
    v_descricao VARCHAR2(50);
BEGIN
    SELECT tipo_entrada INTO v_tipo_entrada
    FROM Entrada
    WHERE numero_entrada = 1;

    CASE v_tipo_entrada
        WHEN 'Individual' THEN
            v_descricao := 'Um visitante solitário chegou ao zoológico.';
        WHEN 'Família' THEN
            v_descricao := 'Um/a grupo/família animado/a entrou no zoológico!';
        ELSE
            v_descricao := 'Tipo de entrada desconhecido.';
    END CASE;

    DBMS_OUTPUT.PUT_LINE(v_descricao);
END;
/

--------------------------------------------------------------------------------
--LOOP EXIT WHEN
-------------------------------------------------------------------------------------
--Você está verificando todos os animais no zoológico até encontrar um animal do gênero "Feminino"
DECLARE
    v_id_animal INTEGER;
    v_genero VARCHAR2(50);
    CURSOR c_animais IS
        SELECT id, genero FROM Animal ORDER BY id;
BEGIN
    OPEN c_animais;
    LOOP
        FETCH c_animais INTO v_id_animal, v_genero;
        EXIT WHEN c_animais%NOTFOUND OR v_genero = 'Feminino';
        DBMS_OUTPUT.PUT_LINE('ID do Animal: ' || v_id_animal || ', Gênero: ' || v_genero);
    END LOOP;
    CLOSE c_animais;
END;
/


--------------------------------------------------------------------------------
--WHILE LOOP
-------------------------------------------------------------------------------------
--calcula o total de animais em todos os habitats
DECLARE
    v_total_animais INTEGER := 0; 
    v_qtd_animais INTEGER;        
    v_id_habitat INTEGER := 1;    
    v_max_id_habitat INTEGER;     
BEGIN
    
    SELECT MAX(id) INTO v_max_id_habitat FROM Habitat;

    
    WHILE v_id_habitat <= v_max_id_habitat LOOP
        
        BEGIN
            SELECT qtd_animais INTO v_qtd_animais
            FROM Habitat
            WHERE id = v_id_habitat;

            
            v_total_animais := v_total_animais + v_qtd_animais;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                
                NULL;
        END;

        
        v_id_habitat := v_id_habitat + 1;
    END LOOP;

    
    DBMS_OUTPUT.PUT_LINE('Total de Animais em Todos os Habitats: ' || v_total_animais);
END;
/

----------------------------------------------------------------------------------------
--FOR IN LOOP
----------------------------------------------------------------------------------------
--listar todos os funcionários e seus telefones para criar um diretório
BEGIN
    FOR rec IN (SELECT f.nome, f.sobrenome, t.ddd, t.numero
                FROM Funcionario f
                JOIN Telefone t ON f.cpf = t.cpf_funcionario)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Funcionário: ' || rec.nome || ' ' || rec.sobrenome ||
                             ', Telefone: (' || rec.ddd || ') ' || rec.numero);
    END LOOP;
END;
/

----------------------------------------------------------------------------------------
--SELECT ... INTO
---------------------------------------------------------------------------------------
-- buscar o nome completo de um visitante específico para personalizar uma mensagem de boas-vindas
DECLARE
    v_nome VARCHAR2(20);
    v_sobrenome VARCHAR2(20);
BEGIN
    SELECT nome, sobrenome INTO v_nome, v_sobrenome
    FROM Visitante
    WHERE cpf = 12345678901;

    DBMS_OUTPUT.PUT_LINE('Bem-vindo, ' || v_nome || ' ' || v_sobrenome || '!');
END;
/


----------------------------------------------------------------------------------------
--CURSOR
-----------------------------------------------------------------------------------------
-- verificar os animais que estão em idade reprodutiva, nesse caso de 2 a 10 anos
DECLARE
    v_id_animal INTEGER;
    v_nome_proprio VARCHAR2(100);
    v_data_nascimento DATE;
    v_idade_animal INTEGER;
    CURSOR c_animais IS
        SELECT id, nome_proprio, data_nascimento
        FROM Animal;
BEGIN
    OPEN c_animais;
    LOOP
        FETCH c_animais INTO v_id_animal, v_nome_proprio, v_data_nascimento;
        EXIT WHEN c_animais%NOTFOUND;

        -- Calcula a idade do animal em anos
        v_idade_animal := TRUNC(MONTHS_BETWEEN(SYSDATE, v_data_nascimento) / 12);

        -- Verifica se o animal está na idade reprodutiva
        -- Aqui tu escolhe quais as idades que voce quer
        IF v_idade_animal BETWEEN 2 AND 10 THEN
            DBMS_OUTPUT.PUT_LINE('Animal ID: ' || v_id_animal || 
                                 ', Nome: ' || v_nome_proprio || 
                                 ', Idade: ' || v_idade_animal || 
                                 ' anos - EM IDADE REPRODUTIVA');
        END IF;
    END LOOP;
    CLOSE c_animais;
END;
/
