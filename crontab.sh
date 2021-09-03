#!/bin/bash

# Создать файл crontab, который ежедневно регистрирует занятое каждым пользователем дисковое пространство в его домашней директории.

# crontab -e
# 0 10 * * * ~/GB/Linux/04/04.sh

folder=/home

date >> $HOME/size_of_home_dirs.txt
for folders in $(ls $folder)
do
    du -hs $folder/$folders >> $HOME/size_of_home_dirs.txt
done