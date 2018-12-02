#include TagIE.ahk 

;share on multiple groups to facebook
;your facebook password must saved on internet explorer

;parameters
linktoshare =https://www.youtube.com/watch?v=OulL3MuMlWU   ;without quotation marks
text = No Programming Skills needed. How to easily automate posting responses on Job or Ads website like Kijiji. Here you will see an example of script. #automation #RPA #jobposting #marketing #growthhacking
timerbetween := 10000   ;millisec between two posts
array := ["netw","inbo"]   ;groups array "mlm",

url = http://www.facebook.com/sharer/sharer.php?s=100&u=%linktoshare%


Loop % array.Length()
{
;MsgBox % array[A_Index]

tnav(url,"")
 
tenter(text, "body > div:nth-of-type(1) > div > form > div:nth-of-type(2) > div > div:nth-of-type(1) > div > div > div > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2) > div > div > textarea", 0)

tclick("body > div:nth-of-type(1) > div > form > div:nth-of-type(1) > div:nth-of-type(2) > div > div > div > div > a > span:nth-of-type(2) > i", 0)
 
tclick("Share in a group", 0)

value := array[A_Index]
Sleep, 1000

SendInput {Raw} %value%
Sleep, 3000

SendInput {Down}{enter} 
Sleep, 1000  

;Post to FB button
tclick("body > div:nth-of-type(1) > div > form > div:nth-of-type(3) > div > table > tbody > tr > td:nth-of-type(2) > button:nth-of-type(2) > span", 0)

Sleep, 2000
 
pwb.Quit()   ;to avoid closing window of fb

Sleep, 3000

SendInput {enter} {enter} 
Sleep, 1000  

techo("waiting 10 sec")
Sleep, timerbetween 

pwb := ComObjCreate("InternetExplorer.Application") ;create IE Object
Sleep,1000

 pwb.visible:=true  ; Set the IE object to visible

Sleep,2000


}



Sleep, 5000
pwb.Quit()
ExitApp

Esc::ExitApp 




 
 
