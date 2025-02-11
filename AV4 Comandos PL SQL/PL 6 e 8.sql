--verificar intervalos de manutenção dos habitats usando IF ELSIF e %type
DECLARE
    CURSOR habitat_cursor IS
        SELECT id, ultima_manutencao, intervalo_manutencao
        FROM Habitat;
    
    v_id Habitat.id%TYPE;
    v_ultima_manutencao Habitat.ultima_manutencao%TYPE;
    v_intervalo_manutencao Habitat.intervalo_manutencao%TYPE;
    v_dias_passados NUMBER;
BEGIN
    OPEN habitat_cursor;
    LOOP
        FETCH habitat_cursor INTO v_id, v_ultima_manutencao, v_intervalo_manutencao;
        EXIT WHEN habitat_cursor%NOTFOUND;
        
        v_dias_passados := SYSDATE - v_ultima_manutencao;
        IF v_dias_passados <= v_intervalo_manutencao THEN
            DBMS_OUTPUT.PUT_LINE('Habitat ' || v_id || ' está no intervalo de manutenção adequado.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Habitat ' || v_id || ' precisa de manutenção!!!');
        END IF;
    END LOOP;
    CLOSE habitat_cursor;
END;
/
