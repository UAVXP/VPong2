set tempFolder=temp

if not exist %tempFolder%\libs (
	mkdir %tempFolder%\libs
)

copy *.lua %tempFolder%
if %ERRORLEVEL% neq 0 (
	pause
	exit
)
copy libs\*.* %tempFolder%\libs\*.*

cd %tempFolder%
"%PROGRAMFILES%\7-Zip\7z.exe" a -r -tzip -mx=0 -mm=Copy ..\game.zip *
cd ..

attrib -h -s -a -r %tempFolder%
:: rmdir is not working as I expected
::rmdir /S /Q %tempFolder%
del /F /S /Q %tempFolder%

move game.zip game.love

copy game.love "C:\Users\VXP\Pictures\SharedImages"