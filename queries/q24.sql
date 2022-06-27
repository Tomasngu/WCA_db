-- Zjisti id, jméno a příjmení světového rekordmana (speedcuber, co dal nejnižší čas) a čas, za který kostku složil.

--SQL
select id_speedcuber, jmeno, prijmeni, cas
from speedcuber join pouziti using (id_speedcuber) join ucast using(id_pouziti)
order by cas
limit 1;