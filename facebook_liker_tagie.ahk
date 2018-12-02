#include TagIE.ahk 
tnav("https://www.facebook.com/","")

Sleep, 2000

loop, 10  ;how many items to Like
{

Sleep, 1000

loop, 5
{
SendInput, {WheelDown}
sleep, 1000
}

selector =body > div:nth-of-type(1) > div:nth-of-type(3) > div:nth-of-type(1) > div > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(2) > div > div:nth-of-type(5) > div > div > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(1) > div > div > div > div:nth-of-type(%A_Index%) > div > div > div:nth-of-type(3) > div:nth-of-type(2) > form > div:nth-of-type(1) > div > div > div > div:nth-of-type(2) > div > div > span:nth-of-type(1) > div > a

tclick(selector, 0)
} 

pwb.Quit()
ExitApp 
