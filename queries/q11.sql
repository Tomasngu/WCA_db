--Turnaje, které byly organizován(nebo spoluorganizován) speedcubery z Polska.

--RA
/* 
{turnaj[id_hlavniorg = id_speedcuber>speedcuber}<*stat(nazev = 'Poland')
∪
{turnaj[id_vedlejsiorg = id_speedcuber>speedcuber}<*stat(nazev = 'Poland')
*/

--SQL
(select distinct R1.*
from (
    select speedcuber.* 
    from speedcuber join turnaj 
    on turnaj.id_hlavniorg = speedcuber.id_speedcuber
    ) R1
join stat using (id_stat)
where stat.nazev = 'Poland')
union
(select distinct R1.*
from( 
    select speedcuber.* 
    from speedcuber join turnaj 
    on turnaj.id_vedlejsiorg = speedcuber.id_speedcuber
    ) R1
join stat using (id_stat)
where stat.nazev = 'Poland')


