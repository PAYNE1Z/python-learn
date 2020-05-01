#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
# Author:   Payne Zheng <zzuai520@live.com>
# Date:     2019/5/15
# Location: DongGuang
# Desc:     random模块


import random

random.randrange(1,10)  # 返回1-10之间的一个随机数，不包括10
random.randint(1,10)  # 返回1-10之间的一个随机数，包括10
random.randrange(0, 100, 2)  # 随机选取0到100间的偶数
random.random()  # 返回一个随机浮点数
random.choice('abce3#$@1')  # 返回一个给定数据集合中的随机字符
random.sample('abcdefghij',3)  # 从多个字符中选取特定数量的字符
# ['a', 'd', 'b']


# 生成随机字符串
import string
# string.ascii_letters  所有的大小写字母
# string.ascii_lowercase 所有小写字母
# string.ascii_uppercase 所有大写字母
# string.punctuation  所有特殊符号
# string.printable    # 能打印的所有字符  ->  '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ \t\n\r\x0b\x0c'
''.join(random.sample(string.ascii_lowercase + string.digits, 6))
# '4fvda1'


# 洗牌
a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
random.shuffle(a)
print(a)
# [3, 0, 7, 2, 1, 6, 5, 8, 9, 4]

