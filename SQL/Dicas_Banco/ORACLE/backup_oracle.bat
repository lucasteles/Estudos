@ECHO OFF
@ECHO *************************
@ECHO * Backup Diário do Oracle
@ECHO * Aguarde...
@ECHO *************************
@ECHO OFF

exp system/manager file=E:\OracleBackup\bk.dmp log=E:\OracleBackup\bk.log full=y direct=y

SET DATA=%DATE%

rename E:\OracleBackup\bk.dmp sinapwi%DATA:~10,4%%DATA:~7,2%%DATA:~4,2%.dmp
rename E:\OracleBackup\bk.log sinapwi%DATA:~10,4%%DATA:~7,2%%DATA:~4,2%.log