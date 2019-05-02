#!/bin/bash
echo "hy,"
while [ -z $a ]
do
	echo "please enter the name of your file or directory"
	read -e fichero
	typeof=$(file ./$fichero | awk '{print $3}')
	type_fichero=$(file ./$fichero | awk '{print $2}')
	echo "1 un fichier for compress, 
	2 for decompress
	3 for remove
	4 for exit the program"
	read num
	if test $num -eq 1; then 
		echo "What type for your compression?  for directory gzip, bzip2, xz 
       		0 for tar
       		1 for gzip
       		2 for tar.gz
		3 for rar
       		4 for bzip2
       		5 for tar.bz2
       		6 for xz
       		7 for tar.xz
		8 for zip"
		read numero
		if test $numero -eq 0; then 
			tar cvf ./$fichero.tar ./$fichero
		 elif test $numero -eq 1 && [ $type_fichero != "directory" ] ; then 
			cp ./$fichero ./$fichero.old
			gzip -rv ./$fichero.gz ./$fichero
			mv ./$fichero.old ./$fichero
		elif test $numero -eq 2; then 
			tar cvzf ./$fichero.tar.gz ./$fichero
		elif test $numero -eq 3; then 
			rar a ./$fichero.rar ./$fichero
		elif test $numero -eq 4 && [ $type_fichero != "directory" ] ; then 
			cp ./$fichero ./$fichero.old
			echo "you choose fast 1 to best 9  for the compressing"
			read  compr
			bzip2 -vf$compr ./$fichero
			mv ./$fichero.old ./$fichero
		elif test $numero -eq 5; then
			echo "1 for a standart compression 
			2 for custom your compression"
			read $pers
			if test $pers -eq 1; then
				tar cvjf ./$fichero.tar.bz2 ./$fichero
			elif $pers -eq 2; then 
				echo "fast 1 to optimized 9" 
				read fo
				tar cvf ./$fichero.tar ./$fichero 
				bzip2 -vf$fo ./$fichero.tar
			fi
		elif test $numero -eq 6 && [ $type_fichero != "directory" ] ; then 
			cp ./$fichero ./$fichero.old
			echo "you choose fast 0 to best 9 for the compressing"
			read comp
			xz -vf$comp ./$fichero
			mv ./$fichero.old ./$fichero
		elif test $numero -eq 7; then
			echo "1 for standart compression 
			2 for custom your compression"
			read $per
			if test $pers -eq 1; then
				tar cvJf ./$fichero.tar.xz ./$fichero
			elif $pers -eq 2; then 
				tar cvf ./$fichero.tar ./$fichero
				XZ -vf$per ./$fichero.tar
			fi
		elif test $numero -eq 8; then 
			zip -vr ./$fichero.zip ./$fichero
		fi

	fi
	if test $num -eq 2; then 
		if [ $typeof = "compressed" ]
	       	then
			if [ $type_fichero = "bzip2" ]
		       	then
				bzip2 -d ./$fichero
			elif [ $type_fichero = "gzip" ]
		       	then
				gzip -d ./$fichero
			elif [ $type_fichero = "XZ" ] 
		       	then
				XZ -d ./$fichero
			fi
		elif [ $typeof = "archive" ]
	       	then
			if [ $type_fichero = "RAR" ]
		       	then
				mkdir ./$fichero.a/
				unrar e ./$fichero -x ./$fichero.a/
			elif [ $type_fichero = "Zip" ]
		       	then 
				mkdir ./$fichero.a
				unzip ./$fichero -d ./$fichero.a
			fi
		elif [ $typeof = "tar" ] && [ $type_fichero = "POSIX" ]
	       	then 
			tar xvf ./$fichero
		fi
		echo "$typeof $type_fichero"
	fi
	if test $num -eq 3; then 
		if [ $type_fichero != "directory" ] ; then 
			rm ./$fichero
		elif [ $type_fichero = "directory" ] ; then
			rm -fr ./$fichero
		fi
	fi 
	if test $num -eq 4; then 
	a=1
	fi
done

# tar cvf ./$(date +%Y-%m-%d).tar ./$fichero;
# gzip ./$(date +%Y-%m-%d).tar;
