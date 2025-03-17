--------------------------------------------------------------------------------
-- Inserindo dados na tabela Visitante
--------------------------------------------------------------------------------

insert into visitante values ( tp_visitante(
   'João',
   '12345678901',
   to_date('2013-05-10',
             'YYYY-MM-DD'),
   varray_email(tp_email('joao@email.com'))
) );

insert into visitante values ( tp_visitante(
   'Timoteo',
   '38517646589',
   to_date('1995-12-27',
             'YYYY-MM-DD'),
   varray_email(tp_email('timoteo@email.com'))
) );

insert into visitante (
   cpf,
   nome,
   data_de_visita,
   email
) values ( '98765432101',
           'Maria',
           to_date('1995-08-25','YYYY-MM-DD'),
           varray_email(tp_email('maria@email.com')) );

--------------------------------------------------------------------------------
-- Inserindo dados na tabela promoção
--------------------------------------------------------------------------------

create sequence promocao_seq start with 1 increment by 1

insert into promocao values ( tp_promocao(
   promocao_seq.nextval,
   'estudantes',
   to_date('2024-07-01',
            'yyyy-mm-dd'),
   to_date('2024-07-15',
            'yyyy-mm-dd'),
   20.00
) );

insert into promocao values ( tp_promocao(
   promocao_seq.nextval,
   'Nenhum requisito',
   to_date('2024-01-01',
            'YYYY-MM-DD'),
   to_date('2030-01-01',
            'YYYY-MM-DD'),
   0.00
) );

insert into promocao values ( tp_promocao(
   promocao_seq.nextval,
   'Idade < 12',
   to_date('2024-03-01',
            'YYYY-MM-DD'),
   to_date('2024-03-31',
            'YYYY-MM-DD'),
   50.00
) );

--------------------------------------------------------------------------------
-- Inserindo dados na tabela entrada
--------------------------------------------------------------------------------

insert into entrada (
   data,
   numero_entrada,
   tipo_entrada,
   hora_entrada
) values ( to_date('2024-03-01','YYYY-MM-DD'),
           '1',
           1,
           '10:00:00' );


--------------------------------------------------------------------------------
-- Inserindo dados na funcionario
--------------------------------------------------------------------------------

-- Inserir joao (sem supervisor)
insert into funcionarios values ( tp_funcionario(
   null, -- NULL significa que não tem supervisor
   '11122233344',
   'João',
   'Ferreira',
   to_date('1993-06-15',
               'YYYY-MM-DD'),
   30,
   '(11) 99999-1111',
   'joao.funcionario@zoo.com'
) );

-- Inserir ana (supervisionado por joao)
insert into funcionarios values ( tp_funcionario(
   (
      select ref(f)
        from funcionarios f
       where f.cpf = '11122233344'
   ), -- Referência ao oid de Ana
   '22233344455',
   'Maria',
   'Almeida',
   to_date('1983-09-20',
               'YYYY-MM-DD'),
   40,
   '(11) 98765-4321',
   'maria.supervisor@zoo.com'
) );