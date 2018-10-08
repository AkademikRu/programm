#Include <Guiconstants.au3>

Opt('GuiOnEventMode', '1')

			GUICreate("Reading file...",-1,-1,-1,-1)
			GUISetOnEvent($GUI_EVENT_CLOSE, _Exit) ;
			$data = GUICtrlCreateEdit("",140,40,129,70,1)
			$event = GUICtrlCreateButton ("Что в файле?", 160, 165, 105, 30)
			GUICtrlSetOnEvent($event, '_ReadText')
			GUISetState(@SW_SHOW)

While (1)
	Sleep(1)
WEnd

Func _ReadText()
	$file = FileOpen(@ScriptDir & '\text.txt', 0)
	$line = FileReadLine($file)
	GuiCtrlSetData($data, $line)
EndFunc

Func _Exit ()
	Exit
EndFunc
