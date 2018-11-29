#include TagIE.ahk 

Run, chrome.exe https://www.autohotkey.com/, , Max
#IfWinActive ahk_class Chrome_WidgetWin_1

StatusBarWait, Done, , , AutoHotKey

Gui Show, minimize, Log

;on home page:
ChromeWait("Download")

;on the download page:
ChromeWait("Download")

Sleep, 5000

;close chrome browser:
SetTitleMatchMode 2
WinClose Google Chrome

ExitApp

Esc::ExitApp 
 
 
