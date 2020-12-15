//%attributes = {}
/*

set form objects to pdf

*/

$params:=New object:C1471
$params.in:=Folder:C1567(fk resources folder:K87:11).file("blank.pdf").platformPath
$params.out:=Folder:C1567(fk desktop folder:K87:19).file("test.pdf").platformPath

/*

mandatory : in, pages
optional  : password, out

if out is not passed, in (file) is updated
if in is picture, out (picture) is returned 

*/

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
$params.pages[0].fields[0].width:=400
$params.pages[0].fields[0].height:=30
$params.pages[0].fields[0].x:=100
$params.pages[0].fields[0].y:=20
  //$params.pages[0].fields[0].unit:="mm"//default=pt

$params.pages[0].fields[0].value:="【ここにお名前を入力してください！】"
$params.pages[0].fields[0].maxLen:=-1
$params.pages[0].fields[0].fieldName:="name"

/*
by default, the font is Arial
addtional fonts are embedded into the PDF, but does not seem to reflect in fields
*/

$params.pages[0].fields[0].font:=""
$params.pages[0].fields[0].fontSize:=20

/*

check box (default)

*/

$params.pages[0].fields[1]:=New object:C1471
$params.pages[0].fields[1].type:="checkBox"
$params.pages[0].fields[1].width:=240
$params.pages[0].fields[1].height:=30
$params.pages[0].fields[1].x:=100
$params.pages[0].fields[1].y:=50
$params.pages[0].fields[1].isChecked:=True:C214
$params.pages[0].fields[1].fieldName:="check"
$params.pages[0].fields[1].highlightingMode:="none"

/*

check box (icon)

*/

C_PICTURE:C286($icon)
$iconFile:=Folder:C1567(fk resources folder:K87:11).file("4D.png").platformPath
READ PICTURE FILE:C678($iconFile;$icon)

$params.pages[0].fields[2]:=New object:C1471
$params.pages[0].fields[2].type:="checkBox"
$params.pages[0].fields[2].width:=240
$params.pages[0].fields[2].height:=30
$params.pages[0].fields[2].x:=100
$params.pages[0].fields[2].y:=80
$params.pages[0].fields[2].isChecked:=True:C214
If (False:C215)
	$params.pages[0].fields[2].icon:=$iconFile
Else 
	$params.pages[0].fields[2].icon:=$icon
End if 
$params.pages[0].fields[2].fieldName:="check-icon"

/*

action

*/

$params.pages[0].fields[3]:=New object:C1471
$params.pages[0].fields[3].type:="pushButton"
$params.pages[0].fields[3].width:=240
$params.pages[0].fields[3].height:=30
$params.pages[0].fields[3].x:=100
$params.pages[0].fields[3].y:=110
$params.pages[0].fields[3].caption:="リセット"
$params.pages[0].fields[3].action:="reset"
$params.pages[0].fields[3].events:=New collection:C1472
$params.pages[0].fields[3].events[0]:=New object:C1471
$params.pages[0].fields[3].events[0].event:="mouseDown"
$params.pages[0].fields[3].font:=""
$params.pages[0].fields[3].fontSize:=20
$params.pages[0].fields[3].fieldName:="reset-button"
$params.pages[0].fields[3].color:=1/*always black? */
$params.pages[0].fields[3].borderColor:=New object:C1471("r";1;"g";0;"b";1)
$params.pages[0].fields[3].backgroundColor:=New object:C1471("r";0.7;"g";0.4;"b";0.4)

$params.pages[0].fields[4]:=New object:C1471
$params.pages[0].fields[4].type:="pushButton"
$params.pages[0].fields[4].width:=240
$params.pages[0].fields[4].height:=30
$params.pages[0].fields[4].x:=100
$params.pages[0].fields[4].y:=140
$params.pages[0].fields[4].caption:="リンク"
$params.pages[0].fields[4].action:="link"
$params.pages[0].fields[4].URI:="http://www.4D.com/"
$params.pages[0].fields[4].events:=New collection:C1472
$params.pages[0].fields[4].events[0]:=New object:C1471
$params.pages[0].fields[4].events[0].event:="mouseDown"
$params.pages[0].fields[4].font:=""  //ignored?
$params.pages[0].fields[4].fontSize:=20
$params.pages[0].fields[4].fieldName:="link-button"
$params.pages[0].fields[4].color:=1/*always black? */
$params.pages[0].fields[4].borderColor:=New object:C1471("r";1;"g";0;"b";1)
$params.pages[0].fields[4].backgroundColor:=New object:C1471("r";0.7;"g";0.9;"b";0.4)

/*

combobox

*/

$params.pages[0].fields[5]:=New object:C1471
$params.pages[0].fields[5].type:="comboBox"
$params.pages[0].fields[5].width:=240
$params.pages[0].fields[5].height:=30
$params.pages[0].fields[5].x:=100
$params.pages[0].fields[5].y:=200
$params.pages[0].fields[5].isEditable:=True:C214
$params.pages[0].fields[5].currentItem:=1  //0-based
$params.pages[0].fields[5].items:=New collection:C1472
$params.pages[0].fields[5].items[0]:=New object:C1471
$params.pages[0].fields[5].items[0].value:="1"
$params.pages[0].fields[5].items[0].displayText:="value 1"
$params.pages[0].fields[5].items[1]:=New object:C1471
$params.pages[0].fields[5].items[1].value:="2"
$params.pages[0].fields[5].items[1].displayText:="value 2"
$params.pages[0].fields[5].items[2]:=New object:C1471
$params.pages[0].fields[5].items[2].value:="3"
$params.pages[0].fields[5].items[2].displayText:="value 3"
$params.pages[0].fields[5].font:=""  //ignored?
$params.pages[0].fields[5].fontSize:=20
$params.pages[0].fields[5].fieldName:="combo"
$params.pages[0].fields[4].borderColor:=Null:C1517

If (False:C215)
	
/*
	
static text
	
*/
	
	$params.pages[0].text:=New collection:C1472
	$params.pages[0].text[0]:=New object:C1471
	$params.pages[0].text[0].x:=100
	$params.pages[0].text[0].y:=200  //including offset for height (y is bottom line)
	$params.pages[0].text[0].font:="Helvetica"
	$params.pages[0].text[0].fontSize:=24
	$params.pages[0].text[0].value:="abcdeéå"
	
/*
halign + width
*/
	
	$params.pages[0].text[1]:=New object:C1471
	$params.pages[0].text[1].halign:="right"
	$params.pages[0].text[1].width:=240
	$params.pages[0].text[1].x:=100
	$params.pages[0].text[1].y:=230  //including offset for height (y is bottom line)
	$params.pages[0].text[1].font:="Times"
	$params.pages[0].text[1].fontSize:=24
	$params.pages[0].text[1].value:="abcde"
	$params.pages[0].text[1].color:=New object:C1471("r";0.8;"g";0;"b";0)
/*
halign + width, valign + height
*/
	
	$params.pages[0].text[2]:=New object:C1471
	$params.pages[0].text[2].halign:="center"
	$params.pages[0].text[2].width:=240
	$params.pages[0].text[2].valign:="bottom"
	$params.pages[0].text[2].height:=60
	$params.pages[0].text[2].x:=100
	$params.pages[0].text[2].y:=230
	$params.pages[0].text[2].font:="Courier"
	$params.pages[0].text[2].fontSize:=24
	$params.pages[0].text[2].value:="123457"
	
End if 

If (False:C215)
	
	  //submit:probably not working
	
	$params.pages[0].fields[6]:=New object:C1471
	$params.pages[0].fields[6].type:="pushButton"
	$params.pages[0].fields[6].width:=240
	$params.pages[0].fields[6].height:=30
	$params.pages[0].fields[6].x:=100
	$params.pages[0].fields[6].y:=360
	$params.pages[0].fields[6].caption:="入力"
	$params.pages[0].fields[6].action:="submit"
	$params.pages[0].fields[6].events:=New collection:C1472
	$params.pages[0].fields[6].events[0]:=New object:C1471
	$params.pages[0].fields[6].events[0].event:="mouseDown"
	$params.pages[0].fields[6].font:=""  //ignored?
	$params.pages[0].fields[6].fontSize:=20
	$params.pages[0].fields[6].fieldName:="submit-button"
	$params.pages[0].fields[6].color:=1/*always black? */
	$params.pages[0].fields[6].borderColor:=New object:C1471("r";1;"g";0;"b";1)
	$params.pages[0].fields[6].backgroundColor:=New object:C1471("r";0.3;"g";0.9;"b";0.9)
	
	  //script:probably not working
	
	$params.pages[0].fields[7]:=New object:C1471
	$params.pages[0].fields[7].type:="pushButton"
	$params.pages[0].fields[7].width:=240
	$params.pages[0].fields[7].height:=30
	$params.pages[0].fields[7].x:=100
	$params.pages[0].fields[7].y:=390
	$params.pages[0].fields[7].caption:="スクリプト"
	$params.pages[0].fields[7].action:="script"
	
	$lines:=New collection:C1472(\
		"var aSubmitFields = new Array(\"name\",\"id\",\"user\");";\
		"this.submitForm({";\
		"cURL:\"http://127.0.0.1/cgi-bin/myscript.cgi#FDF\",";\
		"aFields:aSubmitFields,";\
		"cSubmitAs:\"FDF\";";\
		"})")
	
	$js:=$lines.join("\r\n")
	
	$params.pages[0].fields[7].script:=$js
	$params.pages[0].fields[7].events:=New collection:C1472
	$params.pages[0].fields[7].events[0]:=New object:C1471
	$params.pages[0].fields[7].events[0].event:="mouseDown"
	
	$params.pages[0].fields[7].font:=""  //ignored?
	$params.pages[0].fields[7].fontSize:=20
	$params.pages[0].fields[7].fieldName:="script-button"
	$params.pages[0].fields[7].color:=1/*always black? */
	$params.pages[0].fields[7].borderColor:=New object:C1471("r";1;"g";0;"b";1)
	$params.pages[0].fields[7].backgroundColor:=New object:C1471("r";0;"g";0.4;"b";0.9)
	
	  //https://www.w3.org/WAI/WCAG21/Techniques/pdf/PDF15
	
End if 

$status:=podofo_set_form ($params)

If (Is Windows:C1573)
	OPEN URL:C673($params.out;"Edge")
Else 
	OPEN URL:C673($params.out)
End if 
/*

alternatively, pass a picture

*/

  //CLEAR VARIABLE($status)
  //READ PICTURE FILE($params.in;$PDF)
  //$params.in:=$PDF

  //$status:=podofo_set_form ($params)