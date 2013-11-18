use bolters;

delete from season;
insert into season values(1,'spring',0);
insert into season values(2,'summer',0);
insert into season values(3,'autumn',0);
insert into season values(4,'winter',0);

delete from grade;
insert into grade (id,french,version) values(1,'3a',0);
insert into grade (id,french,version) values(2,'3a+',0);
insert into grade (id,french,version) values(3,'3b',0);
insert into grade (id,french,version) values(4,'3b+',0);
insert into grade (id,french,version) values(5,'3c',0);
insert into grade (id,french,version) values(6,'3c+',0);
insert into grade (id,french,version) values(7,'4a',0);
insert into grade (id,french,version) values(8,'4a+',0);
insert into grade (id,french,version) values(9,'4b',0);
insert into grade (id,french,version) values(10,'4b+',0);
insert into grade (id,french,version) values(11,'4c',0);
insert into grade (id,french,version) values(12,'4c+',0);
insert into grade (id,french,version) values(13,'5a',0);
insert into grade (id,french,version) values(14,'5a+',0);
insert into grade (id,french,version) values(15,'5b',0);
insert into grade (id,french,version) values(16,'5b+',0);
insert into grade (id,french,version) values(17,'5c',0);
insert into grade (id,french,version) values(18,'5c+',0);

delete from ranking;
insert into ranking (id,name,score,version) values(1,'crap',1.0,0);
insert into ranking (id,name,score,version) values(2,'not so good',2.0,0);
insert into ranking (id,name,score,version) values(3,'not so bad',3.0,0);
insert into ranking (id,name,score,version) values(4,'nice',4.0,0);
insert into ranking (id,name,score,version) values(5,'fucking amazing',5.0,0);

delete from style;
insert into style values(1,'overhang','',0);
insert into style values(2,'crack','',0);
insert into style values(3,'dihedral','',0);

delete from price_range;
insert into price_range values(1,'10-20','From 10 to 20',0);
insert into price_range values(2,'20-30','From 10 to 20',0);
insert into price_range values(3,'30-40','From 10 to 20',0);
insert into price_range values(4,'40-50','From 10 to 20',0);
insert into price_range values(5,'50-60','From 10 to 20',0);
insert into price_range values(6,'60-70','From 10 to 20',0);


