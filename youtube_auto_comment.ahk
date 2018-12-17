#include TagIE.ahk 

msg= Great video thank you
query=business

myurl=https://www.youtube.com/results?search_query=%query%
techo(msg)

loop, 10  ;how many result  you want to comment
{
;insert the query result page of youtube you want (or change search_Query):
tnav(myurl,"max")

sleep, 3000

selector = body > div:nth-of-type(2) > div:nth-of-type(4) > div > div:nth-of-type(5) > div > div > div > div:nth-of-type(1) > div > div:nth-of-type(2) > div:nth-of-type(1) > ol > li:nth-of-type(2) > ol > li:nth-of-type(%A_Index%) > div > div > div:nth-of-type(2) > h3 > a


;Wait for Selector, frame number (0:disabled) 
twaitSelector(selector, 0)
tclick(selector, 0)


Sleep, 5000 

Loop 6
{
SendInput ^{Down}
Sleep, 200
}


;Wait for Selector, frame number (0:disabled) 
twaitSelector("comment-simplebox-renderer-collapsed-content", 0)


techo("CLICK IN COMMENT BOX")
tclick("comment-simplebox-renderer-collapsed-content", 0)
Sleep, 300

SendInput {Raw} %msg%


Sleep, 2000


tclick("yt-uix-button yt-uix-button-size-default yt-uix-button-primary yt-uix-button-empty comment-simplebox-submit yt-uix-sessionlink", 0)
Sleep, 100

sleep, 3000

tsnap()

}


Sleep, 5000
pwb.Quit()
ExitApp  

Esc::ExitApp
