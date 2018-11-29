#include TagIE.ahk  
url := "https://finance.yahoo.com/quote/%5EDJI/history?p=%5EDJI"
tnav(url,"")
tscroll("table")
table2csv("DOW.csv")


Sleep, 5000
pwb.Quit()
ExitApp

;see demo, here: https://youtu.be/3At6jI1Ip1E