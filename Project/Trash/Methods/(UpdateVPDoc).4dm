//%attributes = {"invisible":true}
C_TEXT:C284($1; $path)
C_OBJECT:C1216($2; $vpObj)

$path:=$1
$vpObj:=$2

VPDoc:=New object:C1471

VPDoc.doc:=$vpObj
If ($path#"")
	VPDoc.path:=$path
	SET WINDOW TITLE:C213("4D View Pro - "+VPDoc.path)
Else 
	SET WINDOW TITLE:C213("4D View Pro - New")
End if 

If (VPDoc.doc.meta=Null:C1517)
	VPDoc.doc.meta:=New object:C1471
	VPDoc.doc.meta.Comments:="4D View pro"
End if 