--------------------------------------------------------------------------------
-- Criação de Objetos
--------------------------------------------------------------------------------

create or replace type tp_email as object (
   email varchar2(100)
);

create or replace type varray_email as
   varray(50) of tp_email;

create or replace type tp_visitante as object (
      nome           varchar2(40),
      cpf            varchar2(11),
      data_de_visita date,
      email          varray_email
) final;

create or replace type tp_promocao as object (
      id              varchar2(12),
      requisito       varchar2(50),
      data_de_inicio  date,
      data_de_termino date,
      desconto        number
);

create or replace type tp_entrada as object (
      data           date,
      numero_entrada varchar2(15),
      tipo_entrada   number,
      hora_entrada   varchar2(50)
);

create or replace type tp_compra as object (
      cpf_visitante varchar2(11),
      num_entrada   varchar2(15),
      id_promocao   varchar2(12)
);

create or replace type tp_funcionario as object (
      oid           ref tp_funcionario,
      cpf           varchar2(11),
      nome          varchar2(100),
      sobrenome     varchar2(100),
      data_contrato date,
      idade         number,
      telefone      varchar2(15),
      email         varchar2(150),
      constructor function tp_funcionario (
           cpf           varchar2,
           nome          varchar2,
           sobrenome     varchar2,
           data_contrato date,
           idade         number,
           telefone      varchar2,
           email         varchar2
        ) return self as result
) not final;

create or replace type tp_tratador under tp_funcionario ( );

create or replace type tp_veterinario under tp_funcionario ( );

create type tp_habitat as object (
    id INTEGER,
    tamanho DECIMAL(10,2),
    ultima_manutencao DATE,
    intervalo_manutencao INTEGER,
    qtd_animais INTEGER
) final;

create or replace type tp_animais as object (
    id INTEGER,
    nome_cientifico VARCHAR2(255),
    nome_popular VARCHAR2(100),
    genero VARCHAR2(50),
    nome_proprio VARCHAR2(100),
    habitat ref tp_habitat,
    id_mae ref tp_animais,
    data_nascimento DATE
) final;

create or replace type tp_alimentacao as object (
    id_animal ref tp_animais,
    horario_refeicao VARCHAR2(5),
    observacoes VARCHAR2(255),
    quantidade DECIMAL(10, 2),
    descricao VARCHAR2(255)
) final;


--------------------------------------------------------------------------------
-- Criação de Tabelas
--------------------------------------------------------------------------------

create table visitante of tp_visitante;
alter table visitante add constraint pk_visitante primary key ( cpf );

create table entrada of tp_entrada;
alter table entrada add constraint pk_entrada primary key ( numero_entrada );

create table promocao of tp_promocao;
alter table promocao add constraint pk_promocao primary key ( id );

create table compra (
   cpf_visitante ref tp_visitante
      scope is visitantes,
   num_entrada   ref tp_entrada
      scope is entrada,
   id_promocao   ref tp_promocao
      scope is promocao
);

create table funcionario of tp_funcionario (
   cpf primary key,
   oid
      with rowid
      references tp_funcionario
) object identifier is system generated;


-- Tabela para armazenar objetos do tipo tp_tratador
create table tratadores of tp_tratador (
   cpf primary key
);

-- Tabela para armazenar objetos do tipo tp_veterinario
create table veterinarios of tp_veterinario (
   cpf primary key
);

-- Tabela para armazenar objetos do tipo tp_habitat
    
create table habitat of tp_habitat (
    id PRIMARY KEY
);

-- Tabela para armazenar objetos do tipo tp_animais

create table animais of tp_animais (
    id primary key
)

-- Tabela para armazenar objetos do tipo tp_alimentacao

create table alimentacao of tp_alimentacao (
    primary key (id_animal, horario_refeicao)
)
