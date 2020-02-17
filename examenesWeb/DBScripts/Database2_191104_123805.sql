-- Administrador [ent6]
create table "EXPEDIENTE"."ADMINISTRADOR" (
   "USER_OID"  number(19,0)  not null,
   "APELLIDOPATERNO"  varchar2(255 char),
   "APELLIDOMATERNO"  varchar2(255 char),
   "NOMBRE"  varchar2(255 char),
  primary key ("USER_OID")
);


-- Aspirante [ent7]
create table "EXPEDIENTE"."ASPIRANTE" (
   "USER_OID"  number(19,0)  not null,
   "APELLIDOPATERNO"  varchar2(255 char),
   "APELLIDOMATERNO"  varchar2(255 char),
   "NOMBRE"  varchar2(255 char),
  primary key ("USER_OID")
);


-- GEN FK: Administrador --> User
alter table "EXPEDIENTE"."ADMINISTRADOR"   add constraint FK_ADMINISTRADOR_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


-- GEN FK: Aspirante --> User
alter table "EXPEDIENTE"."ASPIRANTE"   add constraint FK_ASPIRANTE_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


