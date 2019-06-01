#!/usr/bin/python
# -*- coding: utf-8 -*-

import json

# json_file = './JMdict_e.xml.json'
json_file = './examp_1.json'

# with open(json_file, 'r') as file:
#     data = file.read().replace('\n', '')

with open(json_file, 'r') as file:
    all_data = file.read()

# print('all_data:', all_data)
all_data = json.loads(all_data)


counter = 0
for entry in all_data:
    ent_seq = None
    reb = None
    keb = None
    sense = None
    lsource = None
    pos = None
    gloss = None


    # print(counter, entry)
    ent_seq = entry['ent_seq'] # this ALWAYS exists

    r_ele = entry['r_ele'] # an object
    r_ele = r_ele[0]
    reb = r_ele['reb']

    k_ele = entry['k_ele'] # an object
    k_ele = k_ele[0]
    keb = k_ele['keb']

    sense = entry['sense'] # an object
    sense = sense[0]
    # pos = sense['pos']
    # gloss = sense['gloss']
    # lsource = sense['lsource']

    # keb = entry['']
    sense = None
    lsource = None
    pos = None
    gloss = None

    # sql_statement = 'INSERT INTO jmdict VALUES(\'' + ent_seq + '\','
    # sql_statement += k_ele + '\',' + r_ele + '\','
    # sql_statement += pos + '\',' + lsource + '\'' + ');\n'
    # output.write(sql_statement)


    # second_statement = 'INSERT INTO word_gloss(' + ent_seq + '\','
    # second_statement += gloss + ');'
    # INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
    # INSERT INTO word_gloss('1000220', 'obvious')
