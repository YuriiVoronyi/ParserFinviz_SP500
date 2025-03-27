@echo off
REM Определение списка мелодий (по одной на каждую итерацию)
set melodies[0]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\A. COBO - Rodando.wav"
set melodies[1]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Cheap Sunglasses - Remembering Ibiza (Chillhouse Rework).wav"
set melodies[2]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Childsplay & Chuckie - Certain Law.wav"
set melodies[3]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\DJ Snake & Lil John - Turn Down For What.wav"
set melodies[4]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Ekvator - Chelyabinsk (Extended Mix).wav"
set melodies[5]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Ekvator - Chelyabinsk (Extended Mix).wav"
set melodies[6]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Lenor (реклама).wav"
set melodies[7]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Logic & Rag'n'Bone Man - Broken People (из фильма «Яркость»).wav"
set melodies[8]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Morning.wav"
set melodies[9]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\O.LIEBERT - August Moon.wav"
set melodies[10]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\R.KING - Primavera.wav"
set melodies[11]="C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\___Музыка из фильма _Игрушка_.wav"

REM Счётчик итераций
set /a totalIterations=12
set /a currentIteration=0

:loop
REM Проверка на достижение лимита итераций
if %currentIteration% geq %totalIterations% goto end

REM Запуск IntelliJ IDEA
start "" "C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2023.1.4\bin\idea64.exe" "D:\Proj IntelliJ IDEA\CME\CME_Finviz"

REM Запуск AutoHotkey-скрипта для имитации Shift + F10
start "" "D:\Proj IntelliJ IDEA\CME\CME_Finviz\RunIntelliJ.ahk"

REM Воспроизведение мелодии для текущей итерации
set currentMelody=!melodies[%currentIteration%]!
start wmplayer "%currentMelody%"

REM Увеличение счётчика итераций
set /a currentIteration+=1

REM Ожидание 5 минут (300 секунд)
timeout /t 300 /nobreak >nul

REM Возврат в начало цикла
goto loop

:end
REM Конец программы
echo Все 12 итераций завершены!
pause