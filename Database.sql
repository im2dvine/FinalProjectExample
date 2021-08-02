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


insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('AEC Recycling Center Avondale','4330 1st Avenue South, Birmingham 35222','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 1, ?);

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Remlap Recycling Center','14064 AL-75, Remlap, AL 35133','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Bessemer North Recycling Center','1423 1st Ave N, Bessemer, AL 35020','M-F 10:00am - 5:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values(‘Gardendale Recycling Center’, '325 Main St, Gardendale, AL 35071','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1, ? );
       
insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Adamsville Recycling Center','3608 Old Jasper Hwy, Adamsville, AL 35005','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('East Recycling Center','2920 41st St S, Birmingham, AL 35222','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 1, ? );
       
insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Irondale City Recycling ','1600 Montclair Rd, Birmingham, AL 35210','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('North Recycling Center','1933 Vanderbilt Rd, Birmingham, AL 35234','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Leeds Recycling Center','8551 Whitfield Ave, Leeds, AL 35094','Hours: M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Bessemer West Recycling Center','1601 1st Ave N, Bessemer, AL 35020','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1, ? );


insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Fairfield Recycling','7201 Aaron Aronov Dr, Fairfield, AL 35064','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Pinson Recycling Center','6147 Sunrise Dr, Pinson, AL 35126','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 1, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Cahaba Park Recycling Center','5458 Cahaba Valley Rd, Birmingham, AL 35242','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Columbiana Recycling Center','20321 AL-25, Columbiana, AL 35051','M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 2, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Cropwell Recycling Center','7890 US-231, Cropwell, AL 35054','M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Pelham Recycling Center','656 Stuart Ln, Pelham, AL 35124','M-F 8:00am - 5:00pm, SS 10:00am - 3:00pm', 2, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Montevallo Recycle Center','1120 Overland Rd, Montevallo, AL 35115',' M-F 8:00am -7:00pm, SS 10:00am -5:00pm', 2, ? );

insert into recycleCenters (name, addr, hours, countyid, materialsid)
values('Alabaster Recycling Center','22 Shady Acres Rd, Alabaster, AL 35007',' M-F 7:00am - 6:00pm, SS 8:00am - 5:00pm', 2, ? );
