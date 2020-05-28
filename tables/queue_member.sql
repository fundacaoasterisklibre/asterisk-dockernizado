CREATE TABLE queue_member (
  queue_name varchar(128),
  interface varchar(128),
  penalty int8,
  PRIMARY KEY (queue_name, interface)
) WITHOUT OIDS;