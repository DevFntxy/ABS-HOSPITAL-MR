@echo off
set FECHA=%date:~-4%%date:~3,2%%date:~0,2%
set HORA=%time:~0,2%%time:~3,2%

set HORA=%HORA: =0%

set MYSQLDUMP=C:\xampp\mysql\bin\mysqldump.exe
set USER=root
set PASS=TU_PASSWORD
set DB=hospital_230260
set DESTINO=C:\RespaldosMySQL

%MYSQLDUMP% -u%USER% -p%PASS% --routines --events --triggers %DB% > %DESTINO%\backup_%DB%_%FECHA%_%HORA%.sql