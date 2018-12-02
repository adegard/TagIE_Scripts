#include TagIE.ahk 

msg = Great video thank you

loop, 10  ;how many result  you want to comment
{
;insert the query result page of youtube you want (or change search_Query):
tnav("https://www.youtube.com/results?search_query=automation","max")

sleep, 3000

selector = body > div:nth-of-type(2) > div:nth-of-type(4) > div > div:nth-of-type(5) > div > div > div > div:nth-of-type(1) > div > div:nth-of-type(2) > div:nth-of-type(1) > ol > li:nth-of-type(2) > ol > li:nth-of-type(%A_Index%) > div > div > div:nth-of-type(2) > h3 > a

tclick(selector, 0)

Sleep, 5000 

Loop 11
{
SendInput ^{Down}
Sleep, 200
}

Sleep, 4000 ;wait comments to load 

tclick("comment-simplebox-renderer-collapsed-content", 0)
Sleep, 100

SendInput {Raw} %msg%
Sleep, 1000

tclick("yt-uix-button yt-uix-button-size-default yt-uix-button-primary yt-uix-button-empty comment-simplebox-submit yt-uix-sessionlink", 0)
Sleep, 100

sleep, 3000

tsnap()

}


Sleep, 5000
pwb.Quit()
ExitApp  

Esc::ExitApp
 
 
 
 
