-- Odstraň všechny elitní speedcubery, kteří jsou zároveň organizátory.

--SQL
begin;
select count(*) from elita;
delete from speedcuber where id_speedcuber in (select id_speedcuber from elita where id_speedcuber in (select id_speedcuber from organizator));
select count(*) from elita;
rollback;
