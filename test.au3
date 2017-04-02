#include <GUIConstantsEx.au3>
#include <Array.au3>
#include <EditConstants.au3>

Global Const $Font = "Tahoma"
Global Const $FontSize = 9
$GUI_Width = 450
$GUI_Height = 240
$GUIButtonW = 70
$GUIButtonH = 30
$Width = 75
$Height = 20
$Left = 40
$Top = 50
GUICreate("ทดสอบเก็บค่า", 300, 100)
$MoveTo = GUICtrlCreateButton("เซฟค่า", $Left+15, $Top-45, $GUIButtonW+10, $GUIButtonH-6)
 $showBtn = GUICtrlCreateButton("แสดงค่า", 110, $Top, $GUIButtonW+10, $GUIButtonH-6)
$MoveToX = GUICtrlCreateInput("", $Left+100, $Top-45, $GUIButtonW-25, $GUIButtonH-7,0x2000)
GUICtrlSendMsg($MoveToX, $EM_SETCUEBANNER, False, "พิกัดX")
$MoveToZ = GUICtrlCreateInput("", $Left+150, $Top-45, $GUIButtonW-25, $GUIButtonH-7,0x2000)
GUICtrlSendMsg($MoveToZ, $EM_SETCUEBANNER, False, "พิกัดZ")
GUISetState(@SW_SHOW)

Dim $arrayPositons[0][2]

While 1
Switch GUIGetMsg()
Case $GUI_EVENT_CLOSE
ExitLoop
Case $MoveTo
SaveMoveTo()
Case $showBtn
showValue()
EndSwitch
WEnd

Func SaveMoveTo()
Local $GetX = GUICtrlRead($MoveToX)
Local $GetZ = GUICtrlRead($MoveToZ)

Local $positon[1][2]
$positon[0][0] =  $GetX
$positon[0][1] =   $GetZ

_ArrayAdd($arrayPositons, $positon)

MsgBox(0, "เก็บค่าเรียบร้อย", "ค่า X : "&$GetX & @CRLF & "ค่า Z : "&$GetZ, 1)
EndFunc



Func showValue()

$sizeArray = UBound ($arrayPositons,1)

if $sizeArray > 0 Then

	$index= Random(0,($sizeArray-1),1)

	MsgBox(0, "ค่าที่ได้ ", "ค่า X : "&$arrayPositons[$index][0] & @CRLF & "ค่า Z : "&$arrayPositons[$index][1], 3000)

EndIf

EndFunc
