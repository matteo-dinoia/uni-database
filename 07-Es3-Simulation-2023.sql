create table SERIETV(NomeSerie varchar(20), Produttore varchar(20), Nazione varchar(20), Genere varchar(20));
create table EPISODIO(NomeSerie varchar(20),  Stagione varchar(20),  Episodio numeric(6),  TitoloEpisodio varchar(20),  Regista varchar(20),  Anno numeric(4));
create table AUDIO( NomeSerie varchar(20),  Stagione varchar(20),  Episodio numeric(6),  Lingua varchar(20),  Originale boolean);
create table SOTTOTITOLI( NomeSerie varchar(20),  Stagione varchar(20),  Episodio numeric(6), Lingua varchar(20));

with Regista as (
	select distinct ep.regista, count(*) numEp from episodio ep
		join serieTV se on se.nomeSerie=ep.nomeserie and se.produttore = ep.regista
	group by ep.regista
	having ep.regista not in (select distinct ep.regista from episodio ep 
		join serieTV se on se.nomeSerie=ep.nomeserie and se.nazione <> 'Germania')
)
select * from Regista R1
	where R1.numEp >= (select max(R2.numEp) from Regista R2);