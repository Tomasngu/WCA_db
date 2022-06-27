--Najít speedcubery, kteří nejsou organizátoři.

--RA
/* 
speedcuber!<*organizator
*/

--SQL
select * 
from speedcuber
where not exists
(select * from organizator where speedcuber.id_speedcuber = organizator.id_speedcuber);

select * 
from speedcuber
where id_speedcuber not in (select id_speedcuber from organizator);

select * from speedcuber
except
(
select speedcuber.* 
from speedcuber join organizator using(id_speedcuber)
);