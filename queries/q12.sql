-- Spočítej, kolik by bylo potřeba vyrobit kostek, aby každý speedcuber měl každou kostku.

--SQL
select count(*) pocet_kostek_k_vyrobeni
from speedcuber cross join kostka;
