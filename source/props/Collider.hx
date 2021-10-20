package props;

import flixel.FlxSprite;

/*
var bgCollider:FlxSprite = new FlxSprite(0, 185).loadGraphic("assets/images/collider.png");
				bgCollider.setGraphicSize(FlxG.width, 24);
				bgCollider.updateHitbox();
				bgCollider.x = 0;
				add(bgCollider);
*/

class Collider extends FlxSprite
{
    var _x:Float = 0;
    var _y:Float = 0;
    var _width:Int = 0;
    var _height:Int = 0;

    public function new(X:Float, Y:Float, width:Int, height:Int)
    {
		super(X, Y);

        _x = X;
        _y = Y;
        _width = width;
        _height = height;
        immovable = true;

		loadGraphic("assets/images/collider.png");
        trace("s?");

        updatePosition(_width, _height);
    }

    public function updatePosition(Width:Int = 0, Height:Int = 0):Void
    {
		setGraphicSize(Width, Height);
        updateHitbox();
        x = _x;
        y = _y;
    }

}