//%attributes = {}
$in:=Folder:C1567(fk resources folder:K87:11).file("test.pdf")
$out:=Folder:C1567(fk desktop folder:K87:19).file("TEST-signature.pdf")

$params:=New object:C1471

$params.in:=$in.platformPath
$params.out:=$out.platformPath

$params.reason:="I agree! 同意します"
$params.field:="signature"
$params.replace:=True:C214  //creates new field if not found
$params.page:=1

$params.location:="どこかの国"
$params.certification:="noPerms"  //,formFill,annotations

If (False:C215)
	$params.x:=10
	$params.y:=10
	$params.width:=100
	$params.height:=100
	$params.unit:="mm"
/*
if width==0.0 and height==0.0, the signature object is hidden
the digital signature object is a transparent rect anyway
*/
End if 

$params.pages:=New collection:C1472

$params.pages[0]:=New object:C1471
$params.pages[0].annotation:=New collection:C1472

$params.pages[0].annotation[0]:=New object:C1471
$params.pages[0].annotation[0].type:="text"
$params.pages[0].annotation[0].x:=100
$params.pages[0].annotation[0].y:=110
$params.pages[0].annotation[0].width:=340
$params.pages[0].annotation[0].height:=30
$params.pages[0].annotation[0].value:="✍🏼署名しました"
$params.pages[0].annotation[0].color:=New object:C1471("r";1;"g";0.7;"b";0.7)  //fill 
$params.pages[0].annotation[0].font:=""  //default font
$params.pages[0].annotation[0].fontSize:=24

$params.pages[0].annotation[1]:=New object:C1471
$params.pages[0].annotation[1].type:="text"
$params.pages[0].annotation[1].x:=100
$params.pages[0].annotation[1].y:=140
$params.pages[0].annotation[1].width:=340
$params.pages[0].annotation[1].height:=30
$params.pages[0].annotation[1].value:=Timestamp:C1445
$params.pages[0].annotation[1].color:=New object:C1471("r";1;"g";0.7;"b";0.7)  //fill 
$params.pages[0].annotation[1].font:=""  //default font
$params.pages[0].annotation[1].fontSize:=24

$params.pages[0].annotation[2]:=New object:C1471
$params.pages[0].annotation[2].type:="link"
$params.pages[0].annotation[2].URI:="https://www.4D.com/"
$params.pages[0].annotation[2].x:=100
$params.pages[0].annotation[2].y:=170
$params.pages[0].annotation[2].width:=340
$params.pages[0].annotation[2].height:=30

/*
a stamp is a fixed size image annotation
jpg, png supported
*/

$params.pages[0].annotation[3]:=New object:C1471
$params.pages[0].annotation[3].type:="stamp"
$params.pages[0].annotation[3].path:=Folder:C1567(fk resources folder:K87:11).file("4D.jpg").platformPath
$params.pages[0].annotation[3].x:=160
$params.pages[0].annotation[3].y:=30
$params.pages[0].annotation[3].width:=64
$params.pages[0].annotation[3].height:=64

$params.pages[0].annotation[4]:=New object:C1471
$params.pages[0].annotation[4].type:="stamp"
$params.pages[0].annotation[4].path:=Folder:C1567(fk resources folder:K87:11).file("4D.png").platformPath
$params.pages[0].annotation[4].x:=290
$params.pages[0].annotation[4].y:=30
$params.pages[0].annotation[4].width:=64
$params.pages[0].annotation[4].height:=64

/*
some type of TIFF are not supported
see
https://github.com/svn2github/podofo/blob/master/src/doc/PdfImage.cpp#576
case PHOTOMETRIC_RGB:
if ( bitsPixel != 24 )
{
    TIFFClose(hInTiffHandle);
    PODOFO_RAISE_ERROR( ePdfError_UnsupportedImageFormat );
}
*/

/*
only latin glyphs seem to work...
*/

$params.pages[0].text:=New collection:C1472
$params.pages[0].text[0]:=New object:C1471
$params.pages[0].text[0].x:=100
$params.pages[0].text[0].y:=200  //including offset for height (y is bottom line)
$params.pages[0].text[0].font:="Helvetica"
$params.pages[0].text[0].fontSize:=24
$params.pages[0].text[0].value:="abcdeéå"

$key:=Folder:C1567(fk resources folder:K87:11).folder("rsa").file("key.pem")
$cert:=Folder:C1567(fk resources folder:K87:11).folder("rsa").file("cert.pem")

If (True:C214)
/*
must keep the line delimiter!
*/
	$params.key:=$key.getText("us-ascii";Document unchanged:K24:18)
	$params.cert:=$cert.getText("us-ascii";Document unchanged:K24:18)
Else 
	$params.keyFile:=$key.platformPath
	$params.certFile:=$cert.platformPath
End if 

$status:=podofo_sign_document ($params)

OPEN URL:C673($out.platformPath)