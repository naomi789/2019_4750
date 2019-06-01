#!/usr/bin/python
# -*- coding: utf-8 -*-

import json

json_file = './JMdict_e.xml.json'
# json_file = './examp_6.json'

output = 'create.sql'

# with open(json_file, 'r') as file:
#     data = file.read().replace('\n', '')

with open(json_file, 'r') as file:
    all_data = file.read()

# print('all_data:', all_data)
all_data = json.loads(all_data)


with open(output, 'w') as output:
    for entry in all_data:
        ent_seq = None
        reb = None
        keb = None
        sense = None
        lsource = None
        pos = None
        gloss = None
        orig_lang = None
        orig_word = None


        # print(counter, entry)
        ent_seq = entry['ent_seq'] # this ALWAYS exists
        ent_seq = ent_seq[0] # there can only be one, therefore always zeroth

        r_ele = entry['r_ele'] # an object
        r_ele = r_ele[0]
        reb = r_ele['reb']

        if 'k_ele' in entry:
            # print(True)
            k_ele = entry['k_ele'] # an object, MAY NOT EXIST
            k_ele = k_ele[0]
            keb = k_ele['keb']

        if 'sense' in entry:
            sense = entry['sense'] # an object
            sense = sense[0]
            pos = sense['pos']
            gloss = sense['gloss']
            if 'lsource' in sense:
                lsource = sense['lsource'][0]
                if '$' in lsource:
                    dollar_lang = lsource['$']
                    if 'xml:lang' in dollar_lang:
                        orig_lang = dollar_lang['xml:lang']
                    if '_' in lsource:
                        orig_word = lsource['_']

        # sql_statement = str('INSERT INTO jmdict VALUES(\'' + ent_seq + '\',')
        # sql_statement += str(k_ele + '\',' + r_ele + '\',')
        # sql_statement += str(pos + '\',' + lsource + '\'' + ');\n')
        # sql_statement = str(ent_seq + keb + reb + pos + gloss)
        # print(sql_statement)
        # print(type(keb))

        if lsource is not None:
            # print(lsource)
            pass

        # if type(keb) is not None:
        #     print('type(keb)', type(keb))
        #     if keb is not []:
        #         print('keb', keb)
        #         if keb is not None:
        #             output.write(str(keb[0]))

        # second_statement = 'INSERT INTO word_gloss(' + ent_seq + '\','
        # second_statement += gloss + ');'
        # INSERT INTO jmdict VALUES('1000220', '明白', 'めいはく', NULL, NULL);
        # INSERT INTO word_gloss('1000220', 'obvious')
