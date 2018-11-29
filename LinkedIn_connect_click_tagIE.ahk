;Grow your Linkedin Network:launch Chrome webpage and Click on "connect"
;your linkeddin password must be saved in browser
;schedule this task one by day with the scheduler of Tagie to grow your network!
#include TagIE.ahk 

;also running Chrome is easy.
;ChromeClick function use Findclick to search yellow color of term search (Ctrl F)
;https://autohotkey.com/board/topic/89592-findclick-2nd-edition/


Run, chrome.exe https://www.linkedin.com/mynetwork/, , Max

#IfWinActive ahk_class Chrome_WidgetWin_1 ; example hotkey
WinWaitActive, LinkedIn
StatusBarWait, Done, , , LinkedIn

Sleep, 3000

TMI := 1000

Loop, 3	;number of iterations
{
	ChromeClick("Accetta")  ; replace by Accept in english
	Sleep, TMI*2
}

	
Loop, 5	;number of iterations
{
	Loop, 5	;number of iterations
	{
		ChromeClick("Collegati")  ; replace by Connect in english
		Sleep, TMI*3
	}
send, {F5}  ; reload page
Sleep, TMI*6
}

;close chrome browser:
SetTitleMatchMode 2
WinClose Google Chrome


ExitApp

Esc:: ExitApp