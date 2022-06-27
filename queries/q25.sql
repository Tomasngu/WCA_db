-- Oddělení diverzity organizace WCA chce vědět počet speedcuberů, kteří se identifikují jako daný gender.
V případě prázdného sloupce vypište 'NEUVEDL'.

--SQL
select coalesce(pohlavi,'NEUVEDL') as gender, count(*) as pocet
from speedcuber
group by pohlavi
order by pocet desc