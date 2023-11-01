@echo off
echo "Hint: set root in line 5"
echo "Hint: usage: create_frames.bat <name of mp4 file w/o extension>"
echo started...
set root_dir=E:\Vuze_\test\
set name=%1.mp4
set file=%root_dir%\%name%
set images_dir=%root_dir%\frames\%1
   @REM e.g. images_dir = E:\Vuze_\test\frames\gorit
@REM create dir
if not exist "%images_dir%" mkdir %images_dir%
@REM echo %images_dir%
@REM create dur file
setlocal EnableDelayedExpansion
set "CommandLine=ffprobe -i %file% -show_entries format=duration -v quiet -of csv="p=0""
for /F "delims=" %%I in ('!CommandLine!') do set "dur=%%I"
echo %dur%
>%images_dir%/dur.txt echo %dur%
@REM create images
@REM for /l %%x in (1, 1, 500) do (
@REM for /l %%x in (1, 1, 3) do (
for /l %%x in (1, 1, %dur%) do (
   @REM echo %%x
   ffmpeg -y -ss %%x -i %file% -vf scale=300:-1 -frames:v 1 -q:v 10 %images_dir%\f_%%x.jpg 2>nul
)
echo done
for /l %%x in (1, 1, 8) do ( echo . )
endlocal


@REM --------------------------------------- old versions 

 
@REM ffmpeg -y -ss 200 -i xx.mp4 -frames:v 1 -q:v 10 out\1.jpg
@REM ffprobe -i xx.mp4 -show_entries format=duration -v quiet -of csv="p=0"
 
@REM @echo off
@REM set "CommandLine=ffprobe -i xx.mp4 -show_entries format=duration -v quiet -of csv="p=0""
@REM setlocal EnableDelayedExpansion
@REM for /F "delims=" %%I in ('!CommandLine!') do set "dur=%%I"
@REM echo(%dur%
@REM for /l %%x in (1, 1, %dur%) do (
@REM    echo %%x
@REM    ffmpeg -y -ss %%x -i xx.mp4 -frames:v 1 -q:v 10 out\%%x.jpg
@REM )
@REM endlocal
 
 
@REM @echo off
@REM set "CommandLine=ffprobe -i xx.mp4 -show_entries format=duration -v quiet -of csv="p=0""
@REM setlocal EnableDelayedExpansion
@REM for /F "delims=" %%I in ('!CommandLine!') do set "dur=%%I"
@REM echo %dur%
@REM >dur.txt echo %dur%
@REM for /l %%x in (1, 1, 2) do (
@REM    echo %%x
@REM    ffmpeg -y -ss %%x -i xx.mp4 -frames:v 1 -q:v 20 out\%%x.jpg
@REM )
@REM endlocal
 
@REM @echo off
@REM setlocal EnableDelayedExpansion
@REM for /F "delims=" %%I in ('!CommandLine!') do set "dur=%%I"
@REM echo %dur%
@REM >dur.txt echo %dur%
@REM for /l %%x in (1, 1, %dur%) do (
@REM @REM for /l %%x in (1, 1, 50) do (
@REM @REM for /l %%x in (1, 1, 3) do (
@REM    echo %%x
@REM    ffmpeg -y -ss %%x -i xx.mp4 -vf scale=800:-1 -frames:v 1 -q:v 10 xx\%%x.jpg
@REM )
@REM endlocal
