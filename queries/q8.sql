--Speedcubeři, kteří někdy používali kostku 'Zhanchi' nebo 'Weilong WRM',  ale nepouživali obě.

--RA
/* 
{{{pouziti*kostka(jmeno = 'Weilong WRM')}[pouziti.id_speedcuber=speedcuber.id_speedcuber>speedcuber}
∪
{{pouziti*kostka(jmeno = 'Zhanchi')}[pouziti.id_speedcuber=speedcuber.id_speedcuber>speedcuber}}
\
{{{pouziti*kostka(jmeno = 'Weilong WRM')}[pouziti.id_speedcuber=speedcuber.id_speedcuber>speedcuber}
∩
{{pouziti*kostka(jmeno = 'Zhanchi')}[pouziti.id_speedcuber=speedcuber.id_speedcuber>speedcuber}}
*/

--SQL
(select speedcuber.*
from pouziti join kostka using(id_kostka) join speedcuber using(id_speedcuber)
where kostka.jmeno = 'Weilong WRM'
union
select speedcuber.*
from pouziti join kostka using(id_kostka) join speedcuber using(id_speedcuber)
where kostka.jmeno = 'Zhanchi')
except
(select speedcuber.*
from pouziti join kostka using(id_kostka) join speedcuber using(id_speedcuber)
where kostka.jmeno = 'Weilong WRM'
intersect
select speedcuber.*
from pouziti join kostka using(id_kostka) join speedcuber using(id_speedcuber)
where kostka.jmeno = 'Zhanchi')



)
