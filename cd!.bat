@echo off
setlocal
set args=%*
if "%args%" == "" (
  cd
  exit /B
)
if "%args%" == "-" (
  if EXIST "%USERPROFILE%\_lastcd" (
    endlocal
    for /F %%i in ('type "%USERPROFILE%\_lastcd"') DO (
        echo %CD% > "%USERPROFILE%\_lastcd"
        cd /D "%%i"
    )
  )
  exit /B
)
if "%args:~0,1%" == "~" (
  echo %CD% > "%USERPROFILE%\_lastcd"
  endlocal ^
    & cd /D "%USERPROFILE%%args:~1%"
  exit /B
)
echo %CD% > "%USERPROFILE%\_lastcd"
endlocal ^
  & cd /D "%args%"
