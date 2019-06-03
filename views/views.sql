/*create views*/

/*view used for showing result after search*/
CREATE VIEW brief_result AS
SELECT jmdict.keb, jmdict.reb, gloss.gloss_def
FROM  gloss_word
LEFT JOIN gloss 
ON gloss_word.gloss_ID = gloss.gloss_ID
LEFT JOIN jmdict 
ON gloss_word.ent_seq = jmdict.ent_seq
ORDER BY gloss_word.ent_seq;

SELECT * FROM brief_result;

