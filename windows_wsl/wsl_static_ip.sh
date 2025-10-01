#!/bin/bash
ip addr flush dev eth0
ip addr add 172.29.16.10/24 dev eth0
ip link set eth0 up
ip route add default via 172.29.16.1
