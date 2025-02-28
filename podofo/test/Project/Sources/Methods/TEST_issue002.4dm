//%attributes = {}
/*

set form objects to pdf

*/

$params:=New object:C1471
$params.in:=Folder:C1567(fk resources folder:K87:11).file("blank.pdf").platformPath
$params.out:=Folder:C1567(fk desktop folder:K87:19).file("test.pdf").platformPath

$params.pages:=New collection:C1472
$params.pages[0]:=New object:C1471

If (False:C215)
	$params.pages[0].width:=500
	$params.pages[0].height:=500
	$params.pages[0].rotation:=180
End if 

/*

text input freetype2 issue? no japanese font support

*/

$params.pages[0].fields:=New collection:C1472
$params.pages[0].fields[0]:=New object:C1471
$params.pages[0].fields[0].type:="textField"
$params.pages[0].fields[0].width:=100
$params.pages[0].fields[0].height:=15
$params.pages[0].fields[0].x:=44
$params.pages[0].fields[0].y:=347.918
$params.pages[0].fields[0].alternateName:="Date"
$params.pages[0].fields[0].isReadOnly:=False:C215
$params.pages[0].fields[0].isRequired:=False:C215
$params.pages[0].fields[0].open:=False:C215
$params.pages[0].fields[0].color:=Null:C1517
$params.pages[0].fields[0].highlightingMode:="invert"
$params.pages[0].fields[0].value:="12345678"
$params.pages[0].fields[0].maxLen:=8
$params.pages[0].fields[0].isMultiLine:=False:C215
$params.pages[0].fields[0].isPasswordField:=False:C215
$params.pages[0].fields[0].isFileField:=False:C215
$params.pages[0].fields[0].isSpellcheckingEnabled:=False:C215
$params.pages[0].fields[0].isScrollBarsEnabled:=False:C215
$params.pages[0].fields[0].isCombs:=True:C214
$params.pages[0].fields[0].isRichText:=False:C215
$params.pages[0].fields[0].fieldName:="Date-1"

$status:=podofo_set_form($params)

If (Is Windows:C1573)
	OPEN URL:C673($params.out; "Edge")
Else 
	OPEN URL:C673($params.out)
End if 