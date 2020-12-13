//%attributes = {}
/*

get form objects from pdf

*/

$params:=New object:C1471
$params.in:=Folder:C1567(fk resources folder:K87:11).file("acroform.pdf").platformPath
$params.in:=Folder:C1567(fk resources folder:K87:11).file("fields.pdf").platformPath

  //$params.in:=Folder(fk desktop folder).file("test.pdf").platformPath
  //$params.in:=Folder(fk resources folder).file("submit-button-js.pdf").platformPath

/*

mandatory : in
optional  : password

*/

$status:=podofo_get_form ($params)

/*

alternatively, pass a picture

*/

CLEAR VARIABLE:C89($status)
READ PICTURE FILE:C678($params.in;$PDF)
$params.in:=$PDF

$status:=podofo_get_form ($params)