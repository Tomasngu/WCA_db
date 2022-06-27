--Turnaje, které se konaly dříve než  '2019-10-19' a měli nějakého sponzora

--RA
/* 
turnaj(datum < '2019-10-19')<*turnaj_sponzor
*/

--SQL
select distinct turnaj.*
from turnaj join turnaj_sponzor using(id_turnaj)
where datum < '2019-10-19'
