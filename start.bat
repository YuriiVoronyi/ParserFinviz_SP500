@echo off

REM Счётчик итераций
set /a totalIterations=40
set /a currentIteration=0

:loop
REM Проверка на достижение лимита итераций
if %currentIteration% geq %totalIterations% goto end

REM Запуск IntelliJ IDEA
start "" "C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2023.1.4\bin\idea64.exe" "D:\Proj IntelliJ IDEA\CME\CME_Finviz"

REM Запуск AutoHotkey-скрипта для имитации Shift + F10
start "" "D:\Proj IntelliJ IDEA\CME\CME_Finviz\RunIntelliJ.ahk"

REM Ожидание 1 минута и 40 сек. (100 секунд)
timeout /t 100 /nobreak >nul

if %currentIteration% equ 0  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Batller.wav" --play-and-exit
if %currentIteration% equ 1  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Simoni.wav" --play-and-exit
if %currentIteration% equ 2  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Hellfire.wav" --play-and-exit
if %currentIteration% equ 3  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Sevyn.wav" --play-and-exit
if %currentIteration% equ 4  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Rington.wav" --play-and-exit
if %currentIteration% equ 5  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\COBO.wav" --play-and-exit
if %currentIteration% equ 6  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Cheap.wav" --play-and-exit
if %currentIteration% equ 7  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Childsplay.wav" --play-and-exit
if %currentIteration% equ 8  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Snake.wav" --play-and-exit
if %currentIteration% equ 9  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Toy.wav" --play-and-exit
if %currentIteration% equ 10 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Lenor.wav" --play-and-exit
if %currentIteration% equ 11 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Logic.wav" --play-and-exit
if %currentIteration% equ 12 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Morning.wav" --play-and-exit
if %currentIteration% equ 13 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\AugustMoon.wav" --play-and-exit
if %currentIteration% equ 14 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Pade.wav" --play-and-exit
if %currentIteration% equ 15 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Primavera.wav" --play-and-exit
if %currentIteration% equ 16 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Weeknd.wav" --play-and-exit
if %currentIteration% equ 17 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Wonderlights.wav" --play-and-exit
if %currentIteration% equ 18 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Missia.wav" --play-and-exit
if %currentIteration% equ 19 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Ekvator.wav" --play-and-exit

if %currentIteration% equ 20  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Batller.wav" --play-and-exit
if %currentIteration% equ 21  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Simoni.wav" --play-and-exit
if %currentIteration% equ 22  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Hellfire.wav" --play-and-exit
if %currentIteration% equ 23  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Sevyn.wav" --play-and-exit
if %currentIteration% equ 24  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Rington.wav" --play-and-exit
if %currentIteration% equ 25  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\COBO.wav" --play-and-exit
if %currentIteration% equ 26  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Cheap.wav" --play-and-exit
if %currentIteration% equ 27  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Childsplay.wav" --play-and-exit
if %currentIteration% equ 28  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Snake.wav" --play-and-exit
if %currentIteration% equ 29  "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Toy.wav" --play-and-exit
if %currentIteration% equ 30 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Lenor.wav" --play-and-exit
if %currentIteration% equ 31 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Logic.wav" --play-and-exit
if %currentIteration% equ 32 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Morning.wav" --play-and-exit
if %currentIteration% equ 33 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\AugustMoon.wav" --play-and-exit
if %currentIteration% equ 34 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Pade.wav" --play-and-exit
if %currentIteration% equ 35 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Primavera.wav" --play-and-exit
if %currentIteration% equ 36 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Weeknd.wav" --play-and-exit
if %currentIteration% equ 37 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Wonderlights.wav" --play-and-exit
if %currentIteration% equ 38 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Missia.wav" --play-and-exit
if %currentIteration% equ 39 "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" "C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Ekvator.wav" --play-and-exit


REM Увеличение счётчика итераций
set /a currentIteration+=1

REM Ожидание 5 минут (300 секунд)
timeout /t 300 /nobreak >nul

REM Возврат в начало цикла
goto loop

:end
REM Конец программы
echo All 12 iterations completed!
pause
