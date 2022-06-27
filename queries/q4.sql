--Speedcuber, který se účastnil všech soutěží.

--RA
/* 
{speedcuber*>pouziti*ucast}[id_speedcuber,id_turnaj]÷turnaj[id_turnaj]*speedcuber
*/

--SQL
select * from speedcuber where not exists (
    select * from turnaj where not exists(
        select * from pouziti join ucast using (id_pouziti) 
        where pouziti.id_speedcuber = speedcuber.id_speedcuber and ucast.id_turnaj = turnaj.id_turnaj  
    )
);
