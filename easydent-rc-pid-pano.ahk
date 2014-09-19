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
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/chn1.bmp
	if (errorlevel != 0) 
	{ 
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/chn2.bmp 
	}
	if (errorlevel != 0) 
	{ 
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/chn3.bmp  
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
		;msgbox, not findit! ;다른 이미지가 떠있어서 버튼이 안보이는 것이니 화면모드 버튼을 누른다. 
		sleep, 100
		imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/smode.bmp  
		if errorlevel = 0
		{
			MouseClick, left, vx+5 ,vy+5, 1
				
			sleep, 300
			;imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/smodei.bmp  
			;if errorlevel = 0
			;{	
			;	MouseClick, left, vx+5 ,vy+5,2
			;	continue
			;}
		}



	}

	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/smodei.bmp  
	if errorlevel = 0  ;화면모드 버튼이 눌리면 초기화면 버튼이보인다. 보이면 눌러준다.
	{	
		MouseClick, left, vx+5 ,vy+5,1
		;msgbox ok
		
	}
	sleep, 300
}

errorlevel=1

loop 10
{
	imagesearch, vX,vY, 0,0,A_ScreenWidth, A_ScreenHeight, *10 images/pano.bmp
	if (errorlevel = 0)
	{
		sleep, 500
		MouseClick, left, vX+5 ,vY+5,2

		break
	}
	sleep, 300
}

Exitapp
