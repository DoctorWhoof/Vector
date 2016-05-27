Import vector

Class Rect Extends Vector

	Field handle := New Vector( 0.5, 0.5 )

	Private

	Field _width:Float
	Field _height:Float

	Field _x1:Float, _y1:Float, _x2:Float, _y2:Float	'Rect corners
	Field pivotX:Float = 0
	Field pivotY:Float = 0

'   	Field offset := New Vector()

	Public

	'************  Read only fields  **************

	Method width:Float() Property		; Return _width; 	End
	Method height:Float() Property		; Return _height;	End

	Method x1:Float() Property			; Return _x1; 		End
	Method x2:Float() Property			; Return _x2; 		End
	Method y1:Float() Property			; Return _y1; 		End
	Method y2:Float() Property			; Return _y2; 		End

	' Method pivotX:Float() Property		; Return pivotX;	End
	' Method pivotY:Float() Property		; Return pivotY; 	End

	'************  Public Methods  **************

	Method New(x:Float, y:Float, _width:Float, _height:Float)
		Set( x,y )
		Size( _width, _height )
	End

	Method Set:Void(x:Float, y:Float)
		Self.x = x
		Self.y = y
		Self._x1 = x - pivotX
		Self._y1 = y - pivotY
		Self._x2 = _x1 + _width
		Self._y2 = _y1 + _height
	End

	Method Size:Void(_width:Float, _height:Float )
		Self._width = _width
		Self._height = _height
		pivotX = ( _width * handle.x )
		pivotY = ( _height * handle.y )
		Self._x1 = x - pivotX
		Self._y1 = y - pivotY
		Self._x2 = _x1 + _width
		Self._y2 = _y1 + _height
	End

	Method Copy:Void( other:Vector )
		Self.x = other.x
		Self.y = other.y
		local otherRect := Rect( other )
		If otherRect
			Self.pivotX = otherRect.pivotX
			Self.pivotY = otherRect.pivotY
			Self._width = otherRect.width
			Self._height = otherRect.height
			Self._x1 = x - pivotX
			Self._y1 = y - pivotY
			Self._x2 = _x1 + _width
			Self._y2 = _y1 + _height
			Self.handle.Copy( otherRect.handle )
		End
	End

	Method SetHandle:Void( pX:Float, pY:Float )
		handle.Set( pX, pY )
		pivotX = pX * _width
		pivotY = pY * _height
		Self._x1 = x - pivotX
		Self._y1 = y - pivotY
		Self._x2 = _x1 + _width
		Self._y2 = _y1 + _height
	End

	Method SetX:Void( x:Float )
		Self.x = x
		Self._x1 = x - pivotX
		Self._x2 = _x1 + _width
	End

	Method SetX:Void( x:Float, _width:Float )
		Self.x = x
		Self._width = _width
		Self.pivotX = _width * handle.x
		Self._x1 = x - pivotX
		Self._x2 = _x1 + _width
	End

	Method SetY:Void( y:Float )
		Self.y = y
		Self._y1 = y - pivotY
		Self._y2 = _y1 + _height
	End

	Method SetY:Void( y:Float, _height:Float )
		Self.y = y
		Self._height = _height
		Self.pivotY = _height * handle.y
		Self._y1 = y - pivotY
		Self._y2 = _y1 + _height
	End

	Method PositionByCorner:Void( __x1:Float, __y1:Float )
		Set( __x1 + pivotX, __y1 + pivotY )
	End

	Method Move:Void( deltaX:Float, deltaY:Float )
		Set( self.x + deltaX, self.y +deltaY )
	End

	Method Contains:Bool(_x:Float, _y:Float)
		If _x > _x1
			If _x < _x2
				If _y > _y1
					If _y < _y2
						Return True
					End
				End
			End
		End
		Return False
	End

	Method Overlaps:Bool( rect:Rect )
		If rect._x2 > _x1
			If rect._x1 < _x2
				If rect._y2 > _y1
					If rect._y1 < _y2
						Return True
					End
				End
			End
		End
		Return false
	End

	Method SnapToPixel:Void()
		x = Round( x )
		y = Round( y )
		_width = Round( _width )
		_height = Round( _height )
		pivotX = Round( _width * handle.x )
		pivotY = Round( _height * handle.y )
		_x1 = Round( x - pivotX )
		_y1 = Round( y - pivotY )
		_x2 = Round( _x1 + _width )
		_y2 = Round( _y1 + _height )
	End

	Function Round:Float(number:Float)
		If number - Int(number) > 0.5 Then Return Ceil(number) Else Return Floor(number)
	End

End
