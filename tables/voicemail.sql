CREATE TABLE voicemail (
  id serial NOT NULL,
  customer_id bigint DEFAULT (0)::bigint NOT NULL,
  context character varying(50) DEFAULT '' NOT NULL,
  mailbox bigint DEFAULT (0)::bigint NOT NULL,
  “password” character varying(4) DEFAULT ‘0’ NOT NULL,
  fullname character varying(50) DEFAULT '' NOT NULL,
  email character varying(50) DEFAULT '' NOT NULL,
  pager character varying(50) DEFAULT '' NOT NULL,
  stamp timestamp(6) without time zone NOT NULL
);