#include TagIE.ahk 
frame := 0 
 
tnav("https://www.linkedin.com/mynetwork/", "")
TMI := 1000

Loop, 5	;number of iterations
{
	Loop, 5	;number of iterations
	{
twaitSelector("HTML>BODY>DIV:nth-of-type(5)>DIV:nth-of-type(5)>DIV:nth-of-type(2)>DIV>DIV>DIV>DIV>DIV>DIV>DIV>SECTION>UL>LI>DIV>SECTION>FOOTER>BUTTON>SPAN", frame)


tclick("HTML>BODY>DIV:nth-of-type(5)>DIV:nth-of-type(5)>DIV:nth-of-type(2)>DIV>DIV>DIV>DIV>DIV>DIV>DIV>SECTION>UL>LI>DIV>SECTION>FOOTER>BUTTON>SPAN", frame)

		Sleep, TMI*2
	}
send, {F5}  ; reload page
Sleep, TMI*3
}
pwb.Quit()
ExitApp 
Esc::ExitApp
