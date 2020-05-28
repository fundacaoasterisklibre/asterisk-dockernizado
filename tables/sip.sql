CREATE TABLE sip (
  id serial NOT NULL,
  name character varying(80) DEFAULT '' NOT NULL,
  accountcode character varying(20),
  amaflags character varying(7),
  callgroup character varying(10),
  callerid character varying(80),
  canreinvite character varying(3) DEFAULT ‘yes’,
  context character varying(80),
  defaultip character varying(15),
  dtmfmode character varying(7),
  fromuser character varying(80),
  fromdomain character varying(80),
  host character varying(31) DEFAULT '' NOT NULL,
  insecure character varying(4),
  “language” character varying(2),
  mailbox character varying(50),
  md5secret character varying(80),
  nat character varying(5) DEFAULT ‘no’ NOT NULL,
  permit character varying(95),
  deny character varying(95),
  mask character varying(95),
  pickupgroup character varying(10),
  port character varying(5) DEFAULT '' NOT NULL,
  qualify character varying(3),
  restrictcid character varying(1),
  rtptimeout character varying(3),
  rtpholdtimeout character varying(3),
  secret character varying(80),
  “type” character varying DEFAULT ‘friend’ NOT NULL,
  username character varying(80) DEFAULT '' NOT NULL,
  disallow character varying(100) DEFAULT ‘all’,
  allow character varying(100) DEFAULT ‘g729;ilbc;gsm;ulaw;alaw’,
  musiconhold character varying(100),
  regseconds bigint DEFAULT 0::bigint NOT NULL,
  ipaddr character varying(15) DEFAULT '' NOT NULL,
  regexten character varying(80) DEFAULT '' NOT NULL,
  cancallforward character varying(3) DEFAULT ‘yes’
);