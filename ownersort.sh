#!/bin/bash

# Создать скрипт ownersort.sh, который в заданной папке копирует файлы в директории, названные по имени владельца каждого файла. 
# Учтите, что файл должен принадлежать соответствующему владельцу.


folder=/home/strokin_aa/GB/Linux/test_folder

for file in $(ls $folder)
do
    # echo $file
    # echo "${file%.*}"
    username="$(stat --format '%U' $folder/$file)"
    # mkdir $folder/$username
    if [ "${file%.*}" == $username ];
    then
        echo $file" True"
        if ! [ -d "$folder/$username" ];
        then
            mkdir $folder/$username
        fi
        cp $folder/$file $folder/$username
    else
        echo $file" False"
    fi
done