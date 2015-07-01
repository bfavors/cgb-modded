;Checks for your Barrack, Dark Barrack or Spell Factory

Func isBarrack($page)
	Return $page <> 1 And $page <= 5
EndFunc   ;==>isBarrack

Func isDarkBarrack($page)
	Return $page == 6 Or $page == 7
EndFunc   ;==>isDarkBarrack

Func isSpellFactory($page)
	Return $page == 8
EndFunc   ;==>isSpellFactory
