-- materias [ent1]
create table "public"."materias" (
   "oid"  int4  not null,
   "descripcion"  text,
   "materia"  varchar(255),
  primary key ("oid")
);


-- bancoPreguntas [ent2]
create table "public"."bancopreguntas" (
   "oid"  int4  not null,
   "pregunta"  varchar(255),
  primary key ("oid")
);


-- bancoRespuestas [ent3]
create table "public"."bancorespuestas" (
   "oid"  int4  not null,
   "respuestacorrecta"  bool,
   "respuesta"  varchar(255),
  primary key ("oid")
);


-- adminExamen [ent4]
create table "public"."adminexamen" (
   "oid"  int4  not null,
   "porcentaje"  int4,
   "materia"  varchar(255),
   "oidadmin"  int4,
  primary key ("oid")
);


-- materias_bancoPreguntas [rel1]
alter table "public"."materias"  add column  "bancopreguntas_oid"  int4;
alter table "public"."materias"   add constraint fk_materias_bancopreguntas foreign key ("bancopreguntas_oid") references "public"."bancopreguntas" ("oid");


-- bancoPreguntas_Entity3 [rel2]
create table "public"."bancopreguntas_entity3" (
   "bancopreguntas_oid"  int4 not null,
   "bancorespuestas_oid"  int4 not null,
  primary key ("bancopreguntas_oid", "bancorespuestas_oid")
);
alter table "public"."bancopreguntas_entity3"   add constraint fk_bancopreguntas_entity3_banc foreign key ("bancopreguntas_oid") references "public"."bancopreguntas" ("oid");
alter table "public"."bancopreguntas_entity3"   add constraint fk_bancopreguntas_entity3_ba_2 foreign key ("bancorespuestas_oid") references "public"."bancorespuestas" ("oid");


