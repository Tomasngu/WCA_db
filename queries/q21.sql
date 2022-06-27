-- Kvůli vysoké inflaci zvyš cenu, kterou si účtují organizátoři z České Republiky( 'Czech Republic') na dvojnásobek

--SQL
begin;
select * from organizator;
update organizator set cena=cena*2
where id_speedcuber in(select id_speedcuber from speedcuber join stat using(id_stat) where stat.nazev = 'Czech Republic' );
select * from organizator
rollback;
