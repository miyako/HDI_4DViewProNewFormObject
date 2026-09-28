//%attributes = {}
#DECLARE($params : Object)

var $window; $i : Integer
var $found : Boolean
var $dataClass; $path; $project : Text
var $x; $y; $bottom; $right : Integer
ARRAY LONGINT($windows; 0)

Case of 

	: (Count parameters=0)

		$found:=False
		WINDOW LIST($windows)
		For ($i; 1; Size of array($windows))
			$window:=$windows{$i}
			If (Window process($window)=1) && (Get window title($window)="")
				GET WINDOW RECT($x; $y; $bottom; $right; $window)
				CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $bottom; $right; $window)))
				$found:=True
			End if 
		End for 

		If (Not($found))

			For each ($dataClass; ds)
				If (ds[$dataClass].getCount()=0)
					$path:=File("/RESOURCES/"+$dataClass+".4ie").platformPath
					If (Test path name($path)=Is a document)
						$project:=File("/RESOURCES/"+$dataClass+".4si").getText()
						IMPORT DATA($path; $project)
					End if 
				End if 
			End for each 

			CALL WORKER(1; Current method name; New object)

		End if 

	Else 

		SET MENU BAR(1)

		$window:=Open form window("HDI"; Plain form window; Horizontally centered; Vertically centered)
		SET WINDOW TITLE(""; $window)
		DIALOG("HDI"; *)

End case 
