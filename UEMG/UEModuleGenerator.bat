@echo off

@rem 静的変数
set InputDirName=BlankModule
set OutputDirName=Output
set TempChar=a

:INIT
cd /d %~dp0
@rem module名の入力受付
set /p ModuleName="Plz Input Module Name :"
if "%ModuleName%"=="" (
	echo plz input "Module Name" as an argument!
	pause
	exit /b 0
)

echo %ModuleName%

:MAIN
@rem blankmoduleをコピー
del /q/s %OutputDirName%\%ModuleName%
xcopy /s/e/i Resource\%InputDirName% %OutputDirName%\%ModuleName%

@rem 書き換えたファイルを一時文字付で出力
cd %OutputDirName%\%ModuleName%\
setlocal enabledelayedexpansion
for /f "usebackq" %%i in (`dir /b /s *.h *.cpp *.cs`) do (
	for /f "delims=" %%j in (%%i) do (
		set line=%%j
		set line=!line:%InputDirName%=%ModuleName%!
		echo !line! >> %%i\..\%TempChar%%%~ni%%~xi
	)
	del %%i
)

@rem 一時文字を除去
for /f "usebackq" %%i in (`dir /b/s *.h *.cpp *.cs`) do call :RENAME %%i %%~ni%%~xi
pause
exit /b

:RENAME
set FileName=%2
set Result=%ModuleName%%FileName:~12%
ren %1 %result%

:eof