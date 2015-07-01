



Func FilterTH()
   	  For $i=0 to 20
		 If $Thx<52+$i*19 And $Thy<315-$i*14 Then Return False
		 If $Thx<52+$i*19 And $Thy>315+$i*14 Then Return False
 		 If $Thx>802-$i*19 And $Thy<315-$i*14 Then Return False
		 If $Thx>802-$i*19 And $Thy>315+$i*14 Then Return False
	  Next
			Return True
EndFunc



Func SearchTownHallLoc()
	Return False
EndFunc ;--- SearchTownHallLoc
