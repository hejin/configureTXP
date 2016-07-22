#!/bin/bash
free_memsz=`free |tail -n2|head -n1 |awk {'print $4;'}`;

echo $free_memsz; 

if [ $free_memsz -ge 300000 ]; then 
	echo "memory ok"; 
else
	echo 3 > /proc/sys/vm/drop_caches
fi
