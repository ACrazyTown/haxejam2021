package props;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
    public var walkVelocity:Int = 250;
    public var runVelocity:Int = 300;

    var currentVelocity:Int = 0;

    public function new(X:Float, Y:Float)
    {
        x = X;
        y = Y;

        immovable = true;

        super(X, Y);
        loadGraphic("assets/images/playr_placeholder.png");
    }

    override function update(elapsed:Float):Void
    {
        //trace("IM ALIVE!!!");
        keyCheck();
        super.update(elapsed);
    }

    public function keyCheck()
    {
        velocity.set(0, 0);

        var left:Bool = FlxG.keys.anyPressed([A, LEFT]);
        var right:Bool = FlxG.keys.anyPressed([D, RIGHT]);
        var up:Bool = FlxG.keys.anyPressed([W, UP]);
		var down:Bool = FlxG.keys.anyPressed([S, DOWN]);
        var sprint:Bool = FlxG.keys.pressed.SHIFT;

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

        if (!sprint)
            currentVelocity = walkVelocity;
        else
            currentVelocity = runVelocity;

        if (left)
			velocity.x = -currentVelocity;
        if (right)
			velocity.x = currentVelocity;
        if (up)
			velocity.y = -currentVelocity;
        if (down)
			velocity.y = currentVelocity;

    }

}