for /f "tokens=* delims= " %%a in ('dir /b/a-d "%GBE%\%EMUZ%\%MEDN%\Famicom*.bin"') do SET FAMBIOS=%%~a
for /f "tokens=* delims= " %%a in ('dir /b/a-d "%GBE%\%EMUZ%\%MEDN%\Famicom*.bin"') do SET FAMBIOS=%%~a
for /f "tokens=* delims= " %%a in ('dir /b/a-d "%GBE%\%EMUZ%\%MEDN%\*diskys*.rom"') do SET FAMBIOS=%%~a

pushd "%GBC%\net\%LNCH%\%NFAM%"
"%GBC%\fart.exe" "%NESTP%.xml" [EMUPTH] "%GBE%\%EMUZ%\%NESTP%"
"%GBC%\fart.exe" "%VMES%.ini" [EMUPTH] "%GBE%\%EMUZ%\%VNES%"
"%GBC%\fart.exe" "%MEDN%*.cfg" [MEDN] "%GBE%\%EMUZ%\%MEDN%"
popd

for /d %%g IN (*) DO (
if "%RECONF%"=="1" copy /Y "%GBC%\net\%LNCH%\%NFAM%\%NESTP%.xml" "%%~g"
if "%RECONF%"=="1" copy /Y "%GBC%\net\%LNCH%\%NFAM%\%VNES%.ini" "%%~g"
if "%RECONF%"=="1" copy /Y "%GBC%\net\%LNCH%\%NFAM%\%MEDN%*.cfg" "%%~g"
 set CSTM=%%~g
  pushd "%%~g"
  call :injext
CALL "%GBC%\NFAMinject.bat"
popd
  )
  exit /b
:injext
call "%GBC%\CreateGamSubDir.bat"
  for /f "tokens=* delims= " %%a in ('dir /b/a-d-h') do (
if /I "%%~xa"==".unf" "%GBC%\fart.exe" "*.bat" [EXT] unf
if /I "%%~xa"==".nes" "%GBC%\fart.exe" "*.bat" [EXT] nes
if /I "%%~xa"==".fam" "%GBC%\fart.exe" "*.bat" [EXT] fam
if /I "%%~xa"==".fds" "%GBC%\fart.exe" "*.bat" [EXT] fds
if /I "%%~xa"==".bin" "%GBC%\fart.exe" "*.bat" [EXT] bin
if /I "%%~xa"==".zip" "%GBC%\fart.exe" "*.bat" [EXT] zip
if /I "%%~xa"==".unf" "*.bat" SET ROMF=%%~nxa
if /I "%%~xa"==".nes" "*.bat" SET ROMF=%%~nxa
if /I "%%~xa"==".fam" "*.bat" SET ROMF=%%~nxa
if /I "%%~xa"==".fds" "*.bat" SET ROMF=%%~nxa
if /I "%%~xa"==".bin" "*.bat" SET ROMF=%%~nxa
if /I "%%~xa"==".zip" "*.bat" SET ROMF=%%~nxa
)
:skp