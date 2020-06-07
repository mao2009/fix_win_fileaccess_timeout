@echo off
REM NASのタイムアウト対策 
REM ファイルアクセスのタイムアウトを45秒から10分に変更
REM value名がない場合は作成して、ある場合は上書きされる

set key="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
set name="SessTimeout"
set regType="REG_DWORD"
set data="600"

set regCmd="add %key% /v %name% /t %regType% /d %data% /f"
REM powershellから管理者権限でコマンドプロンプトを呼び出しregコマンドを実行

PowerShell Start-Process reg -ArgumentLis '"%regCmd%"' -Verb RunAs