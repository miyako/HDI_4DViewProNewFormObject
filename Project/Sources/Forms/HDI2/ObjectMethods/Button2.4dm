var $path : Text
ARRAY TEXT:C222($selected; 0)

// look up file
If (Select document:C905(""; ".4vp"; "4D View Pro"; Allow alias files:K24:10+Package open:K24:8+Use sheet window:K24:11; $selected)#"")
	$path:=$selected{1}
End if 

If ($path#"")
	VP IMPORT DOCUMENT("ViewProArea"; $path)
End if 

