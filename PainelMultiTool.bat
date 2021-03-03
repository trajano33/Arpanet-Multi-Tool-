::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS
ECHO.
ECHO                      =============================
ECHO                      Executando Como Administrador
ECHO                      =============================

:init
setlocal DisableDelayedExpansion
set cmdInvoke=1
set winSysFolder=System32
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO               **************************************
ECHO                          Carregando...
ECHO               **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"

if '%cmdInvoke%'=='1' goto InvokeCmd 

ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
goto ExecElevation

:InvokeCmd
ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
"%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM Run shell as admin (example) - put here code as you like

title Login
color 2
cls
:again
cls
color 2
echo.
echo [40;32m /====================================\
echo [40;32m:           Seja Bem vindo             :
echo [40;32m:                 a                    :
echo [40;32m:              Arpanet                 :
echo [40;32m \====================================/
echo.
set /p user=Username:  
echo.
set /p pass=Senha:   
if %user% ==  arpanet if %pass% == arpnet goto unlocked
echo Senha ou Username errado tente novamente...
timeout 3 >nul
goto again
:unlocked
:home
cls
echo.
type arpanettx.py
echo.
set /p  main=[40;37mEscolha qual tool quer usar:
if %main% == 1 goto pinger 
if %main% == 2 goto pinger2
if %main% == 3 goto pinger3
if %main% == 4 goto tracertroute
if %main% == 5 goto iplookup2
if %main% == 6 goto iplookup3
if %main% == 7 goto sniffer
if %main% == 8 goto NewIp
if %main% == 9 goto PortScan
if %main% == 10 goto Spam
if %main% == 11 goto putty
if %main% == 12 goto emailanom
if %main% == 13 goto passgeneretor
if %main% == 14 goto Stress
if %main% == 15 goto CPF
if %main% == 16 goto dorks

if %main% == v goto back
if %main% == d goto discord
if %main% == t goto telegram
if %main% == c goto creditos
if %main% == b goto sair
if %main% == s goto settings
:pinger
start DDosAttack.bat
:sair
exit
:tracertroute
cls
echo.
set /p  escolha=Qual ip:
tracert %escolha%
echo.
echo 1-voltar 2-proximo scan
set /p escolha2=Para onde deseja ir:
if %escolha2% == 1 goto voltar
if %escolha2% == 2 goto tracertroute
:voltar
cls
goto home
:creditos
cls 
echo Feito Por
echo Trajano e Deidara
echo.
echo e um salve para o X z h y a n '7z  me ajudo pa caramba 
echo.
set /p escolha=Aperte 1 para voltar:
if %escolha% == 1 goto home
:pinger2
start DDosAttack2.bat
:pinger3
start DDosAttack3
:iplookup3
cls
echo.
echo Espera Carregar...
echo.
python Iplookup3.py
echo.
echo                  1-Proximo Scan     2-Voltar
echo.
set /p  geolocation3=Quer ir para onde:
if %geolocation3% == 2 goto home
if %geolocation3% == 1 goto iplookup3
:iplookup2
cls
echo.
echo Espera Carregar...
echo.
python IpLookup2
echo.
echo                  1-Proximo Scan     2-Voltar
echo.
set /p  geolocation3=Quer ir para onde:
if %geolocation3% == 2 goto home
if %geolocation3% == 1 goto iplookup3
:sniffer
cls
echo.
echo                      Sniffer
echo.
echo By:Trajano
echo.
set /p  port=Qual porta deseja fazer o sniffing:
pktmon filter remove
pktmon filter add -t UDP -p 53
pktmon start --etw -p %port% -l real-time
pause
:NewIp
cls
echo.
echo Aviso essa ferramenta mudara o seu ip voce tem certeza ? (S para sim e N para nao)
set /p confirmaçãoip=Tem certeza:
if %main% == n goto home 
if %main% == s goto NewipUnlocked 
:NewipUnlocked 
cls
ipconfig
ipconfig \
ipconfig /release
ipconfig /renew
goto home
:PortScan
cls
python PortScan.py
:Spam
start spam.vbs
goto home
:putty
start putty.exe
goto home
:emailanom
start https://emkei.cz/
goto home
:passgeneretor
cls
python generetorpass.py
:Stress
cls
echo.
echo 1-Anonboot                 6-Stressthem            11-Str3ssed
echo.
echo 2-IP Stresser              7-Quez Stresser         12-Web Stresser
echo.
echo 3-Lite Stresser            8-EOR-N Stresser        13-Thunder Stresser
echo.
echo 4-Downed Stresser          9-Free Stresser         14-Stressing Ninja
echo.
echo 5-Data Booter              10-iRaven Stresser      15-Free IP Stresser
echo.
echo V-voltar
echo.
echo By:X z h y a n '7z 
set /p stress=Qual Stress vai querer usar:
if %stress% == 1 start https://anonboot.com/
if %stress% == 2 start https://www.ipstresser.com/
if %stress% == 3 start https://litestress.com/
if %stress% == 4 start https://downed.io/
if %stress% == 5 start https://databooter.to/
if %stress% == 6 start https://stressthem.to/
if %stress% == 7 start https://quez.in/ 
if %stress% == 8 start https://eor-n.to/
if %stress% == 9 start http://freestresser.to/ 
if %stress% == 10 start https://iraven.cc/  
if %stress% == 11 start https://str3ssed.co/
if %stress% == 12 start https://webstress.net/
if %stress% == 13 start https://thunderstresser.me/
if %stress% == 14 start https://stressing.ninja/
if %stress% == 15 start https://freeipstresser.net/
if %stress% == v goto home
:CPF
cls
python gui.py
:dorks
start dork.exe
goto home
:telegram
start https://t.me/Mafia_Brasil_ofc
goto home
:discord
start https://discord.gg/2gkw3EFzzM
goto home
:settings
cls
type settingstx.py
echo.
set /p settings=Settings: 
if %settings% == 1 goto background1
if %settings% == 2 goto background2
if %settings% == 3 goto background3
if %settings% == 4 goto background4
if %settings% == 5 goto background5
if %settings% == 6 goto background6
if %settings% == 7 goto background7
if %settings% == 8 goto background8
if %settings% == 9 goto background9
if %settings% == 10 goto background11
if %settings% == 11 goto background10
if %settings% == 12 goto background12
if %settings% == 13 goto fundo
if %settings% == 14 goto github


:background1
cd Wallpapers
cmdbkg background-1.bmp
cd ..
goto settings 


:background2
cd Wallpapers
cmdbkg background-2.bmp
cd ..
goto settings 

:background3
cd Wallpapers
cmdbkg background-3.bmp
cd ..
goto settings

:background4
cd Wallpapers
cmdbkg background-4.bmp
cd ..
goto settings 

:background5
cd Wallpapers
cmdbkg background-5.bmp
cd ..
goto settings 

:background6
cd Wallpapers
cmdbkg background-6.bmp
cd ..
goto settings 

:background7
cd Wallpapers
cmdbkg background-7.bmp
cd ..
goto settings

:background8
cd Wallpapers
cmdbkg background-8.bmp
cd ..
goto settings 

:background9
cd Wallpapers
cmdbkg background-9.bmp
cd ..
goto settings 

:background10
cd Wallpapers
cmdbkg background-10.bmp
cd ..
goto settings 

:background11
cd Wallpapers
cmdbkg background-11.bmp
cd ..
goto settings 

:background12
cd Wallpapers
cmdbkg background-12.bmp
cd ..
goto settings 

:fundo
set /p fundo1=escreve o numero da sua imagem: 
set /p fundo2=escreve a tranparencia da sua imagem: 
cd Wallpapers
cmdbkg background-%fundo1%.bmp /t %fundo2%
cd ..
goto settings

:github

start https://github.com/Trajano157
goto settings




