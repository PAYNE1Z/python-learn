#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
# Author:   Payne Zheng <zzuai520@live.com>
# Date:     2019/4/27
# Location: DongGuang
# Desc:     do the right thing


"""
十进制转二进制最简单直白的方法：

    如：要计算数据 9, 27， 36， 45, 68, 134 的二进制
    方法：在对应的二进制位下填1，其它填0

    128  64  32  16  8  4  2  1   二进制位        二进制值
9     0   0   0   0  1  0  0  1   9=8+1          00001001
27    0   0   0   1  1  0  1  1   27=16+8+2+1    00011011
36    0   0   1   0  0  1  0  1   36=32+4        00100101
45    0   0   1   0  1  1  0  1   45=32+8+4+1    00101101
68    0   1   0   0  0  1  0  0   68=64+4        01000100
134   1   0   0   0  0  1  1  0   134=128+4+2    10000110

接下来我们用Python自带函数验证一下
Python中使用 bin() 函数 将十进制转成二进制  前缀为 0b 表示
            oct() 函数 将十进制转成八进制  前缀为 0o 表示
            hex() 函数 将十进制转成十六进制  前缀为 0x 表示
"""

print(bin(9))
print(bin(27))
print(bin(36))
print(bin(45))
print(bin(68))
print(bin(134))

"""
以上代码将返回相应十进制数值的二进制,结果如下：
前面 0b 代表是二进制
0b1001
0b11011
0b100100
0b101101
0b1000100
0b10000110
"""


"""
十六进制与十进制对应关系：

十六进制    0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
  十进制    0   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15

十六进制与二进制对应关系：

十六进制    0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
  二进制  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
注：(每四位表示一个16进制位)

示例二进制： 1011 1001 1111 . 1001   
得十六进制：  B    9    F   .   9

示例二进制： 10111.101    
    补位后： 0001 0111 . 1010
得十六进制：    1   7   .  A                                      
注：(这里需要注意的是,在向左或向右取四位时，取到最高位或最低位，如果无法凑足四位，就可以在小数点的最左边或最右边补0) 

示例十六进制:   B    F    4  .  B    5
    得二进制: 1011 1111 0100 . 1011 0101  =>  101111110100.10110101

"""