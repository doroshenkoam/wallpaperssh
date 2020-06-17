#!/bin/bash

if [[ -z $1 ]]; then
    echo "Не передан обязательный параметр - directory"
    exit; elif [[ -z $2 ]]; then
    echo "Не передан обязательный параметр - delay"
    exit; fi

if [[ -d $1 ]]; then 
    echo "Директория для показа картинок задана как: $1"; else 
    echo "Директория $1 не найдена"
    exit; fi

array=$(cd $1 && find . -name '*.jpg' -type f | wc -l)

if [[ $array -eq 0 ]]; then
    echo "В дирректории нет файлов в формате .jpg"
    exit; fi

while :
do
    for filej in $(cd $1 && find . -name '*.jpg' -type f); do
            sleep $2
            case $3 in
                s)
                    echo "Выставляем изображение фоном экрана блокировки $filej"
                    gsettings set org.gnome.desktop.screensaver picture-uri file:///$1/$filej
                ;;            
                w)
                    echo "Выставляем изображение фоновым рисунком рабочего стола $filej"
                    gsettings set org.gnome.desktop.background picture-uri file:///$1/$filej
                ;;
                *)
                    echo "Выставляем изображение фоновым рисунком рабочего стола и фоном экрана блокировки $filej"
                    gsettings set org.gnome.desktop.background picture-uri file:///$1/$filej
                    gsettings set org.gnome.desktop.screensaver picture-uri file:///$1/$filej
                ;;
            esac
    done
done