-- Kontrola dotazu D4 kategorie D1.

--SQL
select id_speedcuber from(
    select * from speedcuber where not exists (
        select * from turnaj where not exists(
            select * from pouziti join ucast using (id_pouziti)
            where pouziti.id_speedcuber = speedcuber.id_speedcuber and ucast.id_turnaj = turnaj.id_turnaj
        )
    )
)ans
where (select count(*) from turnaj) != (select count(distinct id_turnaj) from pouziti join ucast using(id_pouziti) where pouziti.id_speedcuber = ans.id_speedcuber);
