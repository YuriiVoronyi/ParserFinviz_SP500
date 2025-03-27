; Запуск приложения IntelliJ IDEA
Run, "C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2023.1.4\bin\idea64.exe" "D:\Proj IntelliJ IDEA\CME\CME_Finviz",, PID

; Ждем, пока окно IntelliJ IDEA станет активным
WinWaitActive, IntelliJ IDEA,,, 10
if ErrorLevel {
    MsgBox, Окно IntelliJ IDEA не найдено!
    ExitApp
}

; Отправляем сочетание клавиш Shift+F10
SendInput, +{F10}

; Ожидание завершения работы приложения
Process, WaitClose, %PID%

; Определить список мелодий
melodies := []
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\A. COBO - Rodando.wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Cheap Sunglasses - Remembering Ibiza (Chillhouse Rework).wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Childsplay & Chuckie - Certain Law.wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\DJ Snake & Lil John - Turn Down For What.wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Ekvator - Chelyabinsk (Extended Mix).wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Ekvator - Chelyabinsk (Extended Mix).wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Lenor (реклама).wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Logic & Rag'n'Bone Man - Broken People (из фильма «Яркость»).wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\Morning.wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\O.LIEBERT - August Moon.wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\R.KING - Primavera.wav")
melodies.Push("C:\Program Files\AMP Global (EU) MT5 Terminal\Sounds\WAV\___Музыка из фильма _Игрушка_.wav")

; Определить текущий номер итерации
iterationFile := "D:\WEB\iteration.txt"
if !FileExist(iterationFile) ; Если файл не существует, создать его и записать 0
{
    FileAppend, 0, %iterationFile%
}

; Прочитать текущую итерацию
FileRead, iteration, %iterationFile%
; Преобразовать строковое значение в число:
iteration := iteration + 0
; Увеличить итерацию на 1 и взять остаток от деления по количеству мелодий
iteration := Mod(iteration + 1, melodies.Length()) ; Увеличить итерацию на 1

; Сохранить новое значение итерации
FileDelete, %iterationFile%
FileAppend, %iteration%, %iterationFile%

; Получить текущую мелодию из массива
currentMelody := melodies[iteration]

; Запустить Windows Media Player для воспроизведения текущей мелодии
Run, "C:\Program Files\Windows Media Player\wmplayer.exe" "%currentMelody%"