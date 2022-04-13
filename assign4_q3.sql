
CREATE TABLE assign4800.Instrument (
                instrument_name VARCHAR NOT NULL,
                pitch VARCHAR NOT NULL,
                CONSTRAINT instrument_pk PRIMARY KEY (instrument_name)
);


CREATE TABLE assign4800.Address (
                address_id INTEGER NOT NULL,
                city VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                number INTEGER NOT NULL,
                Street1 VARCHAR NOT NULL,
                Street2 VARCHAR NOT NULL,
                telephone VARCHAR NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (address_id)
);


CREATE TABLE assign4800.Musician (
                ssn VARCHAR NOT NULL,
                addressID_fk INTEGER NOT NULL,
                musician_name VARCHAR NOT NULL,
                CONSTRAINT musician_pk PRIMARY KEY (ssn)
);


CREATE TABLE assign4800.Album (
                album_id INTEGER NOT NULL,
                ssn VARCHAR NOT NULL,
                age VARCHAR NOT NULL,
                format VARCHAR NOT NULL,
                release_date VARCHAR NOT NULL,
                album_title VARCHAR NOT NULL,
                CONSTRAINT album_pk PRIMARY KEY (album_id)
);


CREATE TABLE assign4800.Song (
                song_title VARCHAR NOT NULL,
                album_id_fk INTEGER NOT NULL,
                ssn_fk VARCHAR NOT NULL,
                length INTEGER NOT NULL,
                CONSTRAINT song_pk PRIMARY KEY (song_title)
);


CREATE TABLE assign4800.UsedIn (
                instrument_name_fk VARCHAR NOT NULL,
                song_title_fk VARCHAR NOT NULL,
                CONSTRAINT usedin_pk PRIMARY KEY (instrument_name_fk, song_title_fk)
);


CREATE TABLE assign4800.Performs (
                ssn_fk VARCHAR NOT NULL,
                title_fk VARCHAR NOT NULL,
                CONSTRAINT performs_pk PRIMARY KEY (ssn_fk, title_fk)
);


CREATE TABLE assign4800.Plays (
                ssn_fk VARCHAR NOT NULL,
                instrument_name_fk VARCHAR NOT NULL,
                CONSTRAINT plays_pk PRIMARY KEY (ssn_fk, instrument_name_fk)
);


ALTER TABLE assign4800.Plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (instrument_name_fk)
REFERENCES assign4800.Instrument (instrument_name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.UsedIn ADD CONSTRAINT instrument_usedin_fk
FOREIGN KEY (instrument_name_fk)
REFERENCES assign4800.Instrument (instrument_name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (addressID_fk)
REFERENCES assign4800.Address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Plays ADD CONSTRAINT musician_plays_fk
FOREIGN KEY (ssn_fk)
REFERENCES assign4800.Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Performs ADD CONSTRAINT musician_performs_fk
FOREIGN KEY (ssn_fk)
REFERENCES assign4800.Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (ssn)
REFERENCES assign4800.Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (ssn_fk)
REFERENCES assign4800.Musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Song ADD CONSTRAINT album_song_fk
FOREIGN KEY (album_id_fk)
REFERENCES assign4800.Album (album_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.Performs ADD CONSTRAINT song_performs_fk
FOREIGN KEY (title_fk)
REFERENCES assign4800.Song (song_title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE assign4800.UsedIn ADD CONSTRAINT song_usedin_fk
FOREIGN KEY (song_title_fk)
REFERENCES assign4800.Song (song_title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
