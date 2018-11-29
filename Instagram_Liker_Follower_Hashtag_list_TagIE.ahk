#include TagIE.ahk 

;Like and Follow for posts on Hashtags:
;launch it daily on 2-5 posts and for 5 to 10 hashtag
;(you must save password before)
;put hashtag list (one by row) in a file: \hashtags.txt
;(search correlate hashtag from https://www.all-hashtag.com)
;original idea from @talymo https://github.com/talymo/instaAutomate
;@adegard - Works with TagIE version 1.1.04 (please check yours)

    ; Get list of hashtags from hashtags text file 
    hashtags := Object()
    Loop, read, % A_ScriptDir "\hashtags.txt"
        hashtags[A_Index] := A_LoopReadLine

    ; How many posts we want to like
    Posts = 3 

    ; How many posts we have liked
    LikedPosts = 0;

            ; Set Variables for Like action Interval (x100 millisec)
            low = 2
            high = 40

    For i in hashtags {

        ; The hashtag we want to like
        hash := hashtags[i]

        StringReplace , hash, hash, %A_Space%,,All

        HashTag := hash

        ; Stuff we need for the script to work
        myUrl = https://www.instagram.com/explore/tags/%HashTag%/
      
        tnav(myUrl,"")
        Sleep 3000

        ; Loop through n  posts
        Loop, %Posts% {

	selector =#react-root > section > main > article > div.EZdmt > div > div > div:nth-child(2) > div:nth-child(%A_Index%) > a > div > div._9AhH0

	tclick(selector)

            Random, Time_To_Wait, low, high
	Time := Time_To_Wait * 500
	techo(Time " millisec")
               Sleep, Time


	;heart clicking
	tclick("glyphsSpriteHeart__outline__24__grey_9 u-__7")

            Random, Time_To_Wait, low, high
	Time := Time_To_Wait * 500
	techo(Time " millisec")
               Sleep, Time
	
	;click on Follow
	tclick("oW_lN _0mzm- sqdOP yWX7d       ")
	
	;cancel action to avoid unfollow
	tclick("aOOlW   HoLwm ")

            Random, Time_To_Wait, low, high
	Time := Time_To_Wait * 500
	techo(Time " millisec")
               Sleep, Time

	;close post
	tclick("ckWGn")

        }

}

;send yourself telegram msg when finish


Sleep, 5000
pwb.Quit()
ExitApp

Esc::ExitApp
 
 
