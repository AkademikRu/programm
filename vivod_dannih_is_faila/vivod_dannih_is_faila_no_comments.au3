#Include <Guiconstants.au3>

Opt('GuiOnEventMode', '1')

			GUICreate("Reading file...",-1,-1,-1,-1)
			GUISetOnEvent($GUI_EVENT_CLOSE, _Exit) ;
			$data = GUICtrlCreateEdit("",140,40,129,70,1)
			$buttonread = GUICtrlCreateButton ("Что в файле?", 160, 165, 105, 30)
			GUICtrlSetOnEvent($buttonread, '_ReadText')


			$buttonwrite = GUICtrlCreateButton("Запись в файл", 200, 200, 105, 30 )
			GUICtrlSetOnEvent($buttonwrite, '_WriteText')

			GUISetState(@SW_SHOW)

While (1)
	Sleep(1)
WEnd

Func _ReadText()
	$file = FileOpen(@ScriptDir & '\text.txt', 0)
	$line = FileReadLine($file)
	GuiCtrlSetData($data, $line)
EndFunc

Func _WriteText()
$edit = GUICtrlRead($data)
$file = FileOpen( 2)
FileWriteLine ( @ScriptDir & '\textwrite.txt', $edit )
;MsgBox(0, '', $edit)
endfunc

Func _Exit ()
	Exit
EndFunc
