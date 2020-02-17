-- ActivityInstance [ActivityInstance]
create table "EXAMENES"."ACTIVITYINSTANCE" (
   "OID"  number(10,0)  not null,
   "NAME"  varchar2(255 char),
   "STATUS"  varchar2(255 char),
   "READY_SINCE"  timestamp,
   "ACTIVE_SINCE"  timestamp,
   "COMPLETED_AT"  timestamp,
   "ABORTED_AT"  timestamp,
   "CANCELLED_AT"  timestamp,
   "WORKED_AT"  timestamp,
   "ROLLBACKABLE"  number(1,0),
   "CONTEXT"  varchar2(255 char),
  primary key ("OID")
);
create index "IDX_ACTIVITYINSTANCE_STATUS" on "EXAMENES"."ACTIVITYINSTANCE"("STATUS");


-- ActivityType [ActivityType]
create table "EXAMENES"."ACTIVITYTYPE" (
   "OID"  number(10,0)  not null,
   "ID"  varchar2(255 char),
   "CODE"  varchar2(255 char),
   "NAME"  varchar2(255 char),
   "DEFAULT_INSTANCE_NAME"  varchar2(255 char),
   "DESCRIPTION"  clob,
   "TYPE"  varchar2(255 char),
   "EXECUTION"  varchar2(255 char),
   "SORT_NUMBER"  double precision,
   "UUID"  varchar2(255 char),
  primary key ("OID")
);
create index "IDX_ACTIVITYTYPE_TYPE" on "EXAMENES"."ACTIVITYTYPE"("TYPE");
create index "IDX_ACTIVITYTYPE_EXECUTION" on "EXAMENES"."ACTIVITYTYPE"("EXECUTION");
create index "IDX_ACTIVITYTYPE_UUID" on "EXAMENES"."ACTIVITYTYPE"("UUID");


-- Attachment [Attachment]
create table "EXAMENES"."ATTACHMENT" (
   "OID"  number(10,0)  not null,
   "FILE"  varchar2(255 char),
   "TITLE"  varchar2(255 char),
   "TIMESTAMP"  timestamp,
  primary key ("OID")
);


-- Group [Group]
create table "EXAMENES"."GROUP" (
   "OID"  number(10,0)  not null,
   "GROUPNAME"  varchar2(255 char),
  primary key ("OID")
);


-- Module [Module]
create table "EXAMENES"."MODULE" (
   "OID"  number(10,0)  not null,
   "MODULEID"  varchar2(255 char),
   "MODULENAME"  varchar2(255 char),
   "MODULEDOMAINNAME"  varchar2(255 char),
  primary key ("OID")
);


-- Note [Note]
create table "EXAMENES"."NOTE" (
   "OID"  number(10,0)  not null,
   "TEXT"  clob,
   "TIMESTAMP"  timestamp,
  primary key ("OID")
);


-- Notification [Notification]
create table "EXAMENES"."NOTIFICATION" (
   "OID"  number(10,0)  not null,
   "MESSAGE"  varchar2(255 char),
   "READ"  number(1,0),
  primary key ("OID")
);


-- ParameterInstance [ParameterInstance]
create table "EXAMENES"."PARAMETERINSTANCE" (
   "OID"  number(10,0)  not null,
   "VALUE"  varchar2(255 char),
   "CURRENT"  number(1,0),
   "TIMESTAMP"  timestamp,
  primary key ("OID")
);
create index "IDX_PARAMETERINSTANCE_CURRENT" on "EXAMENES"."PARAMETERINSTANCE"("CURRENT");


-- ParameterType [ParameterType]
create table "EXAMENES"."PARAMETERTYPE" (
   "OID"  number(10,0)  not null,
   "NAME"  varchar2(255 char),
   "DESCRIPTION"  varchar2(255 char),
   "TYPE"  varchar2(255 char),
  primary key ("OID")
);
create index "IDX_PARAMETERTYPE_NAME" on "EXAMENES"."PARAMETERTYPE"("NAME");


-- Process [Process]
create table "EXAMENES"."PROCESS" (
   "OID"  number(10,0)  not null,
   "CODE"  varchar2(255 char),
   "NAME"  varchar2(255 char),
   "DEFAULT_INSTANCE_NAME"  varchar2(255 char),
   "DESCRIPTION"  clob,
   "UUID"  varchar2(255 char),
   "VERSION"  varchar2(255 char),
  primary key ("OID")
);
create index "IDX_PROCESS_UUID" on "EXAMENES"."PROCESS"("UUID");


-- ProcessInstance [ProcessInstance]
create table "EXAMENES"."PROCESSINSTANCE" (
   "OID"  number(10,0)  not null,
   "NAME"  varchar2(255 char),
   "SUBPROCESSINDEX"  number(10,0),
   "STATUS"  varchar2(255 char),
   "ACTIVE_SINCE"  timestamp,
   "COMPLETED_AT"  timestamp,
   "CANCELLED_AT"  timestamp,
   "ABORTED_AT"  timestamp,
  primary key ("OID")
);
create index "IDX_PROCESSINSTANCE_STATUS" on "EXAMENES"."PROCESSINSTANCE"("STATUS");


-- SequenceFlow [SequenceFlow]
create table "EXAMENES"."SEQUENCEFLOW" (
   "OID"  number(10,0)  not null,
   "LABEL"  varchar2(255 char),
   "CONDITION"  varchar2(255 char),
   "DEFAULT"  number(1,0),
   "SORT_NUMBER"  double precision,
  primary key ("OID")
);


-- User [User]
create table "EXAMENES"."USER" (
   "OID"  number(10,0)  not null,
   "USERNAME"  varchar2(255 char),
   "PASSWORD"  varchar2(255 char),
   "EMAIL"  varchar2(255 char),
  primary key ("OID")
);


-- materias [ent1]
create table "EXAMENES"."MATERIAS" (
   "OID"  number(10,0)  not null,
   "DESCRIPCION"  clob,
   "MATERIA"  varchar2(255 char),
  primary key ("OID")
);


-- Respuestas [ent10]
create table "EXAMENES"."RESPUESTAS" (
   "OID"  number(10,0)  not null,
   "OIDRESPUESTA"  number(10,0),
   "OIDPREGUNTA"  number(10,0),
   "OIDEXAMEN"  number(10,0),
   "ESTAMPARESPUESTA"  timestamp,
  primary key ("OID")
);


-- contextoGlobal [ent11]
create table "EXAMENES"."CONTEXTOGLOBAL" (
   "OID"  number(10,0)  not null,
  primary key ("OID")
);


-- bancoPreguntas [ent2]
create table "EXAMENES"."BANCOPREGUNTAS" (
   "OID"  number(10,0)  not null,
   "PREGUNTA"  varchar2(255 char),
   "FRACCION"  varchar2(255 char),
   "ARTICULO"  varchar2(255 char),
   "OIDCONTEXTO"  number(10,0),
  primary key ("OID")
);


-- bancoRespuestas [ent3]
create table "EXAMENES"."BANCORESPUESTAS" (
   "OID"  number(10,0)  not null,
   "RESPUESTACORRECTA"  number(1,0),
   "RESPUESTA"  varchar2(255 char),
  primary key ("OID")
);


-- adminExamen [ent4]
create table "EXAMENES"."ADMINEXAMEN" (
   "OID"  number(10,0)  not null,
   "PORCENTAJE"  number(10,0),
   "MATERIA"  varchar2(255 char),
   "OIDADMIN"  number(10,0),
  primary key ("OID")
);


-- contexto [ent5]
create table "EXAMENES"."CONTEXTO" (
   "OID"  number(10,0)  not null,
   "CONTEXTO"  varchar2(255 char),
   "NUMEROPREGUNTAS"  number(10,0),
  primary key ("OID")
);


-- Administrador [ent6]
create table "EXAMENES"."ADMINISTRADOR" (
   "USER_OID"  number(10,0)  not null,
   "APELLIDOPATERNO"  varchar2(255 char),
   "APELLIDOMATERNO"  varchar2(255 char),
   "NOMBRE"  varchar2(255 char),
  primary key ("USER_OID")
);


-- Aspirante [ent7]
create table "EXAMENES"."ASPIRANTE" (
   "USER_OID"  number(10,0)  not null,
   "APELLIDOPATERNO"  varchar2(255 char),
   "APELLIDOMATERNO"  varchar2(255 char),
   "NOMBRE"  varchar2(255 char),
   "FECHAREGISTRO"  timestamp,
   "ESTATUS"  varchar2(255 char),
  primary key ("USER_OID")
);


-- Examenes [ent8]
create table "EXAMENES"."EXAMENES" (
   "OID"  number(10,0)  not null,
   "FECHACREACION"  timestamp,
   "NOMBRE"  varchar2(255 char),
   "ESTATUS"  varchar2(255 char),
  primary key ("OID")
);


-- Examen [ent9]
create table "EXAMENES"."EXAMEN" (
   "OID"  number(10,0)  not null,
   "OIDPREGUNTA"  number(10,0),
   "FASE"  number(10,0),
   "NUMEROPREGUNTA"  number(10,0),
  primary key ("OID")
);


-- ActivityInstance_CandidateUser [ActivityInstance_CandidateUser]
create table "EXAMENES"."ACTIVITYINSTANCE_CANDIDATEUSER" (
   "ACTIVITYINSTANCE_OID"  number(10,0) not null,
   "USER_OID"  number(10,0) not null,
  primary key ("ACTIVITYINSTANCE_OID", "USER_OID")
);
alter table "EXAMENES"."ACTIVITYINSTANCE_CANDIDATEUSER"   add constraint FK_ACTIVITYINSTANCE_CANDIDATEU foreign key ("ACTIVITYINSTANCE_OID") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");
alter table "EXAMENES"."ACTIVITYINSTANCE_CANDIDATEUSER"   add constraint FK_ACTIVITYINSTANCE_CANDIDAT_2 foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");


-- ActivityInstance_Group [ActivityInstance_Group]
alter table "EXAMENES"."ACTIVITYINSTANCE"  add  "GROUP_OID"  number(10,0);
alter table "EXAMENES"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_GROUP foreign key ("GROUP_OID") references "EXAMENES"."GROUP" ("OID");


-- ActivityInstance_NextActivityInstanceNotes [ActivityInstance_NextActivityInstanceNotes]
alter table "EXAMENES"."NOTE"  add  "ACTIVITYINSTANCE_OID"  number(10,0);
alter table "EXAMENES"."NOTE"   add constraint FK_NOTE_ACTIVITYINSTANCE foreign key ("ACTIVITYINSTANCE_OID") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");


-- ActivityInstance_Notification [ActivityInstance_Notifications]
alter table "EXAMENES"."NOTIFICATION"  add  "ACTIVITYINSTANCE_OID"  number(10,0);
alter table "EXAMENES"."NOTIFICATION"   add constraint FK_NOTIFICATION_ACTIVITYINSTAN foreign key ("ACTIVITYINSTANCE_OID") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");


-- ActivityType_ActivityInstance [ActivityType_ActivityInstance]
alter table "EXAMENES"."ACTIVITYINSTANCE"  add  "ACTIVITYTYPE_OID"  number(10,0);
alter table "EXAMENES"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_ACTIVITYTY foreign key ("ACTIVITYTYPE_OID") references "EXAMENES"."ACTIVITYTYPE" ("OID");


-- Attachment_ProcessInstance [Attachment_ProcessInstance]
create table "EXAMENES"."ATTACHMENT_PROCESSINSTANCE" (
   "ATTACHMENT_OID"  number(10,0) not null,
   "PROCESSINSTANCE_OID"  number(10,0) not null,
  primary key ("ATTACHMENT_OID", "PROCESSINSTANCE_OID")
);
alter table "EXAMENES"."ATTACHMENT_PROCESSINSTANCE"   add constraint FK_ATTACHMENT_PROCESSINSTANCE foreign key ("ATTACHMENT_OID") references "EXAMENES"."ATTACHMENT" ("OID");
alter table "EXAMENES"."ATTACHMENT_PROCESSINSTANCE"   add constraint FK_ATTACHMENT_PROCESSINSTANC_2 foreign key ("PROCESSINSTANCE_OID") references "EXAMENES"."PROCESSINSTANCE" ("OID");


-- Attachment_User [Attachment_User]
alter table "EXAMENES"."ATTACHMENT"  add  "USER_OID"  number(10,0);
alter table "EXAMENES"."ATTACHMENT"   add constraint FK_ATTACHMENT_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "EXAMENES"."GROUP"  add  "MODULE_OID"  number(10,0);
alter table "EXAMENES"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "EXAMENES"."MODULE" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "EXAMENES"."GROUP_MODULE" (
   "GROUP_OID"  number(10,0) not null,
   "MODULE_OID"  number(10,0) not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "EXAMENES"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "EXAMENES"."GROUP" ("OID");
alter table "EXAMENES"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "EXAMENES"."MODULE" ("OID");


-- Group_ActivityType [Group_ActivityType]
create table "EXAMENES"."GROUP_ACTIVITYTYPE" (
   "GROUP_OID"  number(10,0) not null,
   "ACTIVITYTYPE_OID"  number(10,0) not null,
  primary key ("GROUP_OID", "ACTIVITYTYPE_OID")
);
alter table "EXAMENES"."GROUP_ACTIVITYTYPE"   add constraint FK_GROUP_ACTIVITYTYPE_GROUP foreign key ("GROUP_OID") references "EXAMENES"."GROUP" ("OID");
alter table "EXAMENES"."GROUP_ACTIVITYTYPE"   add constraint FK_GROUP_ACTIVITYTYPE_ACTIVITY foreign key ("ACTIVITYTYPE_OID") references "EXAMENES"."ACTIVITYTYPE" ("OID");


-- NextActivityType_PreviousSequenceFlow [NextActivityType_PreviousSequenceFlow]
alter table "EXAMENES"."SEQUENCEFLOW"  add  "ACTIVITYTYPE_OID"  number(10,0);
alter table "EXAMENES"."SEQUENCEFLOW"   add constraint FK_SEQUENCEFLOW_ACTIVITYTYPE_2 foreign key ("ACTIVITYTYPE_OID") references "EXAMENES"."ACTIVITYTYPE" ("OID");


-- Note_ActivityInstance [Note_ActivityInstance]
create table "EXAMENES"."NOTE_ACTIVITYINSTANCE" (
   "NOTE_OID"  number(10,0) not null,
   "ACTIVITYINSTANCE_OID"  number(10,0) not null,
  primary key ("NOTE_OID", "ACTIVITYINSTANCE_OID")
);
alter table "EXAMENES"."NOTE_ACTIVITYINSTANCE"   add constraint FK_NOTE_ACTIVITYINSTANCE_NOTE foreign key ("NOTE_OID") references "EXAMENES"."NOTE" ("OID");
alter table "EXAMENES"."NOTE_ACTIVITYINSTANCE"   add constraint FK_NOTE_ACTIVITYINSTANCE_ACTIV foreign key ("ACTIVITYINSTANCE_OID") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");


-- Note_ProcessInstance [Note_ProcessInstance]
create table "EXAMENES"."NOTE_PROCESSINSTANCE" (
   "NOTE_OID"  number(10,0) not null,
   "PROCESSINSTANCE_OID"  number(10,0) not null,
  primary key ("NOTE_OID", "PROCESSINSTANCE_OID")
);
alter table "EXAMENES"."NOTE_PROCESSINSTANCE"   add constraint FK_NOTE_PROCESSINSTANCE_NOTE foreign key ("NOTE_OID") references "EXAMENES"."NOTE" ("OID");
alter table "EXAMENES"."NOTE_PROCESSINSTANCE"   add constraint FK_NOTE_PROCESSINSTANCE_PROCES foreign key ("PROCESSINSTANCE_OID") references "EXAMENES"."PROCESSINSTANCE" ("OID");


-- Note_User [Note_User]
alter table "EXAMENES"."NOTE"  add  "USER_OID"  number(10,0);
alter table "EXAMENES"."NOTE"   add constraint FK_NOTE_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");


-- ParameterInstance_ActivityInstance [ParameterInstance_ActivityInstance]
alter table "EXAMENES"."PARAMETERINSTANCE"  add  "ACTIVITYINSTANCE_OID"  number(10,0);
alter table "EXAMENES"."PARAMETERINSTANCE"   add constraint FK_PARAMETERINSTANCE_ACTIVITYI foreign key ("ACTIVITYINSTANCE_OID") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");


-- ParameterType_ParameterInstance [ParameterType_ParameterInstance]
alter table "EXAMENES"."PARAMETERINSTANCE"  add  "PARAMETERTYPE_OID"  number(10,0);
alter table "EXAMENES"."PARAMETERINSTANCE"   add constraint FK_PARAMETERINSTANCE_PARAMETER foreign key ("PARAMETERTYPE_OID") references "EXAMENES"."PARAMETERTYPE" ("OID");


-- PreviousActivityInstance_NextActivityInstance [PreviousActivityInstance_NextActivityInstance]
create table "EXAMENES"."PREVIOUSACTIVITYINSTANCE_NEXTA" (
   "ACTIVITYINSTANCE_OID_2"  number(10,0) not null,
   "ACTIVITYINSTANCE_OID"  number(10,0) not null,
  primary key ("ACTIVITYINSTANCE_OID_2", "ACTIVITYINSTANCE_OID")
);
alter table "EXAMENES"."PREVIOUSACTIVITYINSTANCE_NEXTA"   add constraint FK_PREVIOUSACTIVITYINSTANCE_NE foreign key ("ACTIVITYINSTANCE_OID_2") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");
alter table "EXAMENES"."PREVIOUSACTIVITYINSTANCE_NEXTA"   add constraint FK_PREVIOUSACTIVITYINSTANCE_2 foreign key ("ACTIVITYINSTANCE_OID") references "EXAMENES"."ACTIVITYINSTANCE" ("OID");


-- PreviousActivityType_NextSequenceFlow [PreviousActivityType_NextSequenceFlow]
alter table "EXAMENES"."SEQUENCEFLOW"  add  "ACTIVITYTYPE_OID_2"  number(10,0);
alter table "EXAMENES"."SEQUENCEFLOW"   add constraint FK_SEQUENCEFLOW_ACTIVITYTYPE foreign key ("ACTIVITYTYPE_OID_2") references "EXAMENES"."ACTIVITYTYPE" ("OID");


-- ProcessInstance_ActivityInstance [ProcessInstance_ActivityInstance]
alter table "EXAMENES"."ACTIVITYINSTANCE"  add  "PROCESSINSTANCE_OID"  number(10,0);
alter table "EXAMENES"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_PROCESSINS foreign key ("PROCESSINSTANCE_OID") references "EXAMENES"."PROCESSINSTANCE" ("OID");


-- ProcessInstance_ParameterInstance [ProcessInstance_ParameterInstance]
alter table "EXAMENES"."PARAMETERINSTANCE"  add  "PROCESSINSTANCE_OID"  number(10,0);
alter table "EXAMENES"."PARAMETERINSTANCE"   add constraint FK_PARAMETERINSTANCE_PROCESSIN foreign key ("PROCESSINSTANCE_OID") references "EXAMENES"."PROCESSINSTANCE" ("OID");


-- ProcessInstance_Process [ProcessInstance_Process]
alter table "EXAMENES"."PROCESSINSTANCE"  add  "PROCESS_OID"  number(10,0);
alter table "EXAMENES"."PROCESSINSTANCE"   add constraint FK_PROCESSINSTANCE_PROCESS foreign key ("PROCESS_OID") references "EXAMENES"."PROCESS" ("OID");


-- Process_ActivityType [Process_ActivityType]
alter table "EXAMENES"."ACTIVITYTYPE"  add  "PROCESS_OID"  number(10,0);
alter table "EXAMENES"."ACTIVITYTYPE"   add constraint FK_ACTIVITYTYPE_PROCESS foreign key ("PROCESS_OID") references "EXAMENES"."PROCESS" ("OID");


-- Process_ParameterType [Process_ParameterType]
alter table "EXAMENES"."PARAMETERTYPE"  add  "PROCESS_OID"  number(10,0);
alter table "EXAMENES"."PARAMETERTYPE"   add constraint FK_PARAMETERTYPE_PROCESS foreign key ("PROCESS_OID") references "EXAMENES"."PROCESS" ("OID");


-- SubprocessInstances_ParentProcessInstance [SubprocessInstances_ParentProcessInstance]
alter table "EXAMENES"."PROCESSINSTANCE"  add  "PROCESSINSTANCE_OID"  number(10,0);
alter table "EXAMENES"."PROCESSINSTANCE"   add constraint FK_PROCESSINSTANCE_PROCESSINST foreign key ("PROCESSINSTANCE_OID") references "EXAMENES"."PROCESSINSTANCE" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "EXAMENES"."USER"  add  "GROUP_OID"  number(10,0);
alter table "EXAMENES"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "EXAMENES"."GROUP" ("OID");


-- User_Group [User2Group_Group2User]
create table "EXAMENES"."USER_GROUP" (
   "USER_OID"  number(10,0) not null,
   "GROUP_OID"  number(10,0) not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "EXAMENES"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");
alter table "EXAMENES"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "EXAMENES"."GROUP" ("OID");


-- User_ActivityInstance [User_ActivityInstance]
alter table "EXAMENES"."ACTIVITYINSTANCE"  add  "USER_OID"  number(10,0);
alter table "EXAMENES"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");


-- User_Notifications [User_Notifications]
create table "EXAMENES"."USER_NOTIFICATIONS" (
   "USER_OID"  number(10,0) not null,
   "NOTIFICATION_OID"  number(10,0) not null,
  primary key ("USER_OID", "NOTIFICATION_OID")
);
alter table "EXAMENES"."USER_NOTIFICATIONS"   add constraint FK_USER_NOTIFICATIONS_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");
alter table "EXAMENES"."USER_NOTIFICATIONS"   add constraint FK_USER_NOTIFICATIONS_NOTIFICA foreign key ("NOTIFICATION_OID") references "EXAMENES"."NOTIFICATION" ("OID");


-- bancoRespuestas_bancoPreguntas [rel1]
alter table "EXAMENES"."BANCORESPUESTAS"  add  "BANCOPREGUNTAS_OID"  number(10,0);
alter table "EXAMENES"."BANCORESPUESTAS"   add constraint FK_BANCORESPUESTAS_BANCOPREGUN foreign key ("BANCOPREGUNTAS_OID") references "EXAMENES"."BANCOPREGUNTAS" ("OID");


-- bancoPreguntas_materias [rel2]
alter table "EXAMENES"."BANCOPREGUNTAS"  add  "MATERIAS_OID"  number(10,0);
alter table "EXAMENES"."BANCOPREGUNTAS"   add constraint FK_BANCOPREGUNTAS_MATERIAS foreign key ("MATERIAS_OID") references "EXAMENES"."MATERIAS" ("OID");


-- materias_contexto [rel3]
alter table "EXAMENES"."MATERIAS"  add  "CONTEXTO_OID"  number(10,0);
alter table "EXAMENES"."MATERIAS"   add constraint FK_MATERIAS_CONTEXTO foreign key ("CONTEXTO_OID") references "EXAMENES"."CONTEXTO" ("OID");


-- ExamenesAdministrador [rel4]
alter table "EXAMENES"."EXAMENES"  add  "ADMINISTRADOR_OID"  number(10,0);
alter table "EXAMENES"."EXAMENES"   add constraint FK_EXAMENES_ADMINISTRADOR foreign key ("ADMINISTRADOR_OID") references "EXAMENES"."ADMINISTRADOR" ("USER_OID");


-- ExamenesAspirante [rel5]
alter table "EXAMENES"."EXAMENES"  add  "ASPIRANTE_OID"  number(10,0);
alter table "EXAMENES"."EXAMENES"   add constraint FK_EXAMENES_ASPIRANTE foreign key ("ASPIRANTE_OID") references "EXAMENES"."ASPIRANTE" ("USER_OID");


-- Examenes_Examen [rel6]
alter table "EXAMENES"."EXAMEN"  add  "EXAMENES_OID"  number(10,0);
alter table "EXAMENES"."EXAMEN"   add constraint FK_EXAMEN_EXAMENES foreign key ("EXAMENES_OID") references "EXAMENES"."EXAMENES" ("OID");


-- Aspirante_Respuestas [rel7]
create table "EXAMENES"."ASPIRANTE_RESPUESTAS" (
   "USER_OID"  number(10,0) not null,
   "RESPUESTAS_OID"  number(10,0) not null,
  primary key ("USER_OID", "RESPUESTAS_OID")
);
alter table "EXAMENES"."ASPIRANTE_RESPUESTAS"   add constraint FK_ASPIRANTE_RESPUESTAS_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");
alter table "EXAMENES"."ASPIRANTE_RESPUESTAS"   add constraint FK_ASPIRANTE_RESPUESTAS_RESPUE foreign key ("RESPUESTAS_OID") references "EXAMENES"."RESPUESTAS" ("OID");


-- contextoGlobal_contexto [rel8]
alter table "EXAMENES"."CONTEXTO"  add  "CONTEXTOGLOBAL_OID"  number(10,0);
alter table "EXAMENES"."CONTEXTO"   add constraint FK_CONTEXTO_CONTEXTOGLOBAL foreign key ("CONTEXTOGLOBAL_OID") references "EXAMENES"."CONTEXTOGLOBAL" ("OID");


-- GEN FK: Administrador --> User
alter table "EXAMENES"."ADMINISTRADOR"   add constraint FK_ADMINISTRADOR_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");


-- GEN FK: Aspirante --> User
alter table "EXAMENES"."ASPIRANTE"   add constraint FK_ASPIRANTE_USER foreign key ("USER_OID") references "EXAMENES"."USER" ("OID");


-- ProcessInstance.attachment count [processInstanceAttachmentCount]
create view "EXAMENES"."PROCESSINSTANCE_ATTACHMENT_COU" as
select AL1."OID" as "OID", count(distinct AL2."ATTACHMENT_OID") as "DER_ATTR"
from  "EXAMENES"."PROCESSINSTANCE" AL1 
               left outer join "EXAMENES"."ATTACHMENT_PROCESSINSTANCE" AL2 on AL1."OID"=AL2."PROCESSINSTANCE_OID"
group by AL1."OID";


