for /d %%g IN (*) DO (
  set CSTM=%%~g
  pushd "%%~g"
  call :injext
CALL "%GBC%\Jaginject.bat"
popd
  )
  exit /b
:injext
call "%GBC%\CreateGamSubDir.bat"
for /f "tokens=* delims= " %%a in ('dir /b/a-d-h') do (		
if /I "%%~xa"==".jag" "%GBC%\fart.exe" "*.bat" [EXT] jag
if /I "%%~xa"==".j64" "%GBC%\fart.exe" "*.bat" [EXT] j64
)
:skp
