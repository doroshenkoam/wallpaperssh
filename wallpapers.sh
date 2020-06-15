#!/bin/bash

if [[ -d $1 ]]; then 
    echo "Директория для показа картинок задана как: "$1; else 
    echo "Директория "$1 "не найдена"
    exit; fi

while :
do
    for filej in $(cd $1 && find . -name '*.jpg' -type f); do
            sleep $2
            echo "Выставляем изображение фоновым рисунком рабочего стола "$filej
            gsettings set org.gnome.desktop.background picture-uri file:///$1/$filej
    done
done