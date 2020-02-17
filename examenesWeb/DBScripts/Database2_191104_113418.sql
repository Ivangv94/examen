-- Respuestas [ent10]
create table "EXPEDIENTE"."RESPUESTAS" (
   "OID"  number(10,0)  not null,
   "OIDRESPUESTA"  number(10,0),
   "OIDPREGUNTA"  number(10,0),
  primary key ("OID")
);


-- Aspirante_Respuestas [rel7]
create table "EXPEDIENTE"."ASPIRANTE_RESPUESTAS" (
   "USER_OID"  number(19,0) not null,
   "RESPUESTAS_OID"  number(10,0) not null,
  primary key ("USER_OID", "RESPUESTAS_OID")
);
alter table "EXPEDIENTE"."ASPIRANTE_RESPUESTAS"   add constraint FK_ASPIRANTE_RESPUESTAS_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");
alter table "EXPEDIENTE"."ASPIRANTE_RESPUESTAS"   add constraint FK_ASPIRANTE_RESPUESTAS_RESPUE foreign key ("RESPUESTAS_OID") references "EXPEDIENTE"."RESPUESTAS" ("OID");


