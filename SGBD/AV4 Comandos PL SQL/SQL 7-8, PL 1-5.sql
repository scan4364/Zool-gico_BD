create or replace procedure nascidos_periodo (p_data_inferior date, p_data_superior date) is 
begin
	for animais in (
    select id, nome_popular
    from animal 
    where data_nascimento between p_data_inferior and p_data_superior
    ) loop
		dbms_output.put_line(animais.id || ' - ' || animais.nome_popular);
	end loop;
end; 
/

create or replace function retorna_supervisor (p_cpf funcionario.cpf%type) 
return funcionario%rowtype
is
    v_supervisor funcionario.cpf%type;
	v_retorno funcionario%rowtype;
begin 
    begin
    	select cpf_supervisor into v_supervisor from funcionario where cpf = p_cpf;
    exception
        when no_data_found then
            dbms_output.put_line('Nenhum supervisor encontrado para o CPF: ' || p_cpf);
            raise; 
    end;
    begin
        select * into v_retorno from funcionario where cpf = v_supervisor;
    exception
        when no_data_found then
            dbms_output.put_line('Nenhum funcionário encontrado com o CPF do supervisor: ' || v_supervisor);
            raise;
    end;
	return v_retorno;
end; 
/

declare
    v_data1 date := TO_DATE('2020-01-01', 'YYYY-MM-DD');
	v_data2 date := TO_DATE('2024-12-31', 'YYYY-MM-DD');
	v_funcionario funcionario%rowtype;
	v_cpf funcionario.cpf%type := 22233344455;
begin
    dbms_output.put_line('Animais nascidos entre ' || v_data1 ||' e ' || v_data2);
    nascidos_periodo(v_data1, v_data2); 
    dbms_output.put_line('Supervisor do funcionário ' || v_cpf || ':');
	v_funcionario := retorna_supervisor(v_cpf); 
	dbms_output.put_line(v_funcionario.cpf);
end;
/