; Uses the getGold,getElixir... functions and uses CompareResources until it meets conditions.
; Will wait ten seconds until getGold returns a value other than "", if longer than 10 seconds exits

;HungLe from gamebot.org
Func GetResources() ;Reads resources

	$SearchCount += 1 ; Counter for number of searches
	SetLog(StringFormat("%3s", $SearchCount) & "> [G]:" & StringFormat("%7s", 0) & " [E]:" & StringFormat("%7s", 0) & " [D]:" & StringFormat("%5s", 0) & " [T]:" & StringFormat("%2s", 0) & 0, $COLOR_BLACK, "Lucida Console", 7.5)

EndFunc   ;==>GetResources
