CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
id INT NOT NULL auto_increment, 
name varchar(255) NOT NULL,
primary key(id)
);
CREATE TABLE albums (
id INT NOT NULL auto_increment,
name VARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO bands (name) 
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'),('Avenged Sevenfold'), ('Ankor');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name from bands;

SELECT id as 'ID', name as 'Band Name' 
From bands;
SELECT * FROM bands order by name asc;

INSERT INTO albums (name, release_year, band_id)
Values ('The Number of the Beasts', 1985,1),
('Power Slave', 1984,1),
('Nightmare',2018,2),
('Nightmare', 2010,3),
('Test album',NULL,3);

Select * from albums;
Select distinct name from albums;
update albums 
set release_year = 1982
WHERE ID=1;

Select * From albums 
where release_year <2000;

select * from albums 
where name like '%er%' or band_id = 2;


select * from albums 
where release_year = 1984 and band_id = 1;


select * from albums 
where release_year between 2000 and 2018;

select * from albums 
where release_year is null; 

delete from albums where id = 5;

select * from bands
join albums on bands.id = albums.band_id;

select * from bands
left join albums on bands.id = albums.band_id;

select * from bands
right join albums on bands.id = albums.band_id;

select count(release_year) from albums;

select band_id, count(band_id) from albums
group by band_id;

select b.name as band_name, count(a.id) as num_albums
from bands as b
left join albums as a on b.id = a.band_id
group by b.id;
