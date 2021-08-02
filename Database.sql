CREATE SCHEMA recycle;
USE recycle;

DROP TABLE recycleCenters;

CREATE TABLE recycleCenters (
	id INT  NOT NULL AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL,
    addr VARCHAR(75) NOT NULL,
    hours VARCHAR(75) NOT NULL,
    countyid int not null,
    materialsid int not null,
    _created TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id),
	FOREIGN KEY (materialsid) REFERENCES materials(id),
    Foreign key (countyid) references county(id)
);

drop table materials;

CREATE TABLE materials (
id int not null auto_increment not null,
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

create table centerMaterials (
centerid INT not null,
materialsid INT not null,
primary key(centerid, materialsid),
FOREIGN KEY (centerid) REFERENCES recycleCenters(id),
FOREIGN KEY (materialsid) REFERENCES materials(id)
);

select * from centerMaterials;

Delimiter $$

CREATE PROCEDURE spcenterMaterials (recycleCenters_id int)
BEGIN 
	select materials.id, materials.name from centerMaterials
	join materials m on m.id = centerMaterials.materialsid
	where recycleCentersid = recycleCenters_id;
END $$
Delimiter ;

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
