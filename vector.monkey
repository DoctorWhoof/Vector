Import monkey.math
Import rect

Class Vector

	Field x:Float , y:Float

	Private

	Field length:Float
	Global tempNormal := New Vector()
	Global tempMultiplier := New Vector()

	Public

	Method New(x:Float , y:Float)
		length = -1
		Set(x,y)
	End
	
	Method New()
		length = -1
	End
	
	Method Copy:Void( other:Vector )
		Self.x = other.x
		Self.y = other.y
	End

	Method Set:Void( x:Float, y:Float )
		Self.x = x
		Self.y = y
	End							
	
	Method Length:Float()
		length = Sqrt( x * x + y * y )
		return length
	End

	Method Angle:Float()
		Return ATan2( x, y )
	End
	
	Method Dotproduct:Float( l:Vector )
		Return (x * l.x + y * l.y )
	End

	Method Multiply:Void( f:float )
		x *= f
		y *= f
	End

	Method Normalize:Void()
		If Length() = 0 Then Return 
		Set( x/length, y/length )
	End
 
	Method Reflect:Void( n:Vector )
		local dot := Dotproduct( n ) * 2
		tempNormal.Set( n.x, n.y ); tempNormal.Normalize()
		tempMultiplier.Set( tempNormal.x, tempNormal.y ); tempMultiplier.Multiply( dot )
		x -= tempMultiplier.x
		y -= tempMultiplier.y
	End

	Method ToString:String()
		Return ( x + "," + y )
	End
	
	Method Limit( minX:Float, minY:Float, maxX:Float, maxY:Float )
		If x < minX
			x = minX
		Else If x > maxX
			x = maxX
		End
		If y < minY
			y = minY
		Else If y > maxY
			y = maxY
		End
	End

	'Warning : The following methods create new vectors and ideally should not be called on every frame
	
	Method Normal:Vector()
		Length()
		Return New Vector(x / length , y / length )
	End
	
End


