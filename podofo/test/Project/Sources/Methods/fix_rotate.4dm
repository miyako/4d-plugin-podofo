//%attributes = {}
  //<>P:=Get text from pasteboard

$params:=JSON Parse:C1218(<>P)

$params.in:=Folder:C1567(fk desktop folder:K87:19).file("2.pdf").platformPath
$params.out:=Folder:C1567(fk desktop folder:K87:19).file("3.pdf").platformPath

For each ($pages;$params.pages)
	For each ($fields;$pages.fields)
		$fields.x:=$fields.rect.x
		$fields.y:=$fields.rect.y
		$fields.width:=$fields.rect.width
		$fields.height:=$fields.rect.height
	End for each 
End for each 

  //TODO:rotate x,y,w,h for 90,180,270

$status:=podofo_set_form ($params)