--Najdi speedcubery, kteří organizovali soutěž 'AZCubing Winter 2020'.

--RA
/* 
{{organizator<organizator.id_speedcuber = turnaj.id_hlavniorg]turnaj(nazev = 'AZCubing Winter 2020')}*>speedcuber}
∪
{{organizator<organizator.id_speedcuber = turnaj.id_vedlejsiorg]turnaj(nazev = 'AZCubing Winter 2020')}*>speedcuber}
*/

--SQL
(select speedcuber.* 
from speedcuber join organizator using (id_speedcuber) 
join turnaj on (id_speedcuber = id_hlavniorg)
where turnaj.nazev = 'AZCubing Winter 2020')
union
(select speedcuber.* 
from speedcuber join organizator using (id_speedcuber) 
join turnaj on (id_speedcuber = id_vedlejsiorg)
where turnaj.nazev = 'AZCubing Winter 2020')