USE main_db;
UPDATE pos SET pos_type = 'adjective (keiyoushi)' WHERE pos_type = '&adj-i;';
UPDATE pos SET pos_type = 'adjectival nouns or quasi-adjectives (keiyoudoushi)'
 WHERE pos_type = '&adj-na;';
UPDATE pos SET pos_type = '"shiku" adjective (archaic)'
WHERE pos_type = '&adj-shiku;';
UPDATE pos SET pos_type = 'auxilary' WHERE pos_type = '&aux;';
UPDATE pos SET pos_type = 'Expression (phrase, clause, etc.)' WHERE pos_type = '&exp;';
UPDATE pos SET pos_type = 'proper noun' WHERE pos_type = '&n-p;';
UPDATE pos SET pos_type = 'particle' WHERE pos_type = '&prt;';
UPDATE pos SET pos_type = 'Nidan verb (lower/upper) with "u" ending (archaic)'
WHERE pos_type = '&v2a-s;';
UPDATE pos SET pos_type = 'Nidan verb (lower/upper) with "ku" ending (archaic)' 
WHERE pos_type = '&v2k-k;';
SELECT * FROM pos WHERE pos_type = '&v5aru;';
UPDATE pos SET pos_type = 'Godan verb - -aru special class'
WHERE pos_type = '&v5aru;';
UPDATE pos SET pos_type = 'expression using the aux. verb suru' 
WHERE pos_type = '&vs-i;';
UPDATE pos SET pos_type = 'Ichidan verb - -zuru special class (alternative form of -jiru verbs)'
WHERE pos_type = '&vz;';
UPDATE pos SET pos_type = '"kari" adjective (archaic)' 
WHERE pos_type = '&adj-kari;';
UPDATE pos SET pos_type = '"taru" adjective' WHERE pos_type = '&adj-t;';
UPDATE pos SET pos_type = 'auxiliary verb' WHERE pos_type = '&aux-v;';
UPDATE pos SET pos_type = 'idiomatic expression' 
WHERE pos_type = '&id;';
UPDATE pos SET pos_type = 'adverbial noun (fukushitekimeishi)' 
WHERE pos_type = '&n-adv;';
UPDATE pos SET pos_type = 'prefix' WHERE pos_type = '&pref;';
UPDATE pos SET pos_type = 'Yodan verb with "ku" ending (archaic)' 
WHERE pos_type = '&v4k;';
UPDATE pos SET pos_type = 'Yodan verb with "ru" ending (archaic)' 
WHERE pos_type = '&v4r;';
UPDATE pos SET pos_type = 'intransitive verb' WHERE pos_type = '&vi;';
UPDATE pos SET pos_type = 'suru verb - special class' 
WHERE pos_type = '&vs-s;';
UPDATE pos SET pos_type = 'verb' WHERE pos_type = '&v-unspec;';
UPDATE pos SET pos_type = 'noun which may take the genitive case particle "no"' 
WHERE pos_type = '&adj-no;';
UPDATE pos SET pos_type = 'adverb (fukushi)' WHERE pos_type = '&adv;';
UPDATE pos SET pos_type = 'conjunction' WHERE pos_type = '&conj;';
UPDATE pos SET pos_type = 'interjection (kandoushi)' 
WHERE pos_type = '&int;';
UPDATE pos SET pos_type = 'noun (temporal)(jisoumeishi)' 
WHERE pos_type = '&n-t;';
UPDATE pos SET pos_type = 'suffix' WHERE pos_type = '&suf;';
UPDATE pos SET pos_type = 'Godan verb with "u" ending' 
WHERE pos_type = '&v5u;';
UPDATE pos SET pos_type = 'Godan verb with "ku" ending' 
WHERE pos_type = '&v5k;';
UPDATE pos SET pos_type = 'noun or participle which takes the aux. verb suru' 
WHERE pos_type = '&vs;';
UPDATE pos SET pos_type = 'Kuru verb - special class' WHERE pos_type = '&vk;';
UPDATE pos SET pos_type = 'noun, verb, etc. acting prenominally (incl. rentaikei)'
WHERE pos_type = '&adj-f;';
UPDATE pos SET pos_type = 'prenoun adjectival (rentaishi)' 
WHERE pos_type = '&adj-pn;';
UPDATE pos SET pos_type = 'adverb (with particle "to")'
WHERE pos_type = '&adv-to;';
UPDATE pos SET pos_type = 'counter' WHERE pos_type = '&ctr;';
UPDATE pos SET pos_type = 'noun (common) (futsuumeishi)'
WHERE pos_type = '&n;';
UPDATE pos SET pos_type = 'pronoun' WHERE pos_type = '&pn;';
UPDATE pos SET pos_type = 'Ichidan verb' WHERE pos_type = '&v1;';
UPDATE pos SET pos_type = 'Godan verb - Iku/Yuku special class' 
WHERE pos_type = '&v5k-s;';
UPDATE pos SET pos_type = 'su verb - precursor to the modern suru'
WHERE pos_type = '&vs-c;';
UPDATE pos SET pos_type = 'transitive verb' WHERE pos_type = '&vt;';
UPDATE pos SET pos_type = 'noun' WHERE pos_type LIKE '&n-%';
UPDATE pos SET pos_type = 'verb' WHERE pos_type LIKE '&v%';
UPDATE pos SET pos_type = 'auxilery adjective' WHERE pos_type = '&aux-adj;';
UPDATE pos SET pos_type = 'number' WHERE pos_type = '&num;';
UPDATE pos SET pos_type = 'adjective' WHERE pos_type = '&adj-ix;';
