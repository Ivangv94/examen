-- ActivityInstance [ActivityInstance]
create table "EXPEDIENTE"."ACTIVITYINSTANCE" (
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
create index "IDX_ACTIVITYINSTANCE_STATUS" on "EXPEDIENTE"."ACTIVITYINSTANCE"("STATUS");


-- ActivityType [ActivityType]
create table "EXPEDIENTE"."ACTIVITYTYPE" (
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
create index "IDX_ACTIVITYTYPE_TYPE" on "EXPEDIENTE"."ACTIVITYTYPE"("TYPE");
create index "IDX_ACTIVITYTYPE_EXECUTION" on "EXPEDIENTE"."ACTIVITYTYPE"("EXECUTION");
create index "IDX_ACTIVITYTYPE_UUID" on "EXPEDIENTE"."ACTIVITYTYPE"("UUID");


-- Attachment [Attachment]
create table "EXPEDIENTE"."ATTACHMENT" (
   "OID"  number(10,0)  not null,
   "FILE"  varchar2(255 char),
   "TITLE"  varchar2(255 char),
   "TIMESTAMP"  timestamp,
  primary key ("OID")
);


-- Group [Group]
create table "EXPEDIENTE"."GROUP" (
   "OID"  number(10,0)  not null,
   "GROUPNAME"  varchar2(255 char),
  primary key ("OID")
);


-- Module [Module]
create table "EXPEDIENTE"."MODULE" (
   "OID"  number(10,0)  not null,
   "MODULEID"  varchar2(255 char),
   "MODULENAME"  varchar2(255 char),
   "MODULEDOMAINNAME"  varchar2(255 char),
  primary key ("OID")
);


-- Note [Note]
create table "EXPEDIENTE"."NOTE" (
   "OID"  number(10,0)  not null,
   "TEXT"  clob,
   "TIMESTAMP"  timestamp,
  primary key ("OID")
);


-- Notification [Notification]
create table "EXPEDIENTE"."NOTIFICATION" (
   "OID"  number(10,0)  not null,
   "MESSAGE"  varchar2(255 char),
   "READ"  number(1,0),
  primary key ("OID")
);


-- ParameterInstance [ParameterInstance]
create table "EXPEDIENTE"."PARAMETERINSTANCE" (
   "OID"  number(10,0)  not null,
   "VALUE"  varchar2(255 char),
   "CURRENT"  number(1,0),
   "TIMESTAMP"  timestamp,
  primary key ("OID")
);
create index "IDX_PARAMETERINSTANCE_CURRENT" on "EXPEDIENTE"."PARAMETERINSTANCE"("CURRENT");


-- ParameterType [ParameterType]
create table "EXPEDIENTE"."PARAMETERTYPE" (
   "OID"  number(10,0)  not null,
   "NAME"  varchar2(255 char),
   "DESCRIPTION"  varchar2(255 char),
   "TYPE"  varchar2(255 char),
  primary key ("OID")
);
create index "IDX_PARAMETERTYPE_NAME" on "EXPEDIENTE"."PARAMETERTYPE"("NAME");


-- Process [Process]
create table "EXPEDIENTE"."PROCESS" (
   "OID"  number(10,0)  not null,
   "CODE"  varchar2(255 char),
   "NAME"  varchar2(255 char),
   "DEFAULT_INSTANCE_NAME"  varchar2(255 char),
   "DESCRIPTION"  clob,
   "UUID"  varchar2(255 char),
   "VERSION"  varchar2(255 char),
  primary key ("OID")
);
create index "IDX_PROCESS_UUID" on "EXPEDIENTE"."PROCESS"("UUID");


-- ProcessInstance [ProcessInstance]
create table "EXPEDIENTE"."PROCESSINSTANCE" (
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
create index "IDX_PROCESSINSTANCE_STATUS" on "EXPEDIENTE"."PROCESSINSTANCE"("STATUS");


-- SequenceFlow [SequenceFlow]
create table "EXPEDIENTE"."SEQUENCEFLOW" (
   "OID"  number(10,0)  not null,
   "LABEL"  varchar2(255 char),
   "CONDITION"  varchar2(255 char),
   "DEFAULT"  number(1,0),
   "SORT_NUMBER"  double precision,
  primary key ("OID")
);


-- User [User]
create table "EXPEDIENTE"."USER" (
   "OID"  number(10,0)  not null,
   "USERNAME"  varchar2(255 char),
   "PASSWORD"  varchar2(255 char),
   "EMAIL"  varchar2(255 char),
  primary key ("OID")
);


-- materias [ent1]
create table "EXPEDIENTE"."MATERIAS" (
   "OID"  number(10,0)  not null,
   "DESCRIPCION"  clob,
   "MATERIA"  varchar2(255 char),
  primary key ("OID")
);


-- bancoPreguntas [ent2]
create table "EXPEDIENTE"."BANCOPREGUNTAS" (
   "OID"  number(10,0)  not null,
   "PREGUNTA"  varchar2(255 char),
  primary key ("OID")
);


-- bancoRespuestas [ent3]
create table "EXPEDIENTE"."BANCORESPUESTAS" (
   "OID"  number(10,0)  not null,
   "RESPUESTACORRECTA"  number(1,0),
   "RESPUESTA"  varchar2(255 char),
  primary key ("OID")
);


-- adminExamen [ent4]
create table "EXPEDIENTE"."ADMINEXAMEN" (
   "OID"  number(10,0)  not null,
   "PORCENTAJE"  number(10,0),
   "MATERIA"  varchar2(255 char),
   "OIDADMIN"  number(10,0),
  primary key ("OID")
);


-- contexto [ent5]
create table "EXPEDIENTE"."CONTEXTO" (
   "OID"  number(10,0)  not null,
   "CONTEXTO"  varchar2(255 char),
  primary key ("OID")
);


-- ActivityInstance_CandidateUser [ActivityInstance_CandidateUser]
create table "EXPEDIENTE"."ACTIVITYINSTANCE_CANDIDATEUSER" (
   "ACTIVITYINSTANCE_OID"  number(10,0) not null,
   "USER_OID"  number(10,0) not null,
  primary key ("ACTIVITYINSTANCE_OID", "USER_OID")
);
alter table "EXPEDIENTE"."ACTIVITYINSTANCE_CANDIDATEUSER"   add constraint FK_ACTIVITYINSTANCE_CANDIDATEU foreign key ("ACTIVITYINSTANCE_OID") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");
alter table "EXPEDIENTE"."ACTIVITYINSTANCE_CANDIDATEUSER"   add constraint FK_ACTIVITYINSTANCE_CANDIDAT_2 foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


-- ActivityInstance_Group [ActivityInstance_Group]
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"  add  "GROUP_OID"  number(10,0);
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_GROUP foreign key ("GROUP_OID") references "EXPEDIENTE"."GROUP" ("OID");


-- ActivityInstance_NextActivityInstanceNotes [ActivityInstance_NextActivityInstanceNotes]
alter table "EXPEDIENTE"."NOTE"  add  "ACTIVITYINSTANCE_OID"  number(10,0);
alter table "EXPEDIENTE"."NOTE"   add constraint FK_NOTE_ACTIVITYINSTANCE foreign key ("ACTIVITYINSTANCE_OID") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");


-- ActivityInstance_Notification [ActivityInstance_Notifications]
alter table "EXPEDIENTE"."NOTIFICATION"  add  "ACTIVITYINSTANCE_OID"  number(10,0);
alter table "EXPEDIENTE"."NOTIFICATION"   add constraint FK_NOTIFICATION_ACTIVITYINSTAN foreign key ("ACTIVITYINSTANCE_OID") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");


-- ActivityType_ActivityInstance [ActivityType_ActivityInstance]
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"  add  "ACTIVITYTYPE_OID"  number(10,0);
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_ACTIVITYTY foreign key ("ACTIVITYTYPE_OID") references "EXPEDIENTE"."ACTIVITYTYPE" ("OID");


-- Attachment_ProcessInstance [Attachment_ProcessInstance]
create table "EXPEDIENTE"."ATTACHMENT_PROCESSINSTANCE" (
   "ATTACHMENT_OID"  number(10,0) not null,
   "PROCESSINSTANCE_OID"  number(10,0) not null,
  primary key ("ATTACHMENT_OID", "PROCESSINSTANCE_OID")
);
alter table "EXPEDIENTE"."ATTACHMENT_PROCESSINSTANCE"   add constraint FK_ATTACHMENT_PROCESSINSTANCE foreign key ("ATTACHMENT_OID") references "EXPEDIENTE"."ATTACHMENT" ("OID");
alter table "EXPEDIENTE"."ATTACHMENT_PROCESSINSTANCE"   add constraint FK_ATTACHMENT_PROCESSINSTANC_2 foreign key ("PROCESSINSTANCE_OID") references "EXPEDIENTE"."PROCESSINSTANCE" ("OID");


-- Attachment_User [Attachment_User]
alter table "EXPEDIENTE"."ATTACHMENT"  add  "USER_OID"  number(10,0);
alter table "EXPEDIENTE"."ATTACHMENT"   add constraint FK_ATTACHMENT_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "EXPEDIENTE"."GROUP"  add  "MODULE_OID"  number(10,0);
alter table "EXPEDIENTE"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "EXPEDIENTE"."MODULE" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "EXPEDIENTE"."GROUP_MODULE" (
   "GROUP_OID"  number(10,0) not null,
   "MODULE_OID"  number(10,0) not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "EXPEDIENTE"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "EXPEDIENTE"."GROUP" ("OID");
alter table "EXPEDIENTE"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "EXPEDIENTE"."MODULE" ("OID");


-- Group_ActivityType [Group_ActivityType]
create table "EXPEDIENTE"."GROUP_ACTIVITYTYPE" (
   "GROUP_OID"  number(10,0) not null,
   "ACTIVITYTYPE_OID"  number(10,0) not null,
  primary key ("GROUP_OID", "ACTIVITYTYPE_OID")
);
alter table "EXPEDIENTE"."GROUP_ACTIVITYTYPE"   add constraint FK_GROUP_ACTIVITYTYPE_GROUP foreign key ("GROUP_OID") references "EXPEDIENTE"."GROUP" ("OID");
alter table "EXPEDIENTE"."GROUP_ACTIVITYTYPE"   add constraint FK_GROUP_ACTIVITYTYPE_ACTIVITY foreign key ("ACTIVITYTYPE_OID") references "EXPEDIENTE"."ACTIVITYTYPE" ("OID");


-- NextActivityType_PreviousSequenceFlow [NextActivityType_PreviousSequenceFlow]
alter table "EXPEDIENTE"."SEQUENCEFLOW"  add  "ACTIVITYTYPE_OID"  number(10,0);
alter table "EXPEDIENTE"."SEQUENCEFLOW"   add constraint FK_SEQUENCEFLOW_ACTIVITYTYPE foreign key ("ACTIVITYTYPE_OID") references "EXPEDIENTE"."ACTIVITYTYPE" ("OID");


-- Note_ActivityInstance [Note_ActivityInstance]
create table "EXPEDIENTE"."NOTE_ACTIVITYINSTANCE" (
   "NOTE_OID"  number(10,0) not null,
   "ACTIVITYINSTANCE_OID"  number(10,0) not null,
  primary key ("NOTE_OID", "ACTIVITYINSTANCE_OID")
);
alter table "EXPEDIENTE"."NOTE_ACTIVITYINSTANCE"   add constraint FK_NOTE_ACTIVITYINSTANCE_NOTE foreign key ("NOTE_OID") references "EXPEDIENTE"."NOTE" ("OID");
alter table "EXPEDIENTE"."NOTE_ACTIVITYINSTANCE"   add constraint FK_NOTE_ACTIVITYINSTANCE_ACTIV foreign key ("ACTIVITYINSTANCE_OID") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");


-- Note_ProcessInstance [Note_ProcessInstance]
create table "EXPEDIENTE"."NOTE_PROCESSINSTANCE" (
   "NOTE_OID"  number(10,0) not null,
   "PROCESSINSTANCE_OID"  number(10,0) not null,
  primary key ("NOTE_OID", "PROCESSINSTANCE_OID")
);
alter table "EXPEDIENTE"."NOTE_PROCESSINSTANCE"   add constraint FK_NOTE_PROCESSINSTANCE_NOTE foreign key ("NOTE_OID") references "EXPEDIENTE"."NOTE" ("OID");
alter table "EXPEDIENTE"."NOTE_PROCESSINSTANCE"   add constraint FK_NOTE_PROCESSINSTANCE_PROCES foreign key ("PROCESSINSTANCE_OID") references "EXPEDIENTE"."PROCESSINSTANCE" ("OID");


-- Note_User [Note_User]
alter table "EXPEDIENTE"."NOTE"  add  "USER_OID"  number(10,0);
alter table "EXPEDIENTE"."NOTE"   add constraint FK_NOTE_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


-- ParameterInstance_ActivityInstance [ParameterInstance_ActivityInstance]
alter table "EXPEDIENTE"."PARAMETERINSTANCE"  add  "ACTIVITYINSTANCE_OID"  number(10,0);
alter table "EXPEDIENTE"."PARAMETERINSTANCE"   add constraint FK_PARAMETERINSTANCE_ACTIVITYI foreign key ("ACTIVITYINSTANCE_OID") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");


-- ParameterType_ParameterInstance [ParameterType_ParameterInstance]
alter table "EXPEDIENTE"."PARAMETERINSTANCE"  add  "PARAMETERTYPE_OID"  number(10,0);
alter table "EXPEDIENTE"."PARAMETERINSTANCE"   add constraint FK_PARAMETERINSTANCE_PARAMETER foreign key ("PARAMETERTYPE_OID") references "EXPEDIENTE"."PARAMETERTYPE" ("OID");


-- PreviousActivityInstance_NextActivityInstance [PreviousActivityInstance_NextActivityInstance]
create table "EXPEDIENTE"."PREVIOUSACTIVITYINSTANCE_NEXTA" (
   "ACTIVITYINSTANCE_OID_2"  number(10,0) not null,
   "ACTIVITYINSTANCE_OID"  number(10,0) not null,
  primary key ("ACTIVITYINSTANCE_OID_2", "ACTIVITYINSTANCE_OID")
);
alter table "EXPEDIENTE"."PREVIOUSACTIVITYINSTANCE_NEXTA"   add constraint FK_PREVIOUSACTIVITYINSTANCE_NE foreign key ("ACTIVITYINSTANCE_OID_2") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");
alter table "EXPEDIENTE"."PREVIOUSACTIVITYINSTANCE_NEXTA"   add constraint FK_PREVIOUSACTIVITYINSTANCE_2 foreign key ("ACTIVITYINSTANCE_OID") references "EXPEDIENTE"."ACTIVITYINSTANCE" ("OID");


-- PreviousActivityType_NextSequenceFlow [PreviousActivityType_NextSequenceFlow]
alter table "EXPEDIENTE"."SEQUENCEFLOW"  add  "ACTIVITYTYPE_OID_2"  number(10,0);
alter table "EXPEDIENTE"."SEQUENCEFLOW"   add constraint FK_SEQUENCEFLOW_ACTIVITYTYPE_2 foreign key ("ACTIVITYTYPE_OID_2") references "EXPEDIENTE"."ACTIVITYTYPE" ("OID");


-- ProcessInstance_ActivityInstance [ProcessInstance_ActivityInstance]
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"  add  "PROCESSINSTANCE_OID"  number(10,0);
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_PROCESSINS foreign key ("PROCESSINSTANCE_OID") references "EXPEDIENTE"."PROCESSINSTANCE" ("OID");


-- ProcessInstance_ParameterInstance [ProcessInstance_ParameterInstance]
alter table "EXPEDIENTE"."PARAMETERINSTANCE"  add  "PROCESSINSTANCE_OID"  number(10,0);
alter table "EXPEDIENTE"."PARAMETERINSTANCE"   add constraint FK_PARAMETERINSTANCE_PROCESSIN foreign key ("PROCESSINSTANCE_OID") references "EXPEDIENTE"."PROCESSINSTANCE" ("OID");


-- ProcessInstance_Process [ProcessInstance_Process]
alter table "EXPEDIENTE"."PROCESSINSTANCE"  add  "PROCESS_OID"  number(10,0);
alter table "EXPEDIENTE"."PROCESSINSTANCE"   add constraint FK_PROCESSINSTANCE_PROCESS foreign key ("PROCESS_OID") references "EXPEDIENTE"."PROCESS" ("OID");


-- Process_ActivityType [Process_ActivityType]
alter table "EXPEDIENTE"."ACTIVITYTYPE"  add  "PROCESS_OID"  number(10,0);
alter table "EXPEDIENTE"."ACTIVITYTYPE"   add constraint FK_ACTIVITYTYPE_PROCESS foreign key ("PROCESS_OID") references "EXPEDIENTE"."PROCESS" ("OID");


-- Process_ParameterType [Process_ParameterType]
alter table "EXPEDIENTE"."PARAMETERTYPE"  add  "PROCESS_OID"  number(10,0);
alter table "EXPEDIENTE"."PARAMETERTYPE"   add constraint FK_PARAMETERTYPE_PROCESS foreign key ("PROCESS_OID") references "EXPEDIENTE"."PROCESS" ("OID");


-- SubprocessInstances_ParentProcessInstance [SubprocessInstances_ParentProcessInstance]
alter table "EXPEDIENTE"."PROCESSINSTANCE"  add  "PROCESSINSTANCE_OID"  number(10,0);
alter table "EXPEDIENTE"."PROCESSINSTANCE"   add constraint FK_PROCESSINSTANCE_PROCESSINST foreign key ("PROCESSINSTANCE_OID") references "EXPEDIENTE"."PROCESSINSTANCE" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "EXPEDIENTE"."USER"  add  "GROUP_OID"  number(10,0);
alter table "EXPEDIENTE"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "EXPEDIENTE"."GROUP" ("OID");


-- User_Group [User2Group_Group2User]
create table "EXPEDIENTE"."USER_GROUP" (
   "USER_OID"  number(10,0) not null,
   "GROUP_OID"  number(10,0) not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "EXPEDIENTE"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");
alter table "EXPEDIENTE"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "EXPEDIENTE"."GROUP" ("OID");


-- User_ActivityInstance [User_ActivityInstance]
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"  add  "USER_OID"  number(10,0);
alter table "EXPEDIENTE"."ACTIVITYINSTANCE"   add constraint FK_ACTIVITYINSTANCE_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");


-- User_Notifications [User_Notifications]
create table "EXPEDIENTE"."USER_NOTIFICATIONS" (
   "USER_OID"  number(10,0) not null,
   "NOTIFICATION_OID"  number(10,0) not null,
  primary key ("USER_OID", "NOTIFICATION_OID")
);
alter table "EXPEDIENTE"."USER_NOTIFICATIONS"   add constraint FK_USER_NOTIFICATIONS_USER foreign key ("USER_OID") references "EXPEDIENTE"."USER" ("OID");
alter table "EXPEDIENTE"."USER_NOTIFICATIONS"   add constraint FK_USER_NOTIFICATIONS_NOTIFICA foreign key ("NOTIFICATION_OID") references "EXPEDIENTE"."NOTIFICATION" ("OID");


-- bancoRespuestas_bancoPreguntas [rel1]
alter table "EXPEDIENTE"."BANCORESPUESTAS"  add  "BANCOPREGUNTAS_OID"  number(10,0);
alter table "EXPEDIENTE"."BANCORESPUESTAS"   add constraint FK_BANCORESPUESTAS_BANCOPREGUN foreign key ("BANCOPREGUNTAS_OID") references "EXPEDIENTE"."BANCOPREGUNTAS" ("OID");


-- bancoPreguntas_materias [rel2]
alter table "EXPEDIENTE"."BANCOPREGUNTAS"  add  "MATERIAS_OID"  number(10,0);
alter table "EXPEDIENTE"."BANCOPREGUNTAS"   add constraint FK_BANCOPREGUNTAS_MATERIAS foreign key ("MATERIAS_OID") references "EXPEDIENTE"."MATERIAS" ("OID");


-- materias_contexto [rel3]
alter table "EXPEDIENTE"."MATERIAS"  add  "CONTEXTO_OID"  number(10,0);
alter table "EXPEDIENTE"."MATERIAS"   add constraint FK_MATERIAS_CONTEXTO foreign key ("CONTEXTO_OID") references "EXPEDIENTE"."CONTEXTO" ("OID");


-- ProcessInstance.attachment count [processInstanceAttachmentCount]
drop view "EXPEDIENTE"."PROCESSINSTANCE_ATTACHMENT_COU";
create view "EXPEDIENTE"."PROCESSINSTANCE_ATTACHMENT_COU" as
select AL1."OID" as "OID", count(distinct AL2."ATTACHMENT_OID") as "DER_ATTR"
from  "EXPEDIENTE"."PROCESSINSTANCE" AL1 
               left outer join "EXPEDIENTE"."ATTACHMENT_PROCESSINSTANCE" AL2 on AL1."OID"=AL2."PROCESSINSTANCE_OID"
group by AL1."OID";


