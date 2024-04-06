@echo off
chcp 65001
title MOVision_Builder_OnlyVideo
echo Mental Omega Vision Video

: Проверка существования \ создание папки Build
echo Проверка существования предыдущей сборки...
if exist ".\Build" ( echo Найдена предыдущая папка сборки. ) else ( mkdir ".\Build" && echo Папка для сборки создана. )
echo.

: Сборка mix файлов катсцен Mental Omega Vision
echo Сборка mix-файла катсцен (видевставок) для RA2 and RA2YR Remake для разрешений 768p...
Tools\ccmix.exe --create --lmd --game=ra2 --dir ".\CustomCompileFiles\MOV\RA2_and_RA2YR_Remake\expandmo11_768p" --mix ".\Build\MOV\RA2_and_RA2YR_Remake\expandmo11_768p.mix"
echo.
echo Сборка mix-файла катсцен (видевставок) для RA2 and RA2YR Remake для разрешений 1080p...
Tools\ccmix.exe --create --lmd --game=ra2 --dir ".\CustomCompileFiles\MOV\RA2_and_RA2YR_Remake\expandmo11_1080p" --mix ".\Build\MOV\RA2_and_RA2YR_Remake\expandmo11_1080p.mix"
echo.

: Заглушки для катсцен
echo Проверка на отсутствие файлов катсцен и создание заглушек...
where /Q /R ".\Build\MOV\RA2_and_RA2YR_Remake" expandmo11_768p.mix && echo Заглушка катсцен для разрешений 768p не требуется. || fsutil file createnew ".\Build\MOV\RA2_and_RA2YR_Remake\expandmo11_768p.mix" 1024
where /Q /R ".\Build\MOV\RA2_and_RA2YR_Remake" expandmo11_1080p.mix && echo Заглушка катсцен для разрешений 1080p не требуется. || fsutil file createnew ".\Build\MOV\RA2_and_RA2YR_Remake\expandmo11_1080p.mix" 1024
echo.

echo Сборка mix файлов катсцен MO Vision завершена. 
echo Можно закртыть эту консоль.
pause