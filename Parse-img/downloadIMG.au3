#include <GuiConstants.au3>
#include <IE.au3>

#NoTrayIcon
Opt("GUIOnEventMode", 1) ; Change to OnEvent mode
GuiCreate("Заголовок", 400, 400)
GuiSetIcon("icon.ico")
GUISetOnEvent($GUI_EVENT_CLOSE, 'GUIExit')
GUICtrlCreateLabel("Нажми на кнопку:", 175, 10, 50, 15, $SS_CENTER) 
GUICtrlSetColor(-1,0xFF0000) ; цветинструкций(здесь-красный)

Local $LogEdit = GUICtrlCreateEdit( @CRLF & @HOUR & ':' & @MIN & ':' & @SEC & " Запуск", 10, 160, 380, 200)


; Кнопка 1
GUICtrlCreateButton("Скачать изображение", 100, 30, 200, 30)
GUICtrlSetOnEvent(-1,'mybuttons1')  ; Принажатии запускается mybuttons1()

; Кнопка 2
GUICtrlCreateButton("Кнопка 2", 100, 70, 200, 30)
GUICtrlSetOnEvent(-1,'mybuttons2') ; Принажатии запускается mybuttons2()

Func mybuttons1()

	Local $sUrl = "https://cdn01.x-plarium.com/stormfall/content/sector/units/"
	Local $name_img =  ['10004','10005','10006','10007','10008']
	Local $img_Length = _MasLength($name_img)
	
	
	GUICtrlSetData($logedit, @CRLF & @HOUR & ':' & @MIN & ':' & @SEC & " Количество файлов:" & $img_Length, 1)

;	For $i = $img_Length To 1 Step -1
;		_downloadImg($sUrl,$name_img[$i])
;	Next

   For $Element In $name_img
      _downloadImg($sUrl,$Element)
   Next


	GUICtrlSetData($logedit, @CRLF & @HOUR & ':' & @MIN & ':' & @SEC & " Загрузка завершшена", 1)
	
EndFunc

Func mybuttons2()
		
EndFunc

;Показать GUI после завершения выполнения функции
GUISetState(@SW_SHOW)

;Бездействие скрипта во время выполнения цикла – эта функция ДОЛЖНА БЫТЬ ПОДКЛЮЧЕНА

;OnEventmode 
While 1
	Sleep(500)
WEnd

Func GUIExit()
	Exit
EndFunc

Func _downloadImg($sUrl,$name)
	Local $sFile = @ScriptDir & "\img\" & $name & ".jpg"
	$FullUrl = $sUrl & $name & ".jpg"
	InetGet($FullUrl, $sFile)	
	GUICtrlSetData($logedit, @CRLF & @HOUR & ':' & @MIN & ':' & @SEC & "/Url: " & @CRLF  & " -  " & $FullUrl, 1)
	GUICtrlSetData($logedit, @CRLF & @HOUR & ':' & @MIN & ':' & @SEC & "/Файл загружен:" & @CRLF  & " -  " & $name & " - Путь к файлу: " & $sFile, 1)
EndFunc


Func _IsVarIsNull ( $_Var )
    If Not $_Var Then 
        Return True 
    Else
        Return False
    EndIf
EndFunc


Func _MasLength($a)
   local $i
   For $i=UBound($a) - 1 to 0 Step -1
      If StringLen($a[$i])>  0 Then ExitLoop
   Next
    Return $i + 1
EndFunc