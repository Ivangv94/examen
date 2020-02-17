-- contextoGlobal_bancoPreguntas [rel11]
alter table "EXAMENES"."BANCOPREGUNTAS"  add  "CONTEXTOGLOBAL_OID"  number(19,0);
alter table "EXAMENES"."BANCOPREGUNTAS"   add constraint FK_BANCOPREGUNTAS_CONTEXTOGLOB foreign key ("CONTEXTOGLOBAL_OID") references "EXAMENES"."CONTEXTOGLOBAL" ("OID");


