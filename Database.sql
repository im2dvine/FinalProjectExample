CREATE SCHEMA recycle;
USE recycle;

DROP TABLE recycleCenters;

CREATE TABLE recycleCenters (
	id INT  NOT NULL AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL,
    addr VARCHAR(75) NOT NULL,
    hours VARCHAR(75) NOT NULL,
    countyid int not null,
	-- materialsid int not null,
    _created TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id),
-- 	FOREIGN KEY (materialsid) REFERENCES materials(id),
    Foreign key (countyid) references county(id)
);

drop table materials;

CREATE TABLE materials (
id int auto_increment not null,
name varchar(50) not null,
_created timestamp default now(),
primary key (id)
);

create table county (
id int not null auto_increment,
name varchar(50) not null,
_created timestamp default now(),
primary key(id)
);

drop table centerMaterials;

create table centerMaterials (
centerid INT not null,
materialsid INT not null,
primary key(centerid, materialsid),
FOREIGN KEY (centerid) REFERENCES recycleCenters(id),
FOREIGN KEY (materialsid) REFERENCES materials(id)
);

insert into centerMaterials (centerid, materialsid)
values(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 1),
(4, 2),
(4, 5),
(4, 3),
(5, 1),
(5, 2),
(5, 4),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 6),
(6, 8),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 9),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 9),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 7),
(9, 11),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 10),
(10, 11),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 7),
(11, 11),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 7),
(12, 11),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 10),
(13, 11),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 10),
(14, 11),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 7),
(15, 11),
(16, 1),
(16, 2),
(16, 3),
(16, 5),
(16, 7),
(17, 1),
(17, 2),
(17, 3),
(17, 5),
(17, 9),
(17, 11),
(18, 1),
(18, 2),
(18, 3),
(18, 5),
(18, 10),
(18, 11),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 7),
(20, 1),
(20, 2),
(20, 3),
(20, 5),
(20, 6),
(20, 7),
(20, 8);


select * from centerMaterials;

Delimiter $$

-- --sp for getting accepted materials by centers.id
CREATE PROCEDURE spcenterMaterials (recycleCenters_id int)
BEGIN 
	select materials.id, materials.name from materials
	join centerMaterials on centerMaterials.materialsid = materials.id 
	where centerMaterials.centerid = recycleCenters_id;
END $$
Delimiter ;

CALL spcenterMaterials(20);


select * from recycleCenters rc
join materials m on m.id = rc.materialsid;

select * from recycleCenters rc
join county  c on c.id = rc.countyid;

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Wombo Materials','123 applebottom dr','10 - 8 M-F', 1, 1)
;

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('AEC Recycling Center Avondale','4330 1st Ave S 35222','M-F 7-6, SS 8-5', 1, [])
;

insert into materials (name)
values('Aluminum Cans'),
('Mixed Papers'),
('Metal Food Cans'),
('Plastics 1 & 2'),
('Plastics 1 - 7'),
('Batteries'),
('Scrap Metal'),
('Glass'),
('Electronics'),
('Cork'),
('Clothing/Textiles')
;

insert into county (name)
values('Jefferson'),
('Shelby')
;

select recycleCenters.name, county.id from recycleCenters, county;

select * from  materials;

select * from  centerMaterials;

select * from recycleCenters;

select recycleCenters.id, recycleCenters.name, recycleCenters.addr, recycleCenters.hours, materials.name as materials from recycleCenters, materials;

select recycleCenters.id, recycleCenters.name, recycleCenters.addr, recycleCenters.hours  from recycleCenters;


insert into recycleCenters (name, addr, hours, countyid)
values('AEC Recycling Center Avondale','4330 1st Avenue South, Birmingham 35222','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('Remlap Recycling Center','14064 AL-75, Remlap, AL 35133','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('Bessemer North Recycling Center','1423 1st Ave N, Bessemer, AL 35020','M-F 10:00am - 5:00pm', 1 );

insert into recycleCenters (name, addr, hours, countyid)
values('Gardendale Recycling Center', '325 Main St, Gardendale, AL 35071','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1);
       
insert into recycleCenters (name, addr, hours, countyid)
values('Adamsville Recycling Center','3608 Old Jasper Hwy, Adamsville, AL 35005','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('East Recycling Center','2920 41st St S, Birmingham, AL 35222','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 1);
       
insert into recycleCenters (name, addr, hours, countyid)
values('Irondale City Recycling ','1600 Montclair Rd, Birmingham, AL 35210','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('North Recycling Center','1933 Vanderbilt Rd, Birmingham, AL 35234','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('Leeds Recycling Center','8551 Whitfield Ave, Leeds, AL 35094','Hours: M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('Bessemer West Recycling Center','1601 1st Ave N, Bessemer, AL 35020','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1);


insert into recycleCenters (name, addr, hours, countyid)
values('Fairfield Recycling','7201 Aaron Aronov Dr, Fairfield, AL 35064','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('Pinson Recycling Center','6147 Sunrise Dr, Pinson, AL 35126','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1);

insert into recycleCenters (name, addr, hours, countyid)
values('Cahaba Park Recycling Center','5458 Cahaba Valley Rd, Birmingham, AL 35242','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2);

insert into recycleCenters (name, addr, hours, countyid)
values('Columbiana Recycling Center','20321 AL-25, Columbiana, AL 35051','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 2);

insert into recycleCenters (name, addr, hours, countyid)
values('Cropwell Recycling Center','7890 US-231, Cropwell, AL 35054','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2);

insert into recycleCenters (name, addr, hours, countyid)
values('Pelham Recycling Center','656 Stuart Ln, Pelham, AL 35124','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 2);

insert into recycleCenters (name, addr, hours, countyid)
values('Montevallo Recycle Center','1120 Overland Rd, Montevallo, AL 35115',' M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 2);

<<<<<<< HEAD
insert into recycleCenters (name, addr, hours, countyid)
values('Alabaster Recycling Center','22 Shady Acres Rd, Alabaster, AL 35007',' M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2);
=======
insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Alabaster Recycling Center','22 Shady Acres Rd, Alabaster, AL 35007',' M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2, ? );

insert into centerMaterials (centerid, materialsid)
values('1', '1');
insert into centerMaterials (centerid, materialsid)
values('1', '2');
insert into centerMaterials (centerid, materialsid)
values('1', '3');
insert into centerMaterials (centerid, materialsid)
values('1', '4');
insert into centerMaterials (centerid, materialsid)
values('1', '5');
insert into centerMaterials (centerid, materialsid)
values('1', '6');
insert into centerMaterials (centerid, materialsid)
values('1', '7');
insert into centerMaterials (centerid, materialsid)
values('1', '8');
insert into centerMaterials (centerid, materialsid)
values('1', '9');
insert into centerMaterials (centerid, materialsid)
values('1', '10');
insert into centerMaterials (centerid, materialsid)
values('1', '11');


insert into centerMaterials (centerid, materialsid)
values('2', '1');
insert into centerMaterials (centerid, materialsid)
values('2', '2');
insert into centerMaterials (centerid, materialsid)
values('2', '3');
insert into centerMaterials (centerid, materialsid)
values('2', '4');
insert into centerMaterials (centerid, materialsid)
values('2', '5');
insert into centerMaterials (centerid, materialsid)
values('2', '6');
insert into centerMaterials (centerid, materialsid)
values('2', '7');
insert into centerMaterials (centerid, materialsid)
values('2', '8');
insert into centerMaterials (centerid, materialsid)
values('2', '9');
insert into centerMaterials (centerid, materialsid)
values('2', '10');
insert into centerMaterials (centerid, materialsid)
values('2', '11');

insert into centerMaterials (centerid, materialsid)
values('3', '1');
insert into centerMaterials (centerid, materialsid)
values('3', '2');
insert into centerMaterials (centerid, materialsid)
values('3', '3');
insert into centerMaterials (centerid, materialsid)
values('3', '4');
insert into centerMaterials (centerid, materialsid)
values('3', '5');
insert into centerMaterials (centerid, materialsid)
values('3', '6');
insert into centerMaterials (centerid, materialsid)
values('3', '7');
insert into centerMaterials (centerid, materialsid)
values('3', '8');
insert into centerMaterials (centerid, materialsid)
values('3', '9');
insert into centerMaterials (centerid, materialsid)
values('3', '10');
insert into centerMaterials (centerid, materialsid)
values('3', '11');

insert into centerMaterials (centerid, materialsid)
values('4', '1');
insert into centerMaterials (centerid, materialsid)
values('4', '2');
insert into centerMaterials (centerid, materialsid)
values('4', '3');
insert into centerMaterials (centerid, materialsid)
values('4', '4');
insert into centerMaterials (centerid, materialsid)
values('4', '5');
insert into centerMaterials (centerid, materialsid)
values('4', '6');
insert into centerMaterials (centerid, materialsid)
values('4', '7');
insert into centerMaterials (centerid, materialsid)
values('4', '8');
insert into centerMaterials (centerid, materialsid)
values('4', '9');
insert into centerMaterials (centerid, materialsid)
values('4', '10');
insert into centerMaterials (centerid, materialsid)
values('4', '11');

insert into centerMaterials (centerid, materialsid)
values('5', '1');
insert into centerMaterials (centerid, materialsid)
values('5', '2');
insert into centerMaterials (centerid, materialsid)
values('5', '3');
insert into centerMaterials (centerid, materialsid)
values('5', '4');
insert into centerMaterials (centerid, materialsid)
values('5', '5');
insert into centerMaterials (centerid, materialsid)
values('5', '6');
insert into centerMaterials (centerid, materialsid)
values('5', '7');
insert into centerMaterials (centerid, materialsid)
values('5', '8');
insert into centerMaterials (centerid, materialsid)
values('5', '9');
insert into centerMaterials (centerid, materialsid)
values('5', '10');
insert into centerMaterials (centerid, materialsid)
values('5', '11');

insert into centerMaterials (centerid, materialsid)
values('6', '1');
insert into centerMaterials (centerid, materialsid)
values('6', '2');
insert into centerMaterials (centerid, materialsid)
values('6', '3');
insert into centerMaterials (centerid, materialsid)
values('6', '4');
insert into centerMaterials (centerid, materialsid)
values('6', '5');
insert into centerMaterials (centerid, materialsid)
values('6', '6');
insert into centerMaterials (centerid, materialsid)
values('6', '7');
insert into centerMaterials (centerid, materialsid)
values('6', '8');
insert into centerMaterials (centerid, materialsid)
values('6', '9');
insert into centerMaterials (centerid, materialsid)
values('6', '10');
insert into centerMaterials (centerid, materialsid)
values('6', '11');

insert into centerMaterials (centerid, materialsid)
values('7', '1');
insert into centerMaterials (centerid, materialsid)
values('7', '2');
insert into centerMaterials (centerid, materialsid)
values('7', '3');
insert into centerMaterials (centerid, materialsid)
values('7', '4');
insert into centerMaterials (centerid, materialsid)
values('7', '5');
insert into centerMaterials (centerid, materialsid)
values('7', '6');
insert into centerMaterials (centerid, materialsid)
values('7', '7');
insert into centerMaterials (centerid, materialsid)
values('7', '8');
insert into centerMaterials (centerid, materialsid)
values('7', '9');
insert into centerMaterials (centerid, materialsid)
values('7', '10');
insert into centerMaterials (centerid, materialsid)
values('7', '11');

insert into centerMaterials (centerid, materialsid)
values('8', '1');
insert into centerMaterials (centerid, materialsid)
values('8', '2');
insert into centerMaterials (centerid, materialsid)
values('8', '3');
insert into centerMaterials (centerid, materialsid)
values('8', '4');
insert into centerMaterials (centerid, materialsid)
values('8', '5');
insert into centerMaterials (centerid, materialsid)
values('8', '6');
insert into centerMaterials (centerid, materialsid)
values('8', '7');
insert into centerMaterials (centerid, materialsid)
values('8', '8');
insert into centerMaterials (centerid, materialsid)
values('8', '9');
insert into centerMaterials (centerid, materialsid)
values('8', '10');
insert into centerMaterials (centerid, materialsid)
values('8', '11');

insert into centerMaterials (centerid, materialsid)
values('9', '1');
insert into centerMaterials (centerid, materialsid)
values('9', '2');
insert into centerMaterials (centerid, materialsid)
values('9', '3');
insert into centerMaterials (centerid, materialsid)
values('9', '4');
insert into centerMaterials (centerid, materialsid)
values('9', '5');
insert into centerMaterials (centerid, materialsid)
values('9', '6');
insert into centerMaterials (centerid, materialsid)
values('9', '7');
insert into centerMaterials (centerid, materialsid)
values('9', '8');
insert into centerMaterials (centerid, materialsid)
values('9', '9');
insert into centerMaterials (centerid, materialsid)
values('9', '10');
insert into centerMaterials (centerid, materialsid)
values('9', '11');

insert into centerMaterials (centerid, materialsid)
values('10', '1');
insert into centerMaterials (centerid, materialsid)
values('10', '2');
insert into centerMaterials (centerid, materialsid)
values('10', '3');
insert into centerMaterials (centerid, materialsid)
values('10', '4');
insert into centerMaterials (centerid, materialsid)
values('10', '5');
insert into centerMaterials (centerid, materialsid)
values('10', '6');
insert into centerMaterials (centerid, materialsid)
values('10', '7');
insert into centerMaterials (centerid, materialsid)
values('10', '8');
insert into centerMaterials (centerid, materialsid)
values('10', '9');
insert into centerMaterials (centerid, materialsid)
values('10', '10');
insert into centerMaterials (centerid, materialsid)
values('10', '11');

insert into centerMaterials (centerid, materialsid)
values('11', '1');
insert into centerMaterials (centerid, materialsid)
values('11', '2');
insert into centerMaterials (centerid, materialsid)
values('11', '3');
insert into centerMaterials (centerid, materialsid)
values('11', '4');
insert into centerMaterials (centerid, materialsid)
values('11', '5');
insert into centerMaterials (centerid, materialsid)
values('11', '6');
insert into centerMaterials (centerid, materialsid)
values('11', '7');
insert into centerMaterials (centerid, materialsid)
values('11', '8');
insert into centerMaterials (centerid, materialsid)
values('11', '9');
insert into centerMaterials (centerid, materialsid)
values('11', '10');
insert into centerMaterials (centerid, materialsid)
values('11', '11');


insert into centerMaterials (centerid, materialsid)
values('12', '1');
insert into centerMaterials (centerid, materialsid)
values('12', '2');
insert into centerMaterials (centerid, materialsid)
values('12', '3');
insert into centerMaterials (centerid, materialsid)
values('12', '4');
insert into centerMaterials (centerid, materialsid)
values('12', '5');
insert into centerMaterials (centerid, materialsid)
values('12', '6');
insert into centerMaterials (centerid, materialsid)
values('12', '7');
insert into centerMaterials (centerid, materialsid)
values('12', '8');
insert into centerMaterials (centerid, materialsid)
values('12', '9');
insert into centerMaterials (centerid, materialsid)
values('12', '10');
insert into centerMaterials (centerid, materialsid)
values('12', '11');


insert into centerMaterials (centerid, materialsid)
values('13', '1');
insert into centerMaterials (centerid, materialsid)
values('13', '2');
insert into centerMaterials (centerid, materialsid)
values('13', '3');
insert into centerMaterials (centerid, materialsid)
values('13', '4');
insert into centerMaterials (centerid, materialsid)
values('13', '5');
insert into centerMaterials (centerid, materialsid)
values('13', '6');
insert into centerMaterials (centerid, materialsid)
values('13', '7');
insert into centerMaterials (centerid, materialsid)
values('13', '8');
insert into centerMaterials (centerid, materialsid)
values('13', '9');
insert into centerMaterials (centerid, materialsid)
values('13', '10');
insert into centerMaterials (centerid, materialsid)
values('13', '11');

insert into centerMaterials (centerid, materialsid)
values('14', '1');
insert into centerMaterials (centerid, materialsid)
values('14', '2');
insert into centerMaterials (centerid, materialsid)
values('14', '3');
insert into centerMaterials (centerid, materialsid)
values('14', '4');
insert into centerMaterials (centerid, materialsid)
values('14', '5');
insert into centerMaterials (centerid, materialsid)
values('14', '6');
insert into centerMaterials (centerid, materialsid)
values('14', '7');
insert into centerMaterials (centerid, materialsid)
values('14', '8');
insert into centerMaterials (centerid, materialsid)
values('14', '9');
insert into centerMaterials (centerid, materialsid)
values('14', '10');
insert into centerMaterials (centerid, materialsid)
values('14', '11');

insert into centerMaterials (centerid, materialsid)
values('15', '1');
insert into centerMaterials (centerid, materialsid)
values('15', '2');
insert into centerMaterials (centerid, materialsid)
values('15', '3');
insert into centerMaterials (centerid, materialsid)
values('15', '4');
insert into centerMaterials (centerid, materialsid)
values('15', '5');
insert into centerMaterials (centerid, materialsid)
values('15', '6');
insert into centerMaterials (centerid, materialsid)
values('15', '7');
insert into centerMaterials (centerid, materialsid)
values('15', '8');
insert into centerMaterials (centerid, materialsid)
values('15', '9');
insert into centerMaterials (centerid, materialsid)
values('15', '10');
insert into centerMaterials (centerid, materialsid)
values('15', '11');

insert into centerMaterials (centerid, materialsid)
values('17', '1');
insert into centerMaterials (centerid, materialsid)
values('17', '2');
insert into centerMaterials (centerid, materialsid)
values('17', '3');
insert into centerMaterials (centerid, materialsid)
values('17', '4');
insert into centerMaterials (centerid, materialsid)
values('17', '5');
insert into centerMaterials (centerid, materialsid)
values('17', '6');
insert into centerMaterials (centerid, materialsid)
values('17', '7');
insert into centerMaterials (centerid, materialsid)
values('17', '8');
insert into centerMaterials (centerid, materialsid)
values('17', '9');
insert into centerMaterials (centerid, materialsid)
values('17', '10');
insert into centerMaterials (centerid, materialsid)
values('17', '11');

insert into centerMaterials (centerid, materialsid)
values('18', '1');
insert into centerMaterials (centerid, materialsid)
values('18', '2');
insert into centerMaterials (centerid, materialsid)
values('18', '3');
insert into centerMaterials (centerid, materialsid)
values('18', '4');
insert into centerMaterials (centerid, materialsid)
values('18', '5');
insert into centerMaterials (centerid, materialsid)
values('18', '6');
insert into centerMaterials (centerid, materialsid)
values('18', '7');
insert into centerMaterials (centerid, materialsid)
values('18', '8');
insert into centerMaterials (centerid, materialsid)
values('18', '9');
insert into centerMaterials (centerid, materialsid)
values('18', '10');
insert into centerMaterials (centerid, materialsid)
values('18', '11');
>>>>>>> 93ef73501c9787b60de8df0a57b59fbe4e38815d
