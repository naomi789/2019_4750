#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import collections

jim_file_name = './../data/JMdict_e/JMdict_e.json'

list_id = '0001'
list_name = 'JLPT N5'
list_description = 'Vocabulary from Peter van der Woude\\\'s www.jlptstudy.net'
input_file_name = './../data/vocab/jlpt_vocab_n5.csv'
output_file_name = 'n5_peter_create.sql'

with open(input_file_name, 'r') as file:
    all_data = str.splitlines(file.read())

with open(jim_file_name, 'r') as file:
    jim_data = file.read()
    jim_data = json.loads(jim_data)

with open(output_file_name, 'w') as output:
    output.write('USE main_db;\n')
    for entry in all_data:
        entry_list = [x.strip() for x in entry.split(',')]
        # 0 = peter's id
        # 1 = reading
        # 2 = kanji
        # 3 = peter's pos
        # 4 = peter's eng
        print(entry_list[0])
        for jim_entry in jim_data:
            ent_seq = jim_entry['ent_seq'][0]
            r_ele = jim_entry['r_ele']
            r_ele = r_ele[0]
            reb = r_ele['reb'][0]
            if 'k_ele' in jim_entry:
                k_ele = jim_entry['k_ele'] # an object, MAY NOT EXIST
                k_ele = k_ele[0]
                assert(len(k_ele['keb']) == 1)
                keb = k_ele['keb'][0]
            else:
                keb = None

            jim_reading = reb
            jim_kanji = keb

            if jim_kanji is not None:
                if entry_list[1] == jim_reading and entry_list[2] == jim_kanji:
                    # then it's a match
                    print('match!')
                    output.write(str('INSERT INTO list_word VALUES(\'' + ent_seq + '\',\'' + list_id + '\');\n'))
                    output.write(str('INSERT INTO list VALUES(\'' + list_id + '\',' + list_name + '\',\'' + list_description + '\');\n'))
            else:
                if entry_list[1] == jim_reading:
                    # then it's a match
                    print('match!')
                    output.write(str('INSERT INTO list_word VALUES(\'' + ent_seq + '\',\'' + list_id + '\');\n'))
                    output.write(str('INSERT INTO list VALUES(\'' + list_id + '\',' + list_name + '\',\'' + list_description + '\');\n'))
