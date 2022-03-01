Select updateGeometrySRID('buildings_final','geom',4326)
Select updateGeometrySRID('points','geom',4326)
Select updateGeometrySRID('railways','geom',4326)
Select updateGeometrySRID('roads','geom',4326)

select st_srid(geom) from buildings_final
select st_srid(geom) from points
select st_srid(geom) from railways
select st_srid(geom) from roads

SELECT build.name from buildings_final as build, roads as r where ST_DWithin(r.geom, build.geom,20) and build.name ='CNDH'

select * from buildings_final
select name from buildings_final where prix_ven > 300000

SELECT ST_Distance(
		'SRID=4326;POINT(-6.8458469 34.0274952)'::geometry,
		'SRID=4326;LINESTRING(-6.8513074 33.9867455, -6.8517675 33.9867421)'::geometry
	);

SELECT *, ST_IsValidDetail(geom)
FROM   buildings_final
WHERE ST_IsValid(geom) = false;

SELECT *
FROM   buildings_final
WHERE ST_Area(geom) = (SELECT MAX(ST_Area(GEOM)) FROM   buildings_final);


SELECT name, SUM(ST_Length(GEOM)) / 1000 AS LONGUEUR_KM
FROM   roads
WHERE name <> 'null'
GROUP BY name



