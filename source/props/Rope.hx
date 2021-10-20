package props;

import flixel.FlxG;
import flixel.FlxSprite;

@:allow(props.NPC)
class Rope extends FlxSprite
{
    public function new(X:Float, Y:Float)
    {
        super(X, Y);

        makeGraphic(5, FlxG.height * 2);
    }
}