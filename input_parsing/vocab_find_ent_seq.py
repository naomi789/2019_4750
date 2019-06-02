#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import collections

json_file = './../data/vocab/jlpt_vocab_n5.csv'
output = 'breen_jlpt_vocab_n5.csv'

with open(json_file, 'r') as file:
    all_data = str.splitlines(file.read())

with open(output, 'w') as output:
    # output.write('USE main_db;\n')

    for entry in all_data:
        print(entry)
