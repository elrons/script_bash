#!/bin/bash

echo "hi this program is created for the cheksum (MD5)";
echo "please enter a name of your first file";
read -e first_file
echo "please enter a name of your second file";
read -e second_file 

chk_fst_f=$(sudo md5sum $first_file |awk '{print $1}');
chk_sd_f=$(sudo md5sum $second_file |awk '{print $1}');

if test "$chk_fst_f" = "$chk_sd_f" 
then
	echo "you are winner your checksum (md5) is ";
	echo "$chk_fst_f"
else
	echo "your files is different : your first md5 is ";
	echo "$chk_fst_f"
	echo "your second md5 is ";
	echo "$chk_sd_f"
fi
