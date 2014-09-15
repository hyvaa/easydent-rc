;
; easydent-rc-pid-pano.ahk
;
; part of da2 project
; hyvaasoft@gmail.com
;
;
; This AutoHotKey file is to be complied to exe file.
; And to be run with argument.
; First argument is pid (chart number) to select

;-------------------------------------------------------------------


; -----------------------------------------------------------------

ifWinExist EasyDent 
{
	WinActivate 
} 
else
{
	run C:\EasyDent4\EdpV4\EasyDent4.exe
	winWaitActive EasyDent,,10
	
}



loop 10
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
		sleep, 300
		send ,%1%{enter}
		break
	}
	else 
	{
		;msgbox, not findit!
		sleep, 100
		imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 smode.bmp  
		if errorlevel = 0
		{
			MouseClick, left, vx+5 ,vy+5, 1
				
			sleep, 300
			;imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 smodei.bmp  
			;if errorlevel = 0
			;{	
			;	MouseClick, left, vx+5 ,vy+5,2
			;	continue
			;}
		}



	}

	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 smodei.bmp  
	if errorlevel = 0
	{	
		MouseClick, left, vx+5 ,vy+5,1
		;msgbox ok
		
	}
	sleep, 300
}

errorlevel=1

loop 10
{
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 pano.bmp
	if (errorlevel = 0)
	{
		sleep, 500
		MouseClick, left, vX+5 ,vY+5,2

		break
	}
	sleep, 300
}

Exitapp
