-- Najdi všechny speedcubery, kteří použili někdy aspoň 3 různé kostky.

--SQL
select id_speedcuber,jmeno, prijmeni, count(distinct id_pouziti) as pocet_pouzitych_kostek
from speedcuber left join pouziti using(id_speedcuber)
group by id_speedcuber, speedcuber.jmeno
having count(distinct id_pouziti) >= 3;