CREATE DATABASE footballclub_db;

USE footballclub_db;

CREATE TABLE club_tbl (
club_id bigint primary key,
club_name varchar(50),
club_phone varchar(15),
club_address varchar(50));

CREATE TABLE office_location_tbl(
location_id bigint primary key,
Location varchar(50),
club_id_fk bigint,
foreign key (club_id_fk) references club_tbl(club_id) );

CREATE TABLE player_tbl (
player_id bigint primary key,
player_name varchar(50),
player_phone varchar(15),
player_address varchar(50),
club_id_fk bigint,
foreign key (club_id_fk) references club_tbl(club_id) );

CREATE TABLE employeetype_tbl (
employeetype_id bigint primary key,
employeetype varchar(50));

CREATE TABLE employee_tbl (
employee_id bigint primary key,
employee_name varchar(50),
employee_phone varchar(15),
employee_email varchar(50),
employee_address varchar(50),
employeetype_id_fk bigint,
foreign key (employeetype_id_fk) references employeetype_tbl(employeetype_id),
location_id_fk bigint,
foreign key (location_id_fk) references office_location_tbl(location_id));

CREATE TABLE specialisation_tbl (
specialisation_id bigint primary key,
specialisation varchar(50));

CREATE TABLE Physiotherapist_tbl (
Physio_id bigint primary key,
Physio_name varchar(50),
employee_phone varchar(15),
Physio_address varchar(50),
specialisation_id_fk bigint,
foreign key (specialisation_id_fk) references specialisation_tbl(specialisation_id),
location_id_fk bigint,
foreign key (location_id_fk) references office_location_tbl(location_id));

CREATE TABLE player_appointment_tbl (
P_appointment_id bigint primary key,
P_appointment_time time,
P_appointment_date date,
player_id_fk bigint,
foreign key (player_id_fk) references player_tbl(player_id),
Physio_id_fk bigint,
foreign key (Physio_id_fk) references Physiotherapist_tbl(Physio_id),
employee_id_fk bigint,
foreign key (employee_id_fk) references employee_tbl(employee_id) );

CREATE TABLE Employee_appointment_tbl (
e_appointment_id bigint primary key,
e_appointment_time time,
e_appointment_date date,
employee_id_fk bigint,
foreign key (employee_id_fk) references employee_tbl(employee_id),
Physio_id_fk bigint,
foreign key (Physio_id_fk) references Physiotherapist_tbl(Physio_id) );

USE footballclub_db;

INSERT INTO club_tbl values('701', 'Mt Albert Football Club','093688999','1 Mt Albert Road, Mt Albert' );


INSERT INTO employeetype_tbl Values('401', 'Manager');
INSERT INTO employeetype_tbl Values('402','Rceptionist');
INSERT INTO employeetype_tbl Values('403','Coach');
INSERT INTO employeetype_tbl Values('404','IT Admin');
INSERT INTO employeetype_tbl Values('405','Others');



SELECT * FROM employeetype_tbl;




INSERT INTO specialisation_tbl values('601','Orthopaedic');
INSERT INTO specialisation_tbl values('602','Chiropractic'); 
INSERT INTO specialisation_tbl values('603','Acupuncture');

USE footballclub_db;

INSERT INTO physiotherapist_tbl value('201','Alan Mcdonald','09343980','934 Great North Road Grey Lyn','601','503');
INSERT INTO physiotherapist_tbl value('202','Lisa Selad','02039456423','87 Symond Street Eden Terrace',	'602','501');
INSERT INTO physiotherapist_tbl value('203','Adrew Dalad','02465468490','120 Franklin Road Freemans Bay','603','505');
INSERT INTO physiotherapist_tbl value('204','Christina Pele','021456487489','4/89 Ocean Street Mission Bay','602','502');
INSERT INTO physiotherapist_tbl value('205','Kayla Andge','0973454377',	'4 King Avnue Devonport','601','504');

SELECT * FROM physiotherapist_tbl;

INSERT INTO player_tbl values('30001','David Tood','021343987',	'23 Waterview Road, Freemans Bay','701');
INSERT INTO player_tbl values('30002','Jason Ali','020133096',	'1/189 Great South Road, Penrose','701');
INSERT INTO player_tbl values('30003','Luke Glen','09785343','90 Dominian Road, Mt Eden','701');
INSERT INTO player_tbl values('30004','Jack Armstrong','024243984','B3, 109 Victoria Street, CBD','701');
INSERT INTO player_tbl values('30005','William Lanord','021098354','53 Beach Road, Takapuna','701');


UPDATE player_tbl 
SET player_address = '23/109 Queen Street'
WHERE player_id = 30005;

SELECT * FROM player_tbl;

INSERT INTO player_appointment_tbl values ('80001','8:30','2021-12-12','30003','204','103');
INSERT INTO player_appointment_tbl values ('80002',	'14:00','2021-12-13','30002',	'203',	'103');
INSERT INTO player_appointment_tbl values ('80003',	'10:45','2021-12-18','30005',	'203',	'103');
INSERT INTO player_appointment_tbl values ('80004',	'15:30','2021-12-20','30004',	'201',	'103');
INSERT INTO player_appointment_tbl values ('80005',	'11:00','2021-12-21','30001',	'202',	'103');



UPDATE player_appointment_tbl
SET P_appointment_time = '12:00'
WHERE P_appointment_id= 80005;


DELETE FROM player_appointment_tbl
WHERE P_appointment_id = '80005';

SELECT * FROM player_appointment_tbl;

INSERT INTO employee_appointment_tbl values ('90001','9:00','2021-12-13','102','205');
INSERT INTO employee_appointment_tbl values ('90002','16:00','2021-12-15','101','201');
INSERT INTO employee_appointment_tbl values ('90003','13:30','2021-12-18','105','203');
INSERT INTO employee_appointment_tbl values ('90004','10:30','2021-12-19','103','204');
INSERT INTO employee_appointment_tbl values ('90005','12:00','2021-12-19','104','202');




DELETE FROM employee_appointment_tbl
WHERE e_appointment_id = '90001';


SELECT * FROM employee_appointment_tbl;

USE footballclub_db;

INSERT INTO office_location_tbl values ('501', 'Room 501', '701');
INSERT INTO office_location_tbl values ('502', 'Room 502', '701');
INSERT INTO office_location_tbl values ('503', 'Room 503', '701');
INSERT INTO office_location_tbl values ('504', 'Room 504', '701');
INSERT INTO office_location_tbl values ('505', 'Room 505', '701');
INSERT INTO office_location_tbl values ('506', 'Room 506', '701');
INSERT INTO office_location_tbl values ('507', 'Room 507', '701');
INSERT INTO office_location_tbl values ('508', 'Room 508', '701');
INSERT INTO office_location_tbl values ('509', 'Room 509', '701');
INSERT INTO office_location_tbl values ('510', 'Room 510', '701');

INSERT INTO employee_tbl 
values ('101', 'Eric Jolley', '098353454', 'eric.J@mtalbertfootball.co.nz', '18 Wesley Road, Wesley', '401', '510');
INSERT INTO employee_tbl 
values ('102', 'Lily Hanas', '0234354609', 'lily.H@mtalbertfootball.co.nz', '5/30 Daroa Road, St Johns', '402', '506');
INSERT INTO employee_tbl 
values ('103', 'Sofia Jersey', '0213900735', 'sofia.J@mtalbertfootball.co.nz', '4B Wood Street, Freemans Bay', '403', '507');
INSERT INTO employee_tbl 
values ('104', 'Lora Ara', '0205987739', 'lora.A@mtalbertfootball.co.nz', '1003 Alton Road, Northshore', '404', '508');
INSERT INTO employee_tbl 
values ('105', 'LJohn McCrane', '0248774546', 'john.C@mtalbertfootball.co.nz', '3 Jervos Road, Herne Bay', '405', '509');

DELETE FROM employee_tbl 
WHERE employee_id = 105;

SELECT * FROM employee_tbl;


SELECT employee_name, e_appointment_time, e_appointment_date
FROM employee_appointment_tbl, employee_tbl
WHERE  employee_id = employee_id_fk;


SELECT Physio_name, specialisation
FROM physiotherapist_tbl, specialisation_tbl
WHERE specialisation_id = specialisation_id_fk

CHECK TABLE player_tbl;