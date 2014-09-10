;
; ahk-easydent-chn.ahk
;
; part of da2 project
; hyvaasoft@gmail.com
;
;
; This AutoHotKey file is to be complied to exe file.
; And to be run with argument.
; First argument is chart-number to select

;-------------------------------------------------------------------


; -----------------------------------------------------------------

ifWinExist EasyDent 
{
	WinActivate 
} 
else
{
	run C:\EasyDent4\EdpV4\EasyDent4.exe
	winWaitActive EasyDent
}



loop 1
{
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 chn1.bmp
	if (errorlevel != 0) 
	{ 
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 chn2.bmp 
	}
	if (errorlevel != 0) 
	{ 
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 chn3.bmp  
	}
	if errorlevel = 0
	{		
		MouseClick, left, vx+5 ,vy+5,2
		send ,%1%{enter}
		break
	}
	else 
	{
		;msgbox, not findit!
		
	}
}

imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 pano.bmp
if (errorlevel = 0)
{
	MouseClick, left, vx+5 ,vy+5,2
}

Exitapp
