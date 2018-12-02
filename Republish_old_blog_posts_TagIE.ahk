
#include TagIE.ahk  
#include TagIE_Social_sharing.ahk

;Social Media Sharer functions for TagIE Browser Automation
;Works withTagIE Editor and Functions, version 1.1.04 (and above)
;https://github.com/adegard/TagIE.ahk/
 

String := "growth hacking,autohotkey,automation,Robotic Process Automation"

Cate := []      ; creates initialy empty OBJECT (simple array)
Loop, parse, String, `,
Cate.Insert(A_LoopField)      ; inserts elements in object

;Randomize category to republish*******************
Random, numcat, 1, 4

caturl :="https://simplestipsandtricks.blogspot.com/search/label/"Cate[numcat]

tnav(caturl,"")

Sleep, 3000

; Shows posts number
Max:=pwb.document.getElementsByClassName("post-title entry-title").length

;Randomize post to republish*********************
Random, num, 3, Max

selector =#Blog1 > div.blog-posts.hfeed > div:nth-child(%num%) > div > div > div > h3 > a

tclick(selector, 0)

Sleep, 3000

    WinActivate ahk_class IEFrame
    ControlFocus, Internet Explorer_Server1, ahk_class IEFrame
    pwb := PWB_Init(WinTitle) ; replaces WinGetTitle and PWB_Get()

Link:=pwb.LocationURL 	;grab current url

techo(Link)
 
;*************Post on LINKEDIN**************
linkedinprof(Link)

Sleep, 1000

;*************Post on various FACEBOOK groups**************
fbgroup(Link, "seo")
Sleep, 1000

;**************Post on various FACEBOOK page*************************
fbpage(Link, "Pc-Dream") 

Sleep,1000


ExitApp
Esc::ExitApp 
 
