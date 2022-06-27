--Speedcuber, který se zatím neúčastnil žádné soutěže.

--RA
/* 
speedcuber!<*{pouziti*ucast} 
*/

--SQL
select * 
from speedcuber
except
(
select speedcuber.* 
from speedcuber join pouziti using(id_speedcuber) join ucast using(id_pouziti)
)
