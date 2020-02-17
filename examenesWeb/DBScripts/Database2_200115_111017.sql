-- contextoGlobal_contexto [rel8]
alter table "EXPEDIENTE"."CONTEXTO"  add  "CONTEXTOGLOBAL_OID"  number(19,0);
alter table "EXPEDIENTE"."CONTEXTO"   add constraint FK_CONTEXTO_CONTEXTOGLOBAL foreign key ("CONTEXTOGLOBAL_OID") references "EXPEDIENTE"."CONTEXTOGLOBAL" ("OID");


