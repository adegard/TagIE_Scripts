#include TagIE.ahk
tnav("http://the-automator.com/web-scraping-with-autohotkey/","")
Var:=tread("#post-1239 > div > p:nth-child(1) > strong")
techo(Var)
FileAppend, %Var% `n, Test.txt
run, Test.txt
Sleep, 1000
pwb.Quit()
ExitApp
Esc::ExitApp