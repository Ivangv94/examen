-- Examen [ent9]
create table "EXPEDIENTE"."EXAMEN" (
   "OID"  number(10,0)  not null,
   "OIDPREGUNTA"  number(10,0),
  primary key ("OID")
);


-- Examenes_Examen [rel6]
alter table "EXPEDIENTE"."EXAMEN"  add  "EXAMENES_OID"  number(19,0);
alter table "EXPEDIENTE"."EXAMEN"   add constraint FK_EXAMEN_EXAMENES foreign key ("EXAMENES_OID") references "EXPEDIENTE"."EXAMENES" ("OID");


