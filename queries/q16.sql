-- Vyber všechny turnaje a sponzory a uveď, kým byl daný turnaj sponzorován. (Pokud nebyl nikým, tak vypiš 'BEZ SPONZORA', pokud sponzor nikoho nesponzoroval, tak se vypíše 'NESPONZOROVAL')

--SQL
select distinct coalesce(turnaj.nazev, 'NESPONZOROVAL') as nazev_turnaje, coalesce(sponzor.nazev, 'BEZ SPONZORA') as sponzor
from turnaj left join turnaj_sponzor using(id_turnaj) full outer join sponzor using(id_sponzor);