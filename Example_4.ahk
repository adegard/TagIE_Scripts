#include TagIE.ahk 
; result page where clicks on items one by one
tnav("https://www.kijiji.it/offerte-di-lavoro/offerta/badante/?entryPoint=sb","")

loop, 3  ;how many items
{
;extract selector and replace by %A_Index% number to increment:
;in this Example :
;item1:  body > div:nth-of-type(4) > div:nth-of-type(2) > div:nth-of-type(1) > ul > li:nth-of-type(1) > div > h3 > a
;item2:  body > div:nth-of-type(4) > div:nth-of-type(2) > div:nth-of-type(1) > ul > li:nth-of-type(2) > div > h3 > a

;then:
selector = body > div:nth-of-type(4) > div:nth-of-type(2) > div:nth-of-type(1) > ul > li:nth-of-type(%A_Index%) > div > h3 > a

tclick(selector)
var:=tread("body > main > section:nth-of-type(1) > div:nth-of-type(1) > h1", 0)
 
techo(var)

sleep, 1000

;return on result page
tnav("https://www.kijiji.it/offerte-di-lavoro/offerta/badante/?entryPoint=sb","")
}

Esc::ExitApp
ExitApp 
