-- Vlož 5 náhodných účastí náhodných použití v náhodném turnaji. Čas musí být náhodný zaokrouhlený na 1 desetinné místo.

--SQL
begin;
select count(*) from ucast;

insert into ucast(
    select * from(
        select id_turnaj, id_pouziti, round(cast(random()*15+4.5 as numeric),1)  as cas
        from pouziti cross join turnaj
    )ins
    where (id_turnaj, id_pouziti) not in (select id_turnaj, id_pouziti from ucast)
    order by random() limit 5
);

select count(*) from ucast;
rollback;
select count(*) from ucast
