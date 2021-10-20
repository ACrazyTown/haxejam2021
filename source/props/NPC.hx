package props;

import flixel.util.FlxAxes;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class NPC extends FlxSprite
{
    public var _attached:Bool = true;

    public var rope:Rope;

    public function new(X:Float, Y:Float, ?attached:Bool = true)
    {
        // to do figure out how to make a rope that's like seperate from the main sprite and stuf
        // physics rope??? maybe??

		super(X, Y);

        _attached = attached;

        /*char = loadGraphic("assets/images/enemy_placeholder.png");*/
		loadGraphic("assets/images/enemy_placeholder.png");

        trace("we gangsta?");

        if (_attached)
        {
            rope = new Rope(X, Y);
        }
    }
}