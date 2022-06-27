--Najít všechny speedcuberky z Polska.

--RA
/* 
stat(nazev='Poland')*>speedcuber(pohlavi='Female')
*/

--SQL
select speedcuber.* 
from speedcuber join stat
using (id_stat)
where speedcuber.pohlavi = 'Female' AND stat.nazev = 'Poland'