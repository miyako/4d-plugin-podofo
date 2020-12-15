//%attributes = {}
$params:=New object:C1471
$params.in:=Folder:C1567(fk desktop folder:K87:19).file("1.pdf").platformPath

  //TODO: get set annotation

$status:=podofo_get_form ($params)

SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($status;*))

$params:=$status
$params.in:=Folder:C1567(fk desktop folder:K87:19).file("2.pdf").platformPath
$params.out:=Folder:C1567(fk desktop folder:K87:19).file("3.pdf").platformPath

For each ($pages;$params.pages)
	For each ($fields;$pages.fields)
		$o:=New object:C1471
		$o.x:=$fields.x
		$o.y:=$fields.y
		$o.width:=$fields.width
		$o.height:=$fields.height
		rotate ($o;$pages.pageNumber;$pages.rect.crop;$fields)
		$fields.x:=$o.x
		$fields.y:=$o.y
		$fields.width:=$o.width
		$fields.height:=$o.height
		$fields.borderColor:=Null:C1517
	End for each 
	
	For each ($annotation;$pages.annotation)
		$o:=New object:C1471
		$o.x:=$annotation.x
		$o.y:=$annotation.y
		$o.width:=$annotation.width
		$o.height:=$annotation.height
		rotate ($o;$pages.pageNumber;$pages.rect.crop;$annotation)
		$annotation.x:=$o.x
		$annotation.y:=$o.y
		$annotation.width:=$o.width
		$annotation.height:=$o.height
		  //$fields.borderColor:=Null
	End for each 
	$pages.rotation:=0
End for each 

$status:=podofo_set_form ($params)

OPEN URL:C673($params.out)