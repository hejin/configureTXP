#!/bin/bash
yum install -y lvm2
yum install -y vim
yum install -y git
pvcreate /dev/xvdb 
vgcreate VG_DATA /dev/xvdb
lvcreate -l 100%VG -n lv_data   VG_DATA
mkfs.ext4 /dev/VG_DATA/lv_data 
mkdir /data/
e2label /dev/VG_DATA/lv_data BT_DATA
echo "LABEL=BT_DATA   /data   ext4 defaults   1 2" >> /etc/fstab 
echo "Port 10022" >> /etc/ssh/sshd_config 
firewall-cmd --zone=public --add-port=10022/tcp --permanent
systemctl restart firewalld
