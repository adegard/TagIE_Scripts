#include TagIE.ahk 

;Example of Click on text in IE: make easy navigation!
;tclick element could Tag, Selector and also text (Innertext of a Link or Button)
;grab the correct innertext with iWB2
 
tnav("https://www.autohotkey.com/","")
 
tclick("Download")

tclick("Download AutoHotkey Installer")

Sleep, 5000
pwb.Quit()

ExitApp

Esc::ExitApp 
 
 


 
