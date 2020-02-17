-- examenes [ent6]
create table "EXPEDIENTE"."EXAMENES" (
   "OID"  number(10,0)  not null,
   "FECHACREACION"  timestamp,
   "NOMBRE"  varchar2(255 char),
  primary key ("OID")
);


-- aspirante [ent7]
create table "EXPEDIENTE"."ASPIRANTE" (
   "USER_OID"  number(19,0)  not null,
   "OID"  number(10,0)  not null,
   "APELLIDOPATERNO"  varchar2(255 char),
   "APELLIDOMATERNO"  varchar2(255 char),
   "NOMBRE"  varchar2(255 char),
  primary key ("USER_OID")
);


-- administrador [ent8]
create table "EXPEDIENTE"."ADMINISTRADOR" (
   "USER_OID"  number(19,0)  not null,
   "OID"  number(10,0)  not null,
   "APELLIDOPATERNO"  varchar2(255 char),
   "APELLIDOMATERNO"  varchar2(255 char),
   "NOMBRE"  varchar2(255 char),
  primary key ("USER_OID")
);


-- administrador_examenes [rel7]
alter table "EXPEDIENTE"."EXAMENES"  add  "ADMINISTRADOR_OID"  number(19,0);
alter table "EXPEDIENTE"."EXAMENES"   add constraint FK_EXAMENES_ADMINISTRADOR foreign key ("ADMINISTRADOR_OID") references "EXPEDIENTE"."ADMINISTRADOR" ("USER_OID");


-- aspirante_examenes [rel8]
alter table "EXPEDIENTE"."EXAMENES"  add  "ASPIRANTE_OID"  number(19,0);
alter table "EXPEDIENTE"."EXAMENES"   add constraint FK_EXAMENES_ASPIRANTE foreign key ("ASPIRANTE_OID") references "EXPEDIENTE"."ASPIRANTE" ("USER_OID");


-- GEN FK: aspirante --> User
alter table "EXPEDIENTE"."ASPIRANTE"   add constraint FK_ASPIRANTE_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


-- GEN FK: administrador --> User
alter table "EXPEDIENTE"."ADMINISTRADOR"   add constraint FK_ADMINISTRADOR_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


