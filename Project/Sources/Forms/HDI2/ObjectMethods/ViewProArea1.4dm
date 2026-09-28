If (Form event code:C388=On VP Ready:K2:59)
	QUERY:C277([VPWorkBooks:5]; [VPWorkBooks:5]ID:1=1)
	VP IMPORT FROM OBJECT("ViewProArea1"; [VPWorkBooks:5]WorkBook:2)
End if 