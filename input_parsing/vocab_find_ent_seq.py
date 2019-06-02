#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import collections

jim_file_name = './../data/JMdict_e/JMdict_e.json'

list_name = 'JLPT N5'
list_description = 'Vocabulary from Peter van der Woude\'s www.jlptstudy.net'
input_file_name = './../data/vocab/jlpt_vocab_n5.csv'
output_file_name = 'breen_jlpt_vocab_n5.csv'

with open(input_file_name, 'r') as file:
    all_data = str.splitlines(file.read())

with open(jim_file_name, 'r') as file:
    jim_data = file.read()
    jim_data = json.loads(jim_data)

with open(output_file_name, 'w') as output:
    output.write('USE main_db;\n')
    for entry in all_data:
        entry_list = entry.split(',')
        # 0 = peter's id
        # 1 = reading
        # 2 = kanji
        # 3 = peter's pos
        # 4 = peter's eng

        for jim_entry in jim_data:
            r_ele = entry['r_ele']
            r_ele = r_ele[0]
            reb = r_ele['reb']
            if 'k_ele' in entry:
                k_ele = entry['k_ele'] # an object, MAY NOT EXIST
                k_ele = k_ele[0]
                keb = k_ele['keb']
            else:
                keb = None

            jim_reading = reb
            jim_kanji = keb
            if entry_list[1] == jim_reading and entry_list[2] == jim_kanji:
                # then it's a match
                output.write(str('INSERT INTO list_word VALUES(\'' + ent_seq + '\',\'' + list_id + '\');'))
                output.write(str('INSERT INTO list VALUES(\'' + list_id + '\'' + list_name + list_description);'))
