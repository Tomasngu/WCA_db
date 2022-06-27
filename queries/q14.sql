-- Vypiš nejlepší čas dle použité kostky.

--SQL
select jmeno as jmeno_kostky, min(cas) as nejlepsi_cas
from kostka join pouziti using(id_kostka) join ucast using(id_pouziti)
group by id_kostka, jmeno
order by min(cas);