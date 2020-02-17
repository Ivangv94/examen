-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "EXAMENES"."USER"   drop constraint "FK_USER_GROUP";
alter table "EXAMENES"."USER"  drop column  "GROUP_OID";
-- ProcessInstance_Process [ProcessInstance_Process]
alter table "EXAMENES"."PROCESSINSTANCE"   drop constraint "FK_PROCESSINSTANCE_PROCESS";
alter table "EXAMENES"."PROCESSINSTANCE"  drop column  "PROCESS_OID";
-- Attachment_User [Attachment_User]
alter table "EXAMENES"."ATTACHMENT"   drop constraint "FK_ATTACHMENT_USER";
alter table "EXAMENES"."ATTACHMENT"  drop column  "USER_OID";
-- Attachment_ProcessInstance [Attachment_ProcessInstance]
alter table "EXAMENES"."ATTACHMENT_PROCESSINSTANCE"   drop constraint "FK_ATTACHMENT_PROCESSINSTANC_2";
alter table "EXAMENES"."ATTACHMENT_PROCESSINSTANCE"   drop constraint "FK_ATTACHMENT_PROCESSINSTANCE";
drop table "EXAMENES"."ATTACHMENT_PROCESSINSTANCE";
-- User [User]
drop table "EXAMENES"."USER";
-- ProcessInstance [ProcessInstance]
drop index "IDX_PROCESSINSTANCE_STATUS";
drop table "EXAMENES"."PROCESSINSTANCE";
-- Process [Process]
drop index "IDX_PROCESS_UUID";
drop table "EXAMENES"."PROCESS";
-- Group [Group]
drop table "EXAMENES"."GROUP";
-- Attachment [Attachment]
drop table "EXAMENES"."ATTACHMENT";
