#!/bin/bash
# Создать скрипт, который создаст директории для нескольких годов (2010 — 2017), в них — поддиректории для месяцев (от 01 до 12),
# и в каждый из них запишет несколько файлов с произвольными записями (например, 001.txt, содержащий текст«Файл 001», 002.txt с текстом Файл 002) и т. д.

start_year=$1
end_year=$2
start_file=$3
end_file=$4
zeros=3

[ $# != 4 ]&&{
                echo Параметров не может быть меньше трех
                echo Формат использования
                echo $0 start_year end_year start_file end_file
                exit 1
}


for ((i = $start_year; i <= $end_year; i++))
do
    mkdir -p $i/{01..12}
    for j in {01..12}
    do
        for ((k = $start_file; k <= $end_file; k++))
        do
            temp=$(printf "%0*d" $zeros $k)
            echo "Файл "$temp > $temp.txt
            mv $temp.txt $i/$j
        done
    done
done