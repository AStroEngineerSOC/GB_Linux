#!/bin/bash

#Написать скрипт, который удаляет из текстового файла пустые строки и заменяет маленькие символы на большие (воспользуйтесь tr или sed).

#sometext.txt

for file in *txt
do
    cat $file | tr [:lower:] [:upper:] |tr -s "\n" > tr_file
    cat $file | sed '/^$\| *#/d'| sed -e 's/\(.*\)/\U\1/' > sed_file
# mv tempfile $file
done

