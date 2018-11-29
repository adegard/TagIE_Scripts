#include TagIE.ahk  

/*
StrX(Source Text, BeginStr,BeginOffset,BeginTrim, EndStr,EndOffset,EndTrim, NextOffset )
See: https://autohotkey.com/board/topic/47368-strx-auto-parser-for-xml-html/
*/

;insert url to feed RSS

UrlDownloadToFile, http://feeds.feedburner.com/LastTagIEScripts, ahkrss.xml   
FileRead, xml, ahkrss.xml   
                       
;control/update tags of each item and variables you want to extract (Title, Link)                       
While   Item  := StrX( xml ,  "<item>" ,N,0,  "</item>" ,1,0,  N )    
{
    Title := StrX( Item,  "<title>",1,7,  "</title>",1,8     )
    Link  := StrX( Item,  "<link>" ,1,6,  "</link>" ,1,7     )   
    List .= A_Index ") `t" Title "`t" Link "`n"   
}
   techo(List)

Sleep,4000

ExitApp
Esc::ExitApp 
 
 
