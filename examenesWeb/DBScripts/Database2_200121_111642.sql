-- contexto_bancoPreguntas [rel9]
alter table "EXAMENES"."BANCOPREGUNTAS"  add  "CONTEXTO_OID"  number(19,0);
alter table "EXAMENES"."BANCOPREGUNTAS"   add constraint FK_BANCOPREGUNTAS_CONTEXTO foreign key ("CONTEXTO_OID") references "EXAMENES"."CONTEXTO" ("OID");


