SetWorkingDir %A_ScriptDir%
#include TagIE.ahk

;parameters
dbFileName=LinkedIn_names_natale.txt

msgFile=msg_natale.txt

techo(dbFileName)

clipboard = ; Empty the clipboard
FileRead, Clipboard, %msgFile%

ClipWait, 1

if ErrorLevel
{
    MsgBox, The attempt to copy text onto the clipboard failed.
    return
}
techo(Clipboard)


;check if Database fie exist, if not, create it
ifnotexist,%dbFileName%
{
	TestString := "This is url list.`r`n"  
	Fileappend,%TestString%`r`n,%dbFileName%
}

frame := 0 
 
tnav("https://www.linkedin.com/search/results/people/?facetGeoRegion=%5B%22it%3A0%22%5D&facetNetwork=%5B%22F%22%2C%22S%22%5D&origin=FACETED_SEARCH", "")

p:=4 ;initial page


if p!=1
{

tnav("https://www.linkedin.com/search/results/people/?facetGeoRegion=%5B%22it%3A0%22%5D&facetNetwork=%5B%22F%22%2C%22S%22%5D&origin=FACETED_SEARCH%3Fpage&page="p, "")

}


while p < 10  ;how many pages
{


loop, 10  ;how many items per page
{
/*

myurl:=pwb.document.getElementsByClassName("name actor-name").item[A_Index].getAttribute("href") ;gets the value of an attribute

name:=pwb.document.getElementsByClassName("name actor-name").item[A_Index].InnerText 
*/

Selector=body > div:nth-of-type(5) > div:nth-of-type(5) > div:nth-of-type(2) > div > div:nth-of-type(2) > div > div:nth-of-type(2) > div > div > div > div > div > div > ul > li:nth-of-type(%A_Index%) > div > div > div:nth-of-type(2) > a > h3 > span > span > span:nth-of-type(1)

twaitSelector(Selector, frame)

tscroll(Selector, frame)

techo("SCRAP NAME avoid double messages")

;Get element value, in frame (0:disabled)
name:=tread(Selector, 0)

techo(name)
;techo(myurl)

	FileRead, OutputVar, %dbFileName%
	
	IfInString, OutputVar , %name%
	{
		techo("name already exist in database")
	}
	else
	{
	FileAppend, %name%`n, %dbFileName%	
		
	techo("continue to send message")


techo("GO TO PROFILE PAGE")


;tnav(myurl,"")
tclick(Selector, frame)


techo("CLICK ON MESSAGE")

twaitSelector("body > div:nth-of-type(5) > div:nth-of-type(5) > div:nth-of-type(2) > div > div > div > div > div > div:nth-of-type(1) > div:nth-of-type(2) > section > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(2) > div > div > span:nth-of-type(1) > button > span:nth-of-type(1)", 0)
;click on element, frame number(0:disabled) 
tclick("body > div:nth-of-type(5) > div:nth-of-type(5) > div:nth-of-type(2) > div > div > div > div > div > div:nth-of-type(1) > div:nth-of-type(2) > section > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(2) > div > div > span:nth-of-type(1) > button > span:nth-of-type(1)", 0)


techo("TEXT FIELD")

twaitSelector("body > div:nth-of-type(5) > div:nth-of-type(5) > aside > div:nth-of-type(2) > div:nth-of-type(1) > form > div:nth-of-type(3) > div:nth-of-type(1) > p", 0)


techo("CLICK TO ACTIVATE FIELD")

tclick("body > div:nth-of-type(5) > div:nth-of-type(5) > aside > div:nth-of-type(2) > div:nth-of-type(1) > form > div:nth-of-type(3) > div:nth-of-type(1) > p", 0)


Send, ^v 

Sleep, 2000

Send, {ENTER}

Sleep, 1000

techo("CLICK SEND")
tclick("body > div:nth-of-type(5) > div:nth-of-type(5) > aside > div:nth-of-type(2) > div:nth-of-type(1) > form > footer > div:nth-of-type(2) > div > button", 0)

Sleep, 1000

techo("CLICK CLOSE BUTTON") 
tclick("body > div:nth-of-type(5) > div:nth-of-type(5) > aside > div:nth-of-type(2) > header > section:nth-of-type(2) > button:nth-of-type(2)", 0)

Sleep, 2000

techo("GO BACK")

    WinActivate ahk_class IEFrame
    ControlFocus, Internet Explorer_Server1, ahk_class IEFrame
    pwb := PWB_Init(WinTitle) ; replaces WinGetTitle and PWB_Get()

pwb.document.parentWindow.history.go(-1) ;Go Backward one page

	} 	 ;end if


} 		;end loop items per page

techo("NEXT PAGE")
tclick(".next", 0)

p:=p+1


} 		;end loop pages

techo("CLOSE BROWSER")
;pwb.Quit() 
ExitApp 
Esc::ExitApp