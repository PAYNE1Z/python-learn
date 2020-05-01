#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
# Author:   Payne Zheng <zzuai520@live.com>
# Date:     2019/8/2
# Location: DongGuang
# Desc:     基于多线程实现socket客户端并发


from threading import Thread
from socket import *
import threading


def client(server_ip, port):
    c = socket(AF_INET, SOCK_STREAM)
    # 套接字对象一定要加到函数内，即局部名称空间内，放在函数外则被所有线程共享，则大家公用一个套接字对象，那么客户端端口永远一样了
    c.connect((server_ip, port))

    count = 0
    while True:
        try:
            c.send(('%s say hello %s' % (threading.current_thread().getName(), count)).encode('utf-8'))
            msg = c.recv(1024)
            print(msg.decode('utf-8'))
            count += 1
        except Exception as e:
            print(e)


if __name__ == '__main__':
    for i in range(5):
        t = Thread(target=client, args=('127.0.0.1', 8888))
        t.start()