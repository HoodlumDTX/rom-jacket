for /d %%g IN (*) DO (
pushd "%GBC%\net\%LNCH%\%ACARC%"
if "%GGOFF%"=="1" "%GBC%\fart.exe" "arc.cfg" [DSK] --remove
if "%GGOFF%"=="1" "%GBC%\fart.exe" "arc.cfg" [DSK1] --remove
if "%GGOFF%"=="1" "%GBC%\fart.exe" "arc.cfg" [DSK2] --remove
if "%GGOFF%"=="1" "%GBC%\fart.exe" "arc.cfg" [DSK3] --remove
if "%GGOFF%"=="1" copy /Y "%GBC%\net\%LNCH%\%ACARC%\arc.cfg" "%%~g"
  set CSTM=%%~g
  pushd "%%~g"
call :rominj
if "%RECONF%"=="1" CALL "%GBC%\%SHRTN%inject.bat"
popd
)
exit /b

:rominj
call "%GBC%\CreateGamSubDir.bat"
for /f "tokens=* delims= " %%a in ('dir /s/b/a-d-h "*.adf" "*.apd" "*.fdi"') do (
SET ROMN=%%~a
SET ROMD=%%~na
set ROME=%%~xa
set ROMF=%%~nxa
CALL :EACHROM
)
exit /b
:EACHROM
if exist "%ROMD%.bat" CALL :ROME
if not exist "%ROMD%.bat" CALL :ROMD
exit /b

:ROMD
copy "..\zz.bat" "%CD%"
rename "zz.bat" "%ROMD%.bat"
"%GBC%\fart.exe" "%ROMD%.bat" [ROMNAME] "%ROMN%"
exit /b

:ROME
copy "..\zz.bat" "%CD%"
rename "zz.bat" "%ROME%.bat"
"%GBC%\fart.exe" "%ROME%.bat" [ROMNAME] "%ROMN%"
exit /b