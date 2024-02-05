USE admin;

CREATE TABLE server (
  action varchar(10) DEFAULT NULL,
  status tinyint(1) DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


CREATE TABLE server_status (
  server varchar(10) DEFAULT NULL,
  status tinyint(1) DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

insert into server_status values("auth",0),("world",0);
