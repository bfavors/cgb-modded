
Func IdentifyTroopKind($SlotPos = 0)
	; capture troopbar
	Local $x1 = 0, $y1 = 600, $x2 = 860, $y2 = 660, $SlotComp
	_CaptureRegion($x1, $y1, $x2, $y2)

  If _ColorCheck(_GetPixelColor(828, 623 - $y1), Hex(0x70B3D8, 6), 10) Then; Check pixelcolor for Slot 11 # same color for all troops or spells
            ; compensate for slotlocation
            Switch $SlotPos
                Case 0 To 2, 4 To 7
                    $SlotComp -= 8
                Case Else
                    $SlotComp -= 7
            EndSwitch
        Else ; <= 10 Slots
            Switch $SlotPos
                Case 0 To 2, 4 To 7
                    $SlotComp = 0
                Case Else
                    $SlotComp = 1
            EndSwitch
        EndIf

; Test for Troops
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 645 - $y1), Hex(0xFCACA8, 6), 10) Then Return $eBarb	;Check if slot is Barbarian
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 645 - $y1), Hex(0x4A271F, 6), 10) Then Return $eArch		;Check if slot is Archer
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 645 - $y1), Hex(0x95E858, 6), 10) Then Return $eGobl		;Check if slot is Goblin
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 645 - $y1), Hex(0x9B563B, 6), 10) Then Return $eGiant		;Check if slot is Giant
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x60A4D0, 6), 20) And _
			_ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 610 - $y1), Hex(0x302A2A, 6), 20) Then Return $eWall    ;322c2c Check if slot is Wallbreaker
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0xF8F2D1, 6), 10) Then Return $eWiza		;Check if slot is Wizard # needs 2nd check?
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 590 - $y1), Hex(0xF8FAE0, 6), 5) Then Return $eHeal    ; Check if slot is Healers # needs 2nd check?
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 590 - $y1), Hex(0x791C10, 6), 10) And _
			_ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 638 - $y1), Hex(0x42301D, 6), 10) Then Return $eBall     ; Check if slot is Balloon
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 611 - $y1), Hex(0x31274A, 6), 20) And _
       _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 620 - $y1), Hex(0xF16530, 6), 20) Then Return $eDrag        ;Check if slot is Dragon
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 606 - $y1), Hex(0x52708E, 6), 10) Then Return $ePekk		;Check if slot is Pekka

	;Test for Dark Troops
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 589 - $y1), Hex(0x121e36, 6), 10) And _              		; 121e36  Check if slot is Minion
	   _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 620 - $y1), Hex(0x4481ae, 6), 20) Then Return $eMini		;Check if slot is Minion
	; If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x3D7FBB, 6), 20) Then Return $eMini		;Check if slot is Minion
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x603A30, 6), 10) Then Return $eHogs			;Check if slot is Hog Rider
  	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 601 - $y1), Hex(0xF8BDA3, 6), 10) Then Return $eValk	;Check if slot is Valkyrie # needs 2nd check?
  	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x49487D, 6), 10) And _
	   _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 625 - $y1), Hex(0x746A70, 6), 10) Then Return $eWitc		;Check if slot is Witch
  	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0xDCBCA0, 6), 10) Then Return $eGole		;Check if slot is Golem
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x685650, 6), 10) And _
	   _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 617 - $y1), Hex(0x535145, 6), 10) Then Return $eLava	;Check if slot is Lava Hound

	;Test for ClanCastle
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 642 - $y1), Hex(0xE8DF45, 6), 10) and _
	   _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 636 - $y1), Hex(0xE9E245, 6), 20) Then Return $eCastle		;Check if slot is Clan Castle
	;If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 585 - $y1), Hex(0x68ACD2, 6), 10) Then Return $eCastle		;Check if slot is Clan Castle

	;Test for Heroes
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 645 - $y1), Hex(0x2C2626, 6), 10) Then Return $eKing		;Check if slot is King
	;If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 585 - $y1), Hex(0x662CE6, 6), 10) Then Return $eQueen		;Check if slot is Queen
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 585 - $y1), Hex(0x682CE8, 6), 20) And _                       ;Check if slot is Queen crown
	   _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 575 - $y1), Hex(0xDBA328, 6), 20) Then Return $eQueen        ; and Check if slot is Queen

	;Test for Spells
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 632 - $y1), Hex(0x0426EC, 6), 10) Then Return $eLSpell		;Check if slot is Lightning Spell
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 632 - $y1), Hex(0x012CEF, 6), 10) Then Return $eLSpell		;Check if slot is Lightning Spell
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 632 - $y1), Hex(0xC3933E, 6), 20) Then Return $eHSpell		;Check if slot is Heal Spell
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 632 - $y1), Hex(0xC08E38, 6), 20) Then Return $eHSpell      ;Check if slot is Heal Spell
	If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 632 - $y1), Hex(0x6713B3, 6), 20) Then Return $eRSpell		;Check if slot is Rage Spell
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 632 - $y1), Hex(0x60179F, 6), 20) Then Return $eRSpell		;Check if slot is Rage Spell

    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 630 - $y1), Hex(0xD0E8C8, 6), 20) Then Return $eJSpell		;Check if slot is Jump Spell ; 139,623 #SLOT1
   ;If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 630 - $y1), Hex(0xD1EBC9, 6), 10) Then Return $eJSpell		;Check if slot is Jump Spell ; 141,623 #SLOT1
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x00B0DC, 6), 20) Then Return $eFSpell		;Check if slot is Freeze Spell ; 139,623 #SLOT1
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x00B2DC, 6), 20) Then Return $eFSpell		;Check if slot is Freeze Spell ; 140,623 #SLOT1
    If _ColorCheck(_GetPixelColor(68 + $SlotComp + (72 * $SlotPos), 595 - $y1), Hex(0x00B2D8, 6), 20) Then Return $eFSpell		;Check if slot is Freeze Spell ; 140,623 #SLOT1


	Return -1
EndFunc   ;==>IdentifyTroopKind


