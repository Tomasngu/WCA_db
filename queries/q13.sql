-- Najdi soutěže, které měly počet účastníků vyšší než 15 (nepočítáme účastníky, kteří nedali validní čas) a seřaď je sestupně podle počtu účastníků.

--SQL
select count(*) as pocet_ucastniku, nazev
from ucast join turnaj using (id_turnaj) 
where cas is not null
group by nazev, id_turnaj
having count(*) > 15 
order by count(*) desc
