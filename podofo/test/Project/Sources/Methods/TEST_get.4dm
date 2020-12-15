//%attributes = {}
/*

get form objects from pdf

*/

$params:=New object:C1471
  //$params.in:=Folder(fk resources folder).file("acroform.pdf").platformPath
$params.in:=Folder:C1567(fk resources folder:K87:11).file("fields.pdf").platformPath

/*

mandatory : in
optional  : password

*/

$status:=podofo_get_form ($params)

$result:=JSON Stringify:C1217($status;*)
SET TEXT TO PASTEBOARD:C523($result)

/*

alternatively, pass a picture

*/

CLEAR VARIABLE:C89($status)
READ PICTURE FILE:C678($params.in;$PDF)
$params.in:=$PDF

$status:=podofo_get_form ($params)

