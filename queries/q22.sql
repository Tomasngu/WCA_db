-- Ke každému speedcuberovi vypiš jeho osobní rekord (nejlepší čas, který dal na turnaji). Pokud se nikdy turnaje neúčastnil nebo z něj nemá čas, tak vypiš 'NESOUTEZIL'. Výsledek seřaď dle nejlepšího času.

--SQL
select id_speedcuber, jmeno, prijmeni, coalesce(to_char(min(cas), '99D9'), 'NESOUTEZIL') as nejlepsi_cas
from speedcuber left join pouziti using(id_speedcuber) left join ucast using(id_pouziti)
group by id_speedcuber, jmeno, prijmeni
order by nejlepsi_cas;
