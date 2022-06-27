-- Pro každého speedcubera vypiš datum první soutěže, které se účastnil. Pokud se nikdy žádné neúčastnil, tak se vypíše 'NEUCASTNIL'.

--SQL
select s.id_speedcuber, s.jmeno, s.prijmeni,
coalesce(to_char(min(datum), 'YYYY-MM-DD' ), 'NEUCASTNIL') as datum_prvni_souteze
from speedcuber s left join pouziti using(id_speedcuber) left join ucast using(id_pouziti) left join turnaj using(id_turnaj)
group by s.id_speedcuber, s.jmeno, s.prijmeni
order by s.id_speedcuber;