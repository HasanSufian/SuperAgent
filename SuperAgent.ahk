;@Ahk2Exe-SetCompanyName Hassan Sofian AbdElshakour
;@Ahk2Exe-SetCopyright © Hassan Sofyan. All rights reserved
;@Ahk2Exe-SetDescription SuperAgent (by Hassan Sofian)
;@Ahk2Exe-SetVersion 0.0.0.1
;@Ahk2Exe-SetName SuperAgent
;@Ahk2Exe-SetMainIcon C:\Users\tmp217187\Downloads\superhero.ico
; checkDate()
/*
Made by: Hassan Sofian Abdelshakor Tawfik
mail: hassansofean37@gmail.com
*/
#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
global appName:= "SuperAgent"
Gui, main:New,

Menu, Tray, UseErrorLevel
Menu, Tray, NoStandard
menu,tray,icon
Menu, Tray, Icon, C:\Users\tmp217187\Downloads\superhero.ico
Menu, Tray, Add, &Show, ShowHideGUI
Menu, Tray, Add, E&xit, Exitapp_tray
Menu, Tray, Tip ,%appName%:`nRunning

Gui,Font,s8 norm,Segoe UI
Gui,Add,Text, x230 y16 ca7a7a7 BackgroundTrans,Made by
Gui,Add,link, x450 y28 h15 gsendMail,<a href="">Contact</a>
Gui,Font,s12 bold,Segoe UI
Gui,Add,Text, x230 y23 BackgroundTrans ca7a7a7,Hassan Sofian AbdElshakor
Gui,Font,s10 norm,Segoe UI
Gui,Add,tab3,h500 x1 y20 w500,Tools|Main||
Gui,Font,s10 norm,Segoe UI
gui,add,DropDownList,x70 y70 w95 vselectedItem gitem ,Ping|Tracert|FlushDNS|IP configration|nslookup
Gui,Add,edit,vBox x175 y70 h25 w150 ,10.190.0.12
gui,add,Button,y69 h27 x10 w50 grunCMD,Run
gui,add,text,,
(LTrim
`nPress "Windows logo + s" for immediate full screen capture.`nScreenshot "Capture.png" will be saved to %appName% location.
    )
gui,add,Button,ghide x10 y260 w70 h25,Hide

gui,tab,2
Gui,add,text,x10 y65,
(LTrim
IP Address

Computer Name : %A_ComputerName%
)
Gui,add,text,x80 y65 h25 w175,%A_IPAddress1% , %A_IPAddress2%
gui,add,Button,grefresh y65 x265 h25,refresh
gui,add,Button,ghide x10 y260 w70 h25,Hide
Gui, Show,w500 h300, %appName%
avayaExt()
avayaNotePad()
; answer() function should be last one to be called before return
answer()
Return
; ----------------------
; Functions
; ----------------------

; date-checker function
checkDate(){
    if (A_YYYY = 2022 and A_MM < 12){

    }Else{
        MsgBox 0x31, %appName%, This version is old. Refer to developer for new version of the software.`nDo you want to contact him now?

        IfMsgBox OK, {
            Run,mailto:hassansofean37@gmail.com?cc=he217187@te.eg&body=`%0a`%0a`%0a`%0a`%0a%A_ComputerName%`%0a%A_UserName%`%0a%A_OSType%`%0a%A_OSVersion%

        } Else IfMsgBox Cancel, {

        }

        ExitApp
    }
}
refresh(){
    GuiControl, Text, edit2,%A_IPAddress1% , %A_IPAddress2%
}
; browse(){
;     gui main:+OwnDialogs
;     FileSelectFolder, sfolder, ::{20d04fe0-3aea-1069-a2d8-08002b30309d},3,Prompt ; My Computer.
;     ControlSetText, Edit1, %sfolder%
; }
; contactWin(){
;     global WNumber
;     global mailMSG
;     Gui main:+Disabled
;     Gui contact:new,-SysMenu +Ownermain
;     gui,font,s10
;     ; gui,add,text,,Enter your name:
;     ; gui,add,edit,,
;     gui,add, text,,Enter Your WhatsApp number:
;     gui,add,edit,Number Limit11 vWNumber w150,01
;     gui,add,text,,Write your message:
;     gui,add,edit,x5 w290 r10 vmailMSG
;     gui,add,Button,gback x5 y265,<< Back
;     gui,add,Button,gsendMail x215 y265 w80,Send mail
;     gui contact:show,w300 h300, contact
; }

; avaya extension 
avayaExt(){
    hParent := WinExist("ahk_exe onexcui.exe")
    Gui avayaExtWin:New,+AlwaysOnTop -Caption HWNDhChild
    Gui avayaExtWin: Margin, 0, 0
    Gui, Add, Button,h20 x0 y0 gavayaExtBtn, %appName%
    DllCall("SetParent", Ptr, hChild, Ptr, hParent)
    Gui avayaExtWin:Show, x100 y7
}
; notepad
avayaNotePad(){
    hParent := WinExist("ahk_exe onexcui.exe")
    Gui avayaNote:New,+AlwaysOnTop -Caption HWNDhChild
    Gui avayaNote: Margin, 0, 0
    Gui, Add, text,h20 x0 y0 cRed,Break(15) after 1 m
    DllCall("SetParent", Ptr, hChild, Ptr, hParent)
    Gui avayaNote:Show, x185 y7
}

; a function to answer calls
answer(){
    ch1:
        if( WinExist("Incoming call...")){
            Sleep,10
            SendInput, {Alt down}{Ctrl down}{a down}
            SendInput, {Alt up}{Ctrl up}{a up}
            WinWait, Incoming call...
            ; WinActivate, ahk_exe onexcui.exe
            ; if (ShowAvaya = 1){
            WinActivate, ahk_exe onexcui.exe
            ; }
            avayaExt()
            avayaNotePad()
            Goto, ch1
        }Else{
            Goto, ch1
        }
    Return
}

; shows UI
show(){
    Gui,main:Show
}

hide(){
    Gui,main:Hide
    TrayTip, %appName% is hidden,Right-click the icon and press "Show" to show it again, 3
}

; screenshot capture
screenShot(){
    CaptureScreen("0,65,1319, 721",False,location,100) ; save to location
    ; CaptureScreen(,False,,100) ; save to clipboard
    Convert("screen.bmp","C:\Users\tmp217187\Music\IU\IU Capture.png")
    TrayTip,Screenshot Saved, ScreenShot saved to `n%appName% location, 5
}

; --------------------------
; Hotkeys
; -------------------------

#s::
    screenShot()
Return

; -------------------------------
; Lables
; --------------------------------
isChecked:
    Gui main:Submit,NoHide
Return
sendMail:
    Run,mailto:hassansofean37@gmail.com?cc=he217187@te.eg&body=`%0a`%0a`%0a`%0a`%0a%A_ComputerName%`%0a%A_UserName%`%0a%A_OSType%`%0a%A_OSVersion%

Return
back:
    gui main:-disabled
    gui contact:Destroy
Return

item:
    gui main:Submit,NoHide
    if (selectedItem=="Ping" or selectedItem=="Tracert" or selectedItem=="nslookup"){
        Control,show,,edit1
    }Else{
        Control, hide,,edit1
    }
Return
runCMD:
    Gui main:Submit,NoHide
    if (selectedItem == "Ping"){
        run %ComSpec% /k color f0 && title %appName% && ping %Box%
    }else if (selectedItem == "Tracert"){
        run,cmd.exe /k color f0 && title %appName% && tracert %Box%
    } else if (selectedItem=="FlushDNS"){
        gui main:+OwnDialogs
        MsgBox, 4, %appName% - DNS cache reset,You are about to reset the contents of the DNS client resolver cache.`nDo you want to continue?
        IfMsgBox Yes
        run,cmd.exe /k color f0 && title %appName% && ipconfig /flushdns
    }else if (selectedItem=="Open CMD"){
        run,cmd.exe /k color f0 && title %appName%
    }else if (selectedItem=="IP configration"){
        run,cmd.exe /k color f0 && title %appName% && ipconfig
    }else if (selectedItem=="nslookup"){
        run,cmd.exe /k color f0 && title %appName% && nslookup %Box%
    }
Return

avayaExtBtn:
    show()
Return
ShowHideGUI:
    show()
Return

WhatsApp:
    Run,https:\\wa.me\01554545934?text=Hi
Return

AboutEscape:
    Gui main: -Disabled
    Gui About: Destroy
Return
mainGuiClose:
    Gui main:+OwnDialogs
    MsgBox,260, %appName%, You are about to exit the app.`nAre you sure?
    IfMsgBox Yes, {
        Gui main:Destroy
        ExitApp
    }

return
Exitapp_tray:
    gui main:Destroy
ExitApp
; -------------------------------------
; Includes
; -------------------------------------

#Include, C:\Users\tmp217187\Desktop\Dev\#Include, Files\CaptureScreen.ahk
#Include, C:\Users\tmp217187\Desktop\Dev\#Include, Files\Build_Components.ahk
#Include, C:\Users\tmp217187\Desktop\Dev\components\showNotePad.ahk

; TODO
; start app at sys start