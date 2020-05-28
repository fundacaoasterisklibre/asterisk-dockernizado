CREATE TABLE extensions_conf (
  id serial NOT NULL,
  context character varying(20) DEFAULT '' NOT NULL,
  exten character varying(20) DEFAULT '' NOT NULL,
  priority smallint DEFAULT 0 NOT NULL,
  app character varying(20) DEFAULT '' NOT NULL,
  appdata character varying(128)
);