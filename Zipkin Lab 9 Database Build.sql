--Joshua Zipkin Lab 9

drop table if exists catalog;
drop table if exists suppliers;
drop table if exists parts;
drop table if exists systems;
drop table if exists crew;
drop table if exists spacecrafts;
drop table if exists astronauts;
drop table if exists fcoperators;
drop table if exists engineers;
drop table if exists people;

create table people (
  pid	     char(4) not null,
  firstname  text,
  lastname   text,
  age        int,
  primary key(pid)
);

create table fcoperators (
  pid        char(4) not null references people(pid),
  chairpref  text,
  drinkpref  text,
  primary key(pid)
);

create table engineers (
  pid            char(4) not null references people(pid),
  highestdegree  text,
  favvideogame   text,
  primary key(pid)
);

create table astronauts (
  pid          char(4) not null references people(pid),
  yearsflying  text,
  golfhandi    text,
  primary key(pid)
);

create table spacecrafts (
  sid         char(4) not null,
  name        text,
  tailnum     int,
  weighttons  int,
  fueltype    text,
  crewcap     int,
  primary key(sid)
);  

create table crew (
  sid        char(4) not null references spacecrafts(sid),
  pid        char(4) not null references astronauts(pid),
  primary key(sid, pid)
);

create table systems (
  sysid        char(5) not null,
  name         text,
  description  text,
  sid          char(4) not null references spacecrafts(sid),
  primary key(sysid)
);

create table parts (
  partid       char(6) not null,
  name         text,
  description  text,
  sysid        char(5) not null references systems(sysid),
  primary key(partid)
);

create table suppliers (
  supid     char(5) not null,
  name      text,
  address   text,
  payterms  text,
  primary key(supid)
);

create table catalog (
  partid  char(6) not null references parts(partid),
  supid   char(5) not null references suppliers(supid),
  primary key(partid, supid)
);

insert into people(pid, firstname, lastname, age)
values('p001', 'Kaito', 'Yashio', '19'),
      ('p002', 'Itaru', 'Hashida', '19'),
      ('p003', 'Nae', 'Tennouji', '21'),
      ('p004', 'Akiho', 'Senomiya', '19'),
      ('p005', 'Rintarou', 'Okabe', '18'),
      ('p006', 'Takumi', 'Nishijou', '20');

insert into fcoperators(pid, chairpref, drinkpref)
values('p004', 'Recliner', 'Sprite'),
      ('p005', 'Massage', 'Dr Pepper');

insert into engineers(pid, highestdegree, favvideogame)
values('p002', 'Master', 'Steins;Gate'),
      ('p006', 'Bachelor', 'Ghost Trick');

insert into astronauts(pid, yearsflying, golfhandi)
values('p001', '1', '2'),
      ('p003', '2', '4');

insert into spacecrafts(sid, name, tailnum, weighttons, fueltype, crewcap)
values('s001', 'Gunvarrel', '104', '897', 'Diesel', '1'),
      ('s002', 'Apollo', '2020', '908', 'Plutonium', '2');

insert into crew(sid, pid)
values('s001', 'p001'),
      ('s002', 'p001'),
      ('s002', 'p003');

insert into systems(sysid, name, description, sid)
values('sys01', 'Propulsion', 'Used to launch the spacecraft into space.', 's002');

insert into parts(partid, name, description, sysid)
values('part01', 'Fuel Tank', 'Used to store the fuel for the spacecraft.', 'sys01');

insert into suppliers(supid, name, address, payterms)
values('sup01', 'Marist College', 'Middle of Nowhere, NY', 'Marist supplies part(s) for the spacecraft.');

insert into catalog(partid, supid)
values('part01', 'sup01');