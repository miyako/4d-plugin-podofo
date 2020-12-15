//%attributes = {}
C_OBJECT:C1216($1;$o;$3;$crop;$4;$fields)
C_REAL:C285($2;$r)

$o:=$1
$r:=$2
$crop:=$3
$fields:=$4

$type:=$fields.type

  //OK: 2,3,4,5,7,8

Case of 
	: ($r=1) | ($r=3)  //crop (39.685,342.992,481.315,322)
		
		If ($type="checkBox") | ($type="link")
			
			$x:=$o.x
			$y:=$o.y
			$o.x:=338.19-$y-$o.height
			$o.y:=$x-38.13
			
		Else 
			
			$x:=$o.x
			$y:=$o.y
			$o.x:=338.3-$y-$o.height
			$o.y:=$x-39.23
			
		End if 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
	: ($r=2)  //crop (0, 342.992, 481.315, 322)
		
		If ($type="checkBox") | ($type="link")
			
			$x:=$o.x
			$o.x:=$o.y-17.3
			$o.y:=482.5-$x-$o.width
			
		Else 
			
			$x:=$o.x
			$o.x:=$o.y-17.3
			$o.y:=481.4-$x-$o.width
			
		End if 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
	: ($r=4)  //crop (0, 342.992, 481.315, 322)
		
		If ($type="checkBox") | ($type="link")
			
			$x:=$o.x
			$o.x:=$o.y-17.3
			$o.y:=482.5-$x-$o.width
			
		Else 
			
			$x:=$o.x
			$o.x:=$o.y-17.6
			$o.y:=481.4-$x-$o.width
			
		End if 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
	: ($r=5)  //crop (0, 17.0079, 481.315, 322)
		
		Case of 
			: ($type="checkBox")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-336
				$o.y:=482.1-$x-$o.width
				
			: ($type="textField")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-309.3
				$o.y:=481-$x-$o.width
				
			: ($type="link")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-253
				$o.y:=481-$x-$o.width
				
		End case 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
	: ($r=6)
		
		Case of 
			: ($type="checkBox")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-203.5
				$o.y:=565.8-$x-$o.width
				
			: ($type="textField")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-417.7
				$o.y:=567.9-$x-$o.width
				
			: ($type="link")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-383
				If ($o.x<0)
					$o.x:=202
				End if 
				
				$o.y:=$x-$o.width-28
				
		End case 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
	: ($r=7)
		
		Case of 
			: ($type="checkBox")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-335.7
				$o.y:=482.2-$x-$o.width
				
				
			: ($type="textField")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-309.5
				$o.y:=481.1-$x-$o.width
				
			: ($type="link")
				
				$x:=$o.x
				$o.x:=$o.y-$o.height-253
				$o.y:=481.1-$x-$o.width
				
		End case 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
	: ($r=8)
		
		Case of 
			: ($type="checkBox")
				
				$x:=$o.x
				$o.x:=657-$o.y
				$o.y:=$x-38.4
				
			: ($type="textField")
				
				$x:=$o.x
				$o.x:=630.5-$o.y
				$o.y:=$x-39.5
				
			: ($type="link")
				
				$x:=$o.x
				$o.x:=575-$o.y
				$o.y:=$x-39.5
				
		End case 
		
		$height:=$o.height
		$o.height:=$o.width
		$o.width:=$height
		
End case 
