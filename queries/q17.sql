-- Pro každou soutěž v databázi vypiš výherní čas.

--SQL
select id_turnaj, nazev, (select min(cas) from ucast where ucast.id_turnaj = turnaj.id_turnaj) as vyherni_cas 
from turnaj
order by vyherni_cas;