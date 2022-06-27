--Speedcuber, který skládal pouze s kostkou 'Weilong WRM'.

--RA
/* 
{{pouziti*kostka(jmeno = 'Weilong WRM')}[pouziti.id_speedcuber=speedcuber.id_speedcuber>speedcuber}
\
{{pouziti*kostka(jmeno != 'Weilong WRM')}[pouziti.id_speedcuber=speedcuber.id_speedcuber>speedcuber}
*/

--SQL
select speedcuber.*
from pouziti join kostka using(id_kostka) join speedcuber using(id_speedcuber)
where kostka.jmeno = 'Weilong WRM'
except 
select speedcuber.*
from pouziti join kostka using(id_kostka) join speedcuber using(id_speedcuber)
where kostka.jmeno != 'Weilong WRM';
