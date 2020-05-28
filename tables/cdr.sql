CREATE TABLE cdr (
  calldate timestamp with time zone DEFAULT now() NOT NULL,
  clid character varying(80) DEFAULT '' NOT NULL,
  src character varying(80) DEFAULT '' NOT NULL,
  dst character varying(80) DEFAULT '' NOT NULL,
  dcontext character varying(80) DEFAULT '' NOT NULL,
  channel character varying(80) DEFAULT '' NOT NULL,
  dstchannel character varying(80) DEFAULT '' NOT NULL,
  lastapp character varying(80) DEFAULT '' NOT NULL,
  lastdata character varying(80) DEFAULT '' NOT NULL,
  duration bigint DEFAULT 0::bigint NOT NULL,
  billsec bigint DEFAULT 0::bigint NOT NULL,
  disposition character varying(45) DEFAULT '' NOT NULL,
  amaflags bigint DEFAULT 0::bigint NOT NULL,
  accountcode character varying(20) DEFAULT '' NOT NULL,
  uniqueid character varying(32) DEFAULT '' NOT NULL,
  userfield character varying(255) DEFAULT '' NOT NULL
);