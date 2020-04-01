#!/usr/bin/env python
#-*- coding:utf-8 -*-

import sys

for line in sys.stdin:
    fields = line.strip().split()
    for item in fields:
        print(item + ' ' + '1')