--Speedcubeři, kteří se někdy účastnili turnaje v Česku.

--RA
/* 
{{{speedcuber*pouziti*ucast}*
{turnaj[turnaj.id_mesto = mesto.id_mesto]mesto[mesto.id_stat = stat.id_stat]stat(nazev = 'Czech Republic')*>turnaj}}
*>speedcuber[id_speedcuber]}*speedcuber
*/

--SQL
select distinct speedcuber.*
from speedcuber join pouziti using (id_speedcuber) join ucast using(id_pouziti) join turnaj using(id_turnaj)
where turnaj.id_turnaj in 
(select id_turnaj from turnaj join mesto using (id_mesto) join stat using (id_stat) where stat.nazev = 'Czech Republic')
order by id_speedcuber
