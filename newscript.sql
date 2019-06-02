DROP DATABASE main_db;
CREATE DATABASE main_db;
USE main_db;

CREATE TABLE IF NOT EXISTS JMdict(
ent_seq INT NOT NULL,    #unique identifier
keb NVARCHAR(250),                      #kanji
reb NVARCHAR(250),                      #hiragana or katakana
is_foreign BOOLEAN,
CONSTRAINT PK_JMdict PRIMARY KEY (ent_seq) 
);

CREATE TABLE IF NOT EXISTS gloss
(gloss_ID VARCHAR(36) NOT NULL, gloss_def NVARCHAR(300), 
CONSTRAINT PK_gloss PRIMARY KEY (gloss_ID) );

CREATE TABLE IF NOT EXISTS gloss_word
(ent_seq INT NOT NULL, gloss_ID VARCHAR(36) NOT NULL,
CONSTRAINT PK_gloss_word PRIMARY KEY (ent_seq, gloss_ID) );

CREATE TABLE IF NOT EXISTS list
(list_name NVARCHAR(200) NOT NULL, list_description NVARCHAR(2000),
CONSTRAINT PK_list PRIMARY KEY (list_name) );

CREATE TABLE IF NOT EXISTS list_word
(ent_seq INT NOT NULL, list_name VARCHAR(36) NOT NULL,
CONSTRAINT PK_list_word PRIMARY KEY (list_name) );

CREATE TABLE IF NOT EXISTS pos(
pos_ID VARCHAR(36) NOT NULL, 
pos_type NVARCHAR(100),
CONSTRAINT PK_pos PRIMARY KEY (pos_ID)
);


CREATE TABLE IF NOT EXISTS pos_word(
ent_seq INT NOT NULL, 
pos_ID VARCHAR(36) NOT NULL,
CONSTRAINT PK_pos_word PRIMARY KEY (ent_seq, pos_ID) 
);

CREATE TABLE IF NOT EXISTS JMdict_foreign(
ent_seq INT NOT NULL,
orig_lang NVARCHAR(200),
orig_word NVARCHAR(200),
waseieigo NVARCHAR(9),
CONSTRAINT PK_JMdict_foreign PRIMARY KEY (ent_seq)
);



ALTER TABLE pos_word
ADD FOREIGN KEY (ent_seq) REFERENCES JMdict(ent_seq);
ALTER TABLE pos_word
ADD FOREIGN KEY (pos_ID) REFERENCES pos(pos_ID);

ALTER TABLE gloss_word
ADD FOREIGN KEY (ent_seq) REFERENCES JMdict(ent_seq);
ALTER TABLE gloss_word
ADD FOREIGN KEY (gloss_ID) REFERENCES gloss(gloss_ID);

ALTER TABLE list_word
ADD FOREIGN KEY (ent_seq) REFERENCES JMdict(ent_seq);
ALTER TABLE list_word
ADD FOREIGN KEY (list_ID) REFERENCES list(list_ID);





