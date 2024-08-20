; <COMPILER: v1.1.26.01>
#SingleInstance Force
#UseHook
#IfWinActive GTA:SA:MP
#InstallKeybdHook
#HotkeyInterval 100
#MaxHotkeysPerInterval 200
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
try
{
if A_IsCompiled
Run *RunAs "%A_ScriptFullPath%" /restart
else
Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
}
ExitApp
}
Version=1.4.4
ProgramName=SAMP Macro
FileInstall, SAMP.ico, SAMP.ico, 1
FileInstall, SAMP.ini, SAMP.ini
GoSub, Load
Menu, Tray, NoStandard
Menu, Tray, Add, Settings, Settings
Menu, Tray, Add, Exit, GuiClose
Menu, Tray, Default, Settings
Gui, Add,checkbox,x12 y270 h30 gOnTOP vontop, AlwaysOnTop
Gui, Add, Button, x212 y270 w70 h30 gSave, Save
Gui, Add, Button, x292 y270 w70 h30 gSubmit, Submit
Gui, Add, Button, x372 y270 w70 h30 gHide, Hide
Gui, Add, Tab, x2 y0 w450 h260 , Main|Messages #1|Messages #2|Hotstring|Settings|About Me
Gui,Tab,Settings
if (honoff="ERROR")
honoff:="F2"
gui,add,hotkey,x22 w60 vhonoff y60, %honoff%
if (hsendinput="ERROR")
hsendinput:="F3"
gui,add,hotkey,x22 w60 vhsendinput y95, %hsendinput%
Gui,add,checkbox,x92 y60 h15 vonoff checked%onoff%, De/Activate Hotkey in-game.`nEnable to activate/deactivate hotkey while in-game.
gui,add,checkbox,x92 y95 h15 vsendinput gsendinputbox checked%sendinput%, Send Mode Input / Play.`nChange messages send mode after hotkey as Input instead Play.
Gui, Add, GroupBox, x12 y20 w430 h230, Settings
Gui, Tab, Main
Gui, Add, GroupBox, x12 y20 w430 h230 , ActiveKey
Gui, Add,listview,x17 y35 w420 h210 vakey ,Hotkey / Hotstring|Messages
lv_add("",honoff,"Activate/Deactivate hotkeys in-game On/Off")
lv_add("",hsendinput,"Change messages send mode in-game to Input/Play")
Gui, Tab, Hotstring
gui,add,text,x22 y40 w100,Hotstring
gui,add,text,x+p w100,Messages
gui,add,text,x390 y40,Enter?
y=60
vc=1
Loop, 9 {
if (HSH%A_Index%="ERROR")
Gui, Add, Edit, x22 y%y% w100 h20 vHSH%A_Index%
else
Gui, Add, Edit, x22 y%y% w100 h20 vHSH%A_Index%, % HSH%A_Index%
if ((CH%A_Index%) && (CH%A_Index%!="ERROR"))
{
stringreplace,CHKey%a_index%,ch%a_index%, `+,Shift +%a_space%, All
stringreplace,CHKey%a_index%,chkey%a_index%, `!,Alt +%a_space%, All
stringreplace,CHKey%a_index%,chkey%a_index%, `^,Ctrl +%a_space%, All
lv_add("",CHKey%a_index%,CC%A_Index%)
}
if (HSC%A_Index%="ERROR")
Gui, Add, Edit, x122 y%y% w260 h20 vHSC%A_Index%
else
Gui, Add, Edit, x122 y%y% w260 h20 vHSC%A_Index%, % HSC%A_Index%
hscbb:=HSCB%A_Index%
Gui, Add, Checkbox,x390 y%y% w15 h20 vHSCB%A_index% checked%hscbb%
y:=y+20
}
y=0
Gui,Add,Button,x130 y270 w70 h30 gClearHS,Clear
Gui, Add, GroupBox, x12 y20 w430 h230 , Settings
Gui, Tab, Messages #1
gui,add,text,x22 y40 w100,Hotkey
gui,add,text,x+p,Message
gui,add,text,x390 y40,Enter?
y=60
vc=1
Loop, 9 {
if (CH%A_Index%="ERROR")
Gui, Add, Hotkey, x22 y%y% w100 h20 vCH%A_Index%
else
Gui, Add, Hotkey, x22 y%y% w100 h20 vCH%A_Index%, % CH%A_Index%
if ((MC%A_Index%) && (MC%A_Index%!="ERROR"))
{
stringreplace,MCKey%a_index%,MC%a_index%, `+,Shift +%a_space%, All
stringreplace,MCKey%a_index%,MCkey%a_index%, `!,Alt +%a_space%, All
stringreplace,MCKey%a_index%,MCkey%a_index%, `^,Ctrl +%a_space%, All
lv_add("",MCKey%a_index%,MM%A_Index%)
}
if (CC%A_Index%="ERROR")
Gui, Add, edit, x122 y%y% w260 h20 vCC%A_Index%
else
Gui, Add, Edit, x122 y%y% w260 h20 vCC%A_Index%, % CC%A_Index%
hscbb:=CB%A_Index%
Gui, Add, checkbox, x390 y%y% w15 h20 vCB%A_Index% checked%hscbb%
y:=y+20
}
y=0
y=60
vh=0
vc=1
Gui,Add,Button,x130 y270 w70 h30 gClearM1,Clear
Gui, Add, GroupBox, x12 y20 w430 h230 , Settings
Gui, Tab, Messages #2
gui,add,text,x22 y40 w100,Hotkey
gui,add,text,x+p,Message
gui,add,text,x390 y40,Enter?
Loop, 9 {
if (MC%A_Index%="ERROR")
Gui, Add, Hotkey, x22 y%y% w100 h20 vMC%A_Index%
else
Gui, Add, Hotkey, x22 y%y% w100 h20 vMC%A_Index%, % MC%A_Index%
if ((HSH%A_Index%) && (HSH%A_Index%!="ERROR"))
lv_add("",HSH%a_index%,HSC%A_Index%)
if (MM%A_Index%="ERROR")
Gui, Add, Edit, x122 y%y% w260 h20 vMM%A_Index%
else
Gui, Add, Edit, x122 y%y% w260 h20 vMM%A_Index%, % MM%A_Index%
hscbb:=MB%A_Index%
Gui, Add, Checkbox, x390 y%y% w15 h20 vMB%A_Index% checked%hscbb%
y:=y+20
}
y=0
Gui,Add,Button,x130 y270 w70 h30 gClearM2,Clear
Gui, Add, GroupBox, x12 y20 w430 h230 , Settings
Gui, Tab, About
Gui, Add, Picture, x382 y50 w40 h40 , SAMP.ico
Gui, Add, Text, x22 y40 w230 h70 , Program Name`nProgram Version`nLanguage`nCopyright`nContact
Gui, Add, Text, x112 y40 w200 h70 +Left, : SA:MP Macro`n: 1.4.4.0`n: English (en-US)`n: (c) 2014-2017 by Jheb Krueger`n:
Gui, Add, Text, x118 y92 h13 cblue glink1 vURL_link1, Facebook |
Gui, Add, Text, x169 y92 h13 cblue glink2 vURL_link2, | Twitter
Gui, Add, Text, x22 y140 w450 h110 , Messages: e.g.`nDesc: Automatically type '/examine' + (A_Space) after you press [ALT+1].`n`nMessages: e.g.`nDesc: Automaticly do 'hands up.' with '/do' after you press [ALT+2].`n`nHotstring: e.g.`nDesc: Change '<mechsms>' in your chat, e.g. "/sms 1181388 <mechsms>".
Gui, Add, Edit, x127 y130 w65 h20 +Disabled, Alt + 1
Gui, Add, Edit, x197 y130 w200 h20 +Disabled, /examine
gui,add,checkbox, x402 y130 w15 h20 +disabled
Gui, Add, Edit, x127 y170 w65 h20 +Disabled, Alt + 2
Gui, Add, Edit, x197 y170 w200 h20 +Disabled, /do hands up.
gui,add,checkbox, x402 y170 w15 h20 +disabled checked
Gui, Add, Edit, x127 y210 w65 h20 +Disabled, <mechsms>
Gui, Add, Edit, x197 y210 w200 h20 +Disabled, Mechanic is here, where are you?
gui,add,checkbox, x402 y210 w15 h20 +disabled
Gui, Add, GroupBox, x12 y20 w430 h230 , Info
Gui, Add, GroupBox, x12 y115 w430 h10, Example
Process, Exist
Pid_this := errorlevel
winget, hw_gui, id, ahk_class autohotkeygui ahk_pid %pid_this%
WM_SETCURSOR = 0x20
OnMessage(WM_SETCURSOR, "HandleMessage")
WM_MOUSEMOVE = 0x200
OnMessage(WM_MOUSEMOVE, "HandleMessage")
GoSub, HotkeyOn
IniRead, RL, SAMP.ini, Temp, RL
If (RL=1) {
IniWrite, 0, SAMP.ini, Temp, RL
TrayTip, SAMP.exe by Jheb Krueger, Double Click to Show Settings.,5
}
Else
Gui, Show, Center h305 w450,%ProgramName% %Version%
keystatus:=1
return
HotkeyFunction:
gui,submit,nohide
if !onoff
{
send, {%honoff%}
return
}
keystatus:=!keystatus
if keystatus
{
while GetKeyState(honoff, "p")
{
if !sendinput
send, {numpadenter}{t}((On: Hotkey Activated.))
else if sendinput
sendinput, {numpadenter}{t}((On: Hotkey Activated.))
keywait, %honoff%
}
sleep, 100
sendinput, {backspace 55}{enter}
}
else if !keystatus
{
while GetKeyState(honoff, "p")
{
if !sendinput
send, {numpadenter}{t}((Off: Hotkey Deactivated.))
else if sendinput
sendinput, {numpadenter}{t}((Off: Hotkey Deactivated.))
keywait, %honoff%
}
sleep, 100
sendinput, {backspace 55}{enter}
}
return
ontop:
gui,submit,nohide
if ontop
Gui, +AlwaysOnTop
else
Gui, -AlwaysOnTop
return
ClearHS:
gui,submit,nohide
loop, 9
{
guicontrol,,hsh%A_Index%,`
guicontrol,,hsc%A_Index%,`
guicontrol,,hscb%A_Index%,0
}
return
ClearM1:
gui,submit,nohide
loop, 9
{
guicontrol,,ch%A_Index%,`
guicontrol,,cc%A_Index%,`
guicontrol,,cb%A_Index%,0
}
return
ClearM2:
gui,submit,nohide
loop, 9
{
guicontrol,,mc%A_Index%,`
guicontrol,,mm%A_Index%,`
guicontrol,,mb%A_Index%,0
}
return
Link1:
Run, http://fb.com/jhebkv
return
Link2:
Run, http://twitter.com/jhebkv
return
CB1:
CB2:
CB3:
CB4:
CB5:
CB6:
CB7:
CB8:
CB9:
gui,submit,nohide
StringRight,No,A_ThisLabel,1
thiskey:="CH" . No
thiskey:=%thiskey%
if onoff
if honoff
if !keystatus
return
stringleft,key,thiskey,1
if ((key="+") or (key="^") or (key="!"))
Stringreplace,thiskey,thiskey,+,,All
Stringreplace,thiskey,thiskey,^,,All
Stringreplace,thiskey,thiskey,!,,All
while GetKeyState(thiskey, "p")
{
CCX:="CC" . No
stringreplace,%CCX%,%CCX%,+,{+},all
stringreplace,%CCX%,%CCX%,!,{!},all
stringreplace,%CCX%,%CCX%,^,{^},all
stringreplace,%CCX%,%CCX%,#,{#},all
if !sendinput
{
if (%A_Thislabel%=1)
send, % "{numpadenter}{t}" %CCX% "{enter}"
else
send, % "{numpadenter}{t}" %CCX% "{space}"
}
else if sendinput
{
if (%A_Thislabel%=1)
sendinput, % "{numpadenter}{t}" %CCX% "{enter}"
else
sendinput, % "{numpadenter}{t}" %CCX% "{space}"
}
keywait, %thiskey%
}
key:=
thiskey:=
CCX:=
return
MB1:
MB2:
MB3:
MB4:
MB5:
MB6:
MB7:
MB8:
MB9:
gui,submit,nohide
StringRight,No,A_ThisLabel,1
thiskey:="MC" . No
thiskey:=%thiskey%
if onoff
if honoff
if !keystatus
return
stringleft,key,thiskey,1
if ((key="+") or (key="^") or (key="!"))
Stringreplace,thiskey,thiskey,+,,All
Stringreplace,thiskey,thiskey,^,,All
Stringreplace,thiskey,thiskey,!,,All
while GetKeyState(thiskey, "p")
{
MMX:="MM" . No
stringreplace,%MMX%,%MMX%,+,{+},all
stringreplace,%MMX%,%MMX%,!,{!},all
stringreplace,%MMX%,%MMX%,^,{^},all
stringreplace,%MMX%,%MMX%,#,{#},all
if !sendinput
{
if (%A_Thislabel%=1)
send, % "{numpadenter}{t}" %MMX% "{enter}"
else
send, % "{numpadenter}{t}" %MMX% "{space}"
}
else if sendinput
{
if (%A_Thislabel%=1)
sendinput, % "{numpadenter}{t}" %MMX% "{enter}"
else
sendinput, % "{numpadenter}{t}" %MMX% "{space}"
}
keywait, %thiskey%
}
key:=
thiskey:=
MMX:=
return
sendinputbox:
sendinput:=!sendinput
if !sendinput
guicontrol,,sendinput,0
else if sendinput
guicontrol,,sendinput,1
while GetKeyState(hsendinput, "p")
{
if !sendinput
send, {numpadenter}{t}((Send Mode: Play.))
else if sendinput
sendinput, {numpadenter}{t}((Send Mode: Input.))
keywait, %hsendinput%
}
IfWinActive GTA:SA:MP
{
sleep, 100
sendinput, {backspace 55}{enter}
}
return
Submit:
Gui, Submit, NoHide
GoSub, Save
Reload
return
Hide:
Gui, Submit
GoSub, Save
IniWrite, 1, SAMP.ini, Temp, RL
Reload
return
Save:
Gui, Submit, NoHide
iniwrite,%honoff%,SAMP.ini, Main,OnOffKey
iniwrite,%onoff%,SAMP.ini,Main,OnOffStatus
iniwrite,%sendinput%,SAMP.ini,Main,SendMode
iniwrite,%hsendinput%,SAMP.ini,Main,SendModeKey
Loop, 9 {
IniWrite, % CH%A_Index%, SAMP.ini, HotkeyA, CH%A_Index%
IniWrite, % CC%A_Index%, SAMP.ini, MessageA, CC%A_Index%
IniWrite, % CB%A_Index%, SAMP.ini, EnterA, CB%A_Index%
}
Loop, 9 {
IniWrite, % MC%A_Index%, SAMP.ini, HotkeyB, MC%A_Index%
IniWrite, % MM%A_Index%, SAMP.ini, MessageB, MM%A_Index%
IniWrite, % MB%A_Index%, SAMP.ini, EnterB, MB%A_Index%
}
Loop, 9 {
IniWrite, % HSH%A_Index%, SAMP.ini, HotString, HSH%A_Index%
IniWrite, % HSC%A_Index%, SAMP.ini, HotStringM, HSC%A_Index%
IniWrite, % HSCB%A_Index%, SAMP.ini, HotStringE, HSCB%A_Index%
}
return
Load:
Gui, Submit, NoHide
iniread,honoff,SAMP.ini, Main,OnOffKey
iniread,onoff,SAMP.ini,Main,OnOffStatus
iniread,sendinput,SAMP.ini,Main,SendMode
iniread,hsendinput,SAMP.ini,Main,SendModeKey
Loop, 9 {
IniRead, CH%A_Index%, SAMP.ini, HotkeyA, CH%A_Index%
IniRead, CC%A_Index%, SAMP.ini, MessageA, CC%A_Index%
IniRead, CB%A_Index%, SAMP.ini, EnterA, CB%A_Index%
}
Loop, 9 {
IniRead, MC%A_Index%, SAMP.ini, HotkeyB, MC%A_Index%
IniRead, MM%A_Index%, SAMP.ini, MessageB, MM%A_Index%
IniRead, MB%A_Index%, SAMP.ini, EnterB, MB%A_Index%
}
Loop, 9 {
IniRead, HSH%A_Index%, SAMP.ini, HotString, HSH%A_Index%
IniRead, HSC%A_Index%, SAMP.ini, HotStringM, HSC%A_Index%
IniRead, HSCB%A_Index%, SAMP.ini, HotStringE, HSCB%A_Index%
}
return
HotkeyOn:
gui,submit,nohide
if ((onoff!="") and (onoff != "ERROR"))
if ((honoff!="") and (honoff != "ERROR"))
Hotkey,%honoff%,HotkeyFunction, On
if ((hsendinput!="") and (hsendinput != "ERROR"))
Hotkey,%hsendinput%,SendInputBox, On
Loop 9
{
If ((CH%A_Index% != "") and (CH%A_Index% != "ERROR"))
Hotkey, % "~$" . CH%A_Index%, CB%A_Index%, On
If ((MC%A_Index% != "") and (MC%A_Index% != "ERROR"))
Hotkey, % "~$" . MC%A_Index%, MB%A_Index%, On
If ((HSH%A_Index% != "") and (HSH%A_Index% != "ERROR"))
{
if (!HSCB%A_Index%)
{
HSTR(hsh%A_index%,hsc%A_index%)
}
else
{
HSTR(hsh%A_index%,hsc%A_index% . "{numpadenter}")
}
}
}
return
Settings:
Gui, Show
return
GuiClose:
ExitApp
return
HandleMessage(p_w, p_l, p_m, p_hw)
{
global   WM_SETCURSOR, WM_MOUSEMOVE,
static   URL_hover, h_cursor_hand, h_old_cursor, CtrlIsURL, LastCtrl
If (p_m = WM_SETCURSOR)
{
If URL_hover
Return, true
}
Else If (p_m = WM_MOUSEMOVE)
{
StringLeft, CtrlIsURL, A_GuiControl, 3
If (CtrlIsURL = "URL")
{
If URL_hover=
{
Gui, Font, cBlue underline
GuiControl, Font, %A_GuiControl%
LastCtrl = %A_GuiControl%
h_cursor_hand := DllCall("LoadCursor", "uint", 0, "uint", 32649)
URL_hover := true
}
h_old_cursor := DllCall("SetCursor", "uint", h_cursor_hand)
}
Else
{
If URL_hover
{
Gui, Font, norm cBlue
GuiControl, Font, %LastCtrl%
DllCall("SetCursor", "uint", h_old_cursor)
URL_hover=
}
}
}
}
hstr(k, a = "")
{
static z, s, t, w = 2000, sd, d = "Left,Right,Up,Down,Home,End,RButton,LButton", m="*~$"
global $
If z =
{
RegRead, sd, HKCU, Control Panel\International, sDecimal
Loop, 94
{
c := Chr(A_Index + 32)
If A_Index not between 33 and 58
Hotkey, %m%%c%, __hs
}
e = 0,1,2,3,4,5,6,7,8,9,Dot,Div,Mult,Add,Sub,Enter
Loop, Parse, e, `,
Hotkey, %m%Numpad%A_LoopField%, __hs
e = BS,Space,Enter,Return,Tab,%d%
Loop, Parse, e, `,
Hotkey, %m%%A_LoopField%, __hs
z = 1
}
If (a == "" and k == "")
{
StringTrimLeft, q, A_ThisHotkey, StrLen(m)
If q = BS
{
If (SubStr(s, 0) != "}")
StringTrimRight, s, s, 1
}
Else If q in %d%
s =
Else
{
If q = Space
q := " "
Else If q = Tab
q := "`t"
Else If q in Enter,Return,NumpadEnter
q := "`n"
Else If (RegExMatch(q, "Numpad(.+)", n))
{
q := n1 == "Div" ? "/" : n1 == "Mult" ? "*" : n1 == "Add" ? "+" : n1 == "Sub" ? "-" : n1 == "Dot" ? sd : ""
If n1 is digit
q = %n1%
}
Else If (StrLen(q) != 1)
q = {%q%}
Else If (GetKeyState("Shift") ^ GetKeyState("CapsLock", "T"))
StringUpper, q, q
s .= q
}
Loop, Parse, t, `n
{
StringSplit, x, A_LoopField, `r
If (RegExMatch(s, x1 . "$", $))
{
StringLen, l, $
StringTrimRight, s, s, l
SendInput, {BS %l%}
If (IsLabel(x2))
Gosub, %x2%
Else
{
Transform, x0, Deref, %x2%
SendInput, %x0%
}
}
}
If (StrLen(s) > w)
StringTrimLeft, s, s, w // 2
}
Else
{
StringReplace, k, k, `n, \n, All
StringReplace, k, k, `r, \r, All
Loop, Parse, t, `n
{
l = %A_LoopField%
If (SubStr(l, 1, InStr(l, "`r") - 1) == k)
StringReplace, t, t, `n%l%
}
If a !=
t = %t%`n%k%`r%a%
}
Return
__hs:
hstr("", "")
Return
}