CREATE TABLE petPet (
  petname VARCHAR(20) NOT NULL PRIMARY KEY,
  owner VARCHAR(45) NOT NULL,
  species VARCHAR(45) NOT NULL,
  gender VARCHAR(15),
  birth DATE NOT NULL,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20) NOT NULL,
  eventdate DATE NOT NULL,
  eventtype VARCHAR(15) NOT NULL,
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname, eventdate)
);
