#!/usr/bin/python
# -*- coding: utf-8 -*-

import json
import collections

json_file = './../data/vocab/jlpt_vocab_n5.csv'

output = 'breen_jlpt_vocab_n5.csv'

with open(json_file, 'r') as file:
    all_data = file.read()

print('all_data:', all_data)

with open(output, 'w') as output:
    output.write('USE main_db;\n')
    for entry in all_data:
        literal = None # actual kanji value
        misc = None # object
        grade = None # in misc; grade in which chacter is learned
        stroke_count = None # in misc
        freq = None # in misc
        jlpt = None # in misc
        reading_meaning = None # an object
        reading = None # contains an array of objects
        # store two or more values where key = "@_r_type" and value is "ja_kun" or "ja_on"
        meaning = None # an array. Keep the strings, toss the objects
        nanori = None # list of strings
