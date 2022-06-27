-- Remove conflicting tables
DROP TABLE IF EXISTS kostka CASCADE;
DROP TABLE IF EXISTS mesto CASCADE;
DROP TABLE IF EXISTS organizator CASCADE;
DROP TABLE IF EXISTS pouziti CASCADE;
DROP TABLE IF EXISTS speedcuber CASCADE;
DROP TABLE IF EXISTS sponzor CASCADE;
DROP TABLE IF EXISTS stat CASCADE;
DROP TABLE IF EXISTS turnaj CASCADE;
DROP TABLE IF EXISTS ucast CASCADE;
DROP TABLE IF EXISTS vyrobce CASCADE;
DROP TABLE IF EXISTS turnaj_sponzor CASCADE;
-- End of removing

CREATE TABLE kostka (
    id_kostka SERIAL NOT NULL,
    id_vyrobce INTEGER NOT NULL,
    jmeno VARCHAR(30) NOT NULL
);
ALTER TABLE kostka ADD CONSTRAINT pk_kostka PRIMARY KEY (id_kostka);

CREATE TABLE mesto (
    id_mesto SERIAL NOT NULL,
    id_stat INTEGER NOT NULL,
    nazev VARCHAR(50) NOT NULL
);
ALTER TABLE mesto ADD CONSTRAINT pk_mesto PRIMARY KEY (id_mesto);

CREATE TABLE organizator (
    id_speedcuber INTEGER NOT NULL,
    cena INTEGER NOT NULL,
    region VARCHAR(30) NOT NULL
);
ALTER TABLE organizator ADD CONSTRAINT pk_organizator PRIMARY KEY (id_speedcuber);

CREATE TABLE pouziti (
    id_pouziti SERIAL NOT NULL,
    id_kostka INTEGER NOT NULL,
    id_speedcuber INTEGER NOT NULL
);
ALTER TABLE pouziti ADD CONSTRAINT pk_pouziti PRIMARY KEY (id_pouziti);

CREATE TABLE speedcuber (
    id_speedcuber SERIAL NOT NULL,
    id_stat INTEGER NOT NULL,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL,
    datum_narozeni DATE NOT NULL,
    pohlavi VARCHAR(30)
);
ALTER TABLE speedcuber ADD CONSTRAINT pk_speedcuber PRIMARY KEY (id_speedcuber);

CREATE TABLE sponzor (
    id_sponzor SERIAL NOT NULL,
    nazev VARCHAR(30) NOT NULL,
    obnos INTEGER
);
ALTER TABLE sponzor ADD CONSTRAINT pk_sponzor PRIMARY KEY (id_sponzor);

CREATE TABLE stat (
    id_stat SERIAL NOT NULL,
    nazev VARCHAR(50) NOT NULL
);
ALTER TABLE stat ADD CONSTRAINT pk_stat PRIMARY KEY (id_stat);

CREATE TABLE turnaj (
    id_turnaj SERIAL NOT NULL,
    id_hlavniorg INTEGER NOT NULL,
    id_vedlejsiorg INTEGER NOT NULL,
    id_mesto INTEGER NOT NULL,
    nazev VARCHAR(50) NOT NULL,
    datum DATE NOT NULL
);
ALTER TABLE turnaj ADD CONSTRAINT pk_turnaj PRIMARY KEY (id_turnaj);

CREATE TABLE ucast (
    id_turnaj INTEGER NOT NULL,
    id_pouziti INTEGER NOT NULL,
    cas REAL
);
ALTER TABLE ucast ADD CONSTRAINT pk_ucast PRIMARY KEY (id_turnaj, id_pouziti);

CREATE TABLE vyrobce (
    id_vyrobce SERIAL NOT NULL,
    nazev VARCHAR(30) NOT NULL
);
ALTER TABLE vyrobce ADD CONSTRAINT pk_vyrobce PRIMARY KEY (id_vyrobce);

CREATE TABLE turnaj_sponzor (
    id_turnaj INTEGER NOT NULL,
    id_sponzor INTEGER NOT NULL
);
ALTER TABLE turnaj_sponzor ADD CONSTRAINT pk_turnaj_sponzor PRIMARY KEY (id_turnaj, id_sponzor);

ALTER TABLE kostka ADD CONSTRAINT fk_kostka_vyrobce FOREIGN KEY (id_vyrobce) REFERENCES vyrobce (id_vyrobce) ON DELETE CASCADE;

ALTER TABLE mesto ADD CONSTRAINT fk_mesto_stat FOREIGN KEY (id_stat) REFERENCES stat (id_stat) ON DELETE CASCADE;

ALTER TABLE organizator ADD CONSTRAINT fk_organizator_speedcuber FOREIGN KEY (id_speedcuber) REFERENCES speedcuber (id_speedcuber) ON DELETE CASCADE;

ALTER TABLE pouziti ADD CONSTRAINT fk_pouziti_kostka FOREIGN KEY (id_kostka) REFERENCES kostka (id_kostka) ON DELETE CASCADE;
ALTER TABLE pouziti ADD CONSTRAINT fk_pouziti_speedcuber FOREIGN KEY (id_speedcuber) REFERENCES speedcuber (id_speedcuber) ON DELETE CASCADE;

ALTER TABLE speedcuber ADD CONSTRAINT fk_speedcuber_stat FOREIGN KEY (id_stat) REFERENCES stat (id_stat) ON DELETE CASCADE;

ALTER TABLE turnaj ADD CONSTRAINT fk_turnaj_hlavniorg FOREIGN KEY (id_hlavniorg) REFERENCES organizator (id_speedcuber) ON DELETE CASCADE;
ALTER TABLE turnaj ADD CONSTRAINT fk_turnaj_vedlejsiorg FOREIGN KEY (id_vedlejsiorg) REFERENCES organizator (id_speedcuber) ON DELETE CASCADE;
ALTER TABLE turnaj ADD CONSTRAINT fk_turnaj_mesto FOREIGN KEY (id_mesto) REFERENCES mesto (id_mesto) ON DELETE CASCADE;
ALTER TABLE turnaj ADD CONSTRAINT org_check CHECK(turnaj.id_hlavniorg <> turnaj.id_vedlejsiorg);

ALTER TABLE ucast ADD CONSTRAINT fk_ucast_turnaj FOREIGN KEY (id_turnaj) REFERENCES turnaj (id_turnaj) ON DELETE CASCADE;
ALTER TABLE ucast ADD CONSTRAINT fk_ucast_pouziti FOREIGN KEY (id_pouziti) REFERENCES pouziti (id_pouziti) ON DELETE CASCADE;

ALTER TABLE turnaj_sponzor ADD CONSTRAINT fk_turnaj_sponzor_turnaj FOREIGN KEY (id_turnaj) REFERENCES turnaj (id_turnaj) ON DELETE CASCADE;
ALTER TABLE turnaj_sponzor ADD CONSTRAINT fk_turnaj_sponzor_sponzor FOREIGN KEY (id_sponzor) REFERENCES sponzor (id_sponzor) ON DELETE CASCADE;