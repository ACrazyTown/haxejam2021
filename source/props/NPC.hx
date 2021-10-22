package props;

import shaders.WiggleEffect;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.util.FlxAxes;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class Rope extends FlxSprite
{
	public function new(X:Float, Y:Float)
	{
		super(X, Y);
	}
}

class NPC extends FlxSpriteGroup
{
    public var _attached:Bool = true;

    public var character:FlxSprite;
    public var rope:Rope;

    public var sawPlayer:Bool = false;
    public var isChasing:Bool = false;
	public var chaseRatio:Float = 0;

	var wiggle:WiggleEffect;

    public function new(X:Float, Y:Float, ?attached:Bool = true)
    {
		super(X, Y);

        _attached = attached;

        /*char = loadGraphic("assets/images/enemy_placeholder.png");*/
		character = new FlxSprite(X, Y).loadGraphic("assets/images/enemy_placeholder.png");

        trace("we gangsta?");

		if (_attached)
		{
			wiggle = new WiggleEffect();
            wiggle.waveAmplitude = 1;
            wiggle.waveFrequency = 1;
            wiggle.waveSpeed = 1;

			rope = new Rope(character.getMidpoint().x, -FlxG.height);
			rope.makeGraphic(5, Std.int(FlxPoint.get(rope.x, rope.y).distanceTo(character.getMidpoint())));
            rope.shader = wiggle.shader;
            //rope.offset.y = 125;

			group.add(rope); 
		}

		group.add(character);
    }

    override function update(elapsed:Float)
    {
        /*
        if (_attached)
        {
            wiggle.update(elapsed);
        }
        */

        super.update(elapsed);
    }

    public function chase(toX:Float, toY:Float, ratio:Float)
    {
        //trace("I SHOULD BE LERPING BITCH");
        x = FlxMath.lerp(this.x, toX, ratio);
		y = FlxMath.lerp(this.y, toY, ratio);
    }
}