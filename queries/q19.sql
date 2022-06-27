-- Vytvoř pohled na elitu, což jsou speedcubeři, kteří někdy dali čas lepší než 6 sekund.

--SQL
create or replace view elita as(
    select speedcuber.*
    from speedcuber join pouziti using(id_speedcuber) join ucast using (id_pouziti)
    where cas < 6
);
select * from elita;
