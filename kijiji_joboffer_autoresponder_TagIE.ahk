#include TagIE.ahk

;Kijiji autoresponder (respond to any ads for Job, Marketing...). Adapt it to any Ads/Post websites
;It avoid double-responses of job posting by saving urls file database file
;Last button SUBMIT is disabled, so you can try it safe ;-)

;parameters
dbFileName= kijiji_urls.txt
name = Paolo
email = email@gmail.com
message  ="Buongiorno, ho trovato il suo annuncio e mi sono detto che potrebbe avere bisogno di assistenza domiciliare... se conosce qualcuno che ha bisogno di una badante, visita il nostro sito www.badante-noproblem.com  Grazie Non rispondere a questo messaggio perche stato generato automaticamente."

;convert to array
Array := [ name, email, message]

;check if Database fie exist, if not, create it
ifnotexist,%dbFileName%
{
	TestString := "This is url list.`r`n"  
	Fileappend,%TestString%`r`n,%dbFileName%
}

;go first to the correct category
tnav("https://www.kijiji.it/offerte-di-lavoro/offerta/badante/?entryPoint=sb","")

loop, 10  ;how many items
{

myurl:=pwb.document.getElementsByClassName("cta").item[A_Index].getAttribute("href") ;gets the value of an attribute

	FileRead, OutputVar, %dbFileName%
	
	IfInString, OutputVar , %myurl%
	{
		;Url already exist in database
	}
	else
	{
	FileAppend, %myurl%`n, %dbFileName%	
		
	;Go to the url

selector = body > div:nth-of-type(4) > div:nth-of-type(2) > div:nth-of-type(1) > ul > li:nth-of-type(%A_Index%) > div > h3 > a

tclick(selector)

	Sleep, 1000
		
		
	;insert data
tscroll("name") 
Sleep, 1000
tenter(Array[1], "name")
Sleep, 1000
tenter(Array[2], "email")
Sleep, 1000
tenter(Array[3], "message")
Sleep, 1000
	
		
tclick("body > main > section:nth-of-type(1) > div:nth-of-type(2) > aside > article:nth-of-type(3) > article > div > form > label:nth-of-type(1) > div")
tclick("body > main > section:nth-of-type(1) > div:nth-of-type(2) > aside > article:nth-of-type(3) > article > div > form > label:nth-of-type(2) > div")

;SUBMIT DISABLED		
;tclick("body > main > section:nth-of-type(1) > div:nth-of-type(2) > aside > article:nth-of-type(3) > article > div > form > footer > input")

		Sleep, 3000

		pwb.document.parentWindow.history.go(-2) ;Go Backward one page
		Sleep, 1000
		
		
	} ; END , go next

	
	Sleep, 100

} ;LOOP
Sleep, 1000

pwb.Quit()

Esc::ExitApp
ExitApp  
 
 