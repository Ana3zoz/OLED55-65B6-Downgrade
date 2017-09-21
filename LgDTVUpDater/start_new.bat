@echo off
setlocal enabledelayedexpansion
cd DualServer
cls
COLOR 0E
echo ******************************************************************************
echo *                     DNS-�ࢥ� DualServer (New)                            *
echo ******************************************************************************
echo �� �ய�᪥ ���쭥��� ����⢨�, ���������� ��⮬���᪨ ��� �ਫ������ ��� 
echo ��������� IP ���� � 䠩��, � � ��࠭����� ࠭�� ��࠭���� ��⮤� �⪠�.
echo ����� �ய�����, �᫨ ����᪠���� �� �� ����୮ � 㦥 �� ����஥���.
echo (Omitting further action, both applications run automatically without changing
echo the IP address of the PC in a file and maintaining the previously selected 
echo method rollback. You can skip this if you already started again and the mood.)
echo ******************************************************************************
set /p d="�ய����� ���� ���� � ��⮤�? (Skip the address and the method?) (Y): "
set d=!d:%%=!
if %d%==Y goto endend
if %d%==y goto endend
if %d%==� goto endend
if %d%==� goto endend
if %d%==L goto endend
if %d%==l goto endend
if %d%==� goto endend
if %d%==� goto endend
cls
COLOR 0B
for /f "tokens=2 delims=[]" %%f in ('ping -4 -n 1 "%computername%" ^|find /i "["') do set R=%%f
set Z=%R%
echo %Z% - �஢����, �ࠢ���� �� ��� IP ����.
echo               (Check whether the IP address.)
set /p c="�� ��� ������� IP ����? (This is your local IP address?) (Y): "
set c=!c:%%=!
if %c%==Y goto new
if %c%==y goto new
if %c%==� goto new
if %c%==� goto new
if %c%==L goto new
if %c%==l goto new
if %c%==� goto new
if %c%==� goto new
:local
cls
COLOR 0A
echo %Z% - ������� ��� IP ���� �� �ࠢ����.
echo               (Change the IP address on the right.)
set /p a="������ ������� IP ���� �� (Enter the local IP address): "
set a=!a:%%=!
goto new1
Rem if %a:~0,8% == %R:~0,8% goto new1
Rem set Z=%a%
Rem goto local
:new
set a=%R%
:new1
cls
COLOR 0F
echo %a% - ��� IP ���� �㤥� �ਬ���� �� �⪠� ��.
echo               (This IP address will be used for rollback.)
set /p b="������� ��⮤, ���� ������ (Local method, otherwise online) (Y): "
set b=!b:%%=!
cls
COLOR 0B
echo ******************************************************************************
echo     ������ ��᫥ ����᪠ ᫥���騩 IP ���� � ���� DNS � ����ன��� ��.
echo  �������� � ����� htdocs �㦭� 䠩� �⢥�, � �� �롮� �����쭮�� ��⮤� 
echo  �⪠� ᪮����� �� �।���⥫쭮 ����㦥��� ᮮ⢥�����騩 䠩� ��.
echo  (Enter after the launch of the following IP address in the DNS settings TV.
echo Copy the folder htdocs right answer file, and the choice of a local copy of the
echo  method rollback has pre-loaded the corresponding file software.) 
echo                                 %a%                             
echo ******************************************************************************
pause
if %b%==Y goto end1
if %b%==y goto end1
if %b%==� goto end1
if %b%==� goto end1
if %b%==L goto end1
if %b%==l goto end1
if %b%==� goto end1
if %b%==� goto end1
@>"DualServer.ini" (
echo [SERVICES]
echo DNS
echo [DNS_ALLOWED_HOSTS]
echo 192.168.0.1-192.168.255.254
echo 10.0.0.1-10.255.255.254
echo [WILD_HOSTS]
echo snu.lge.*=%a%
)
goto end
:end1
@>"DualServer.ini" (
echo [SERVICES]
echo DNS
echo [DNS_ALLOWED_HOSTS]
echo 192.168.0.1-192.168.255.254
echo 10.0.0.1-10.255.255.254
echo [WILD_HOSTS]
echo *.lg*=%a%
)
:end
:endend
cd ../apache
start apache.exe
cd ../DualServer
start DualServer.exe -v
