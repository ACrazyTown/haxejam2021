package utils;

import flixel.FlxG;
import lime.app.Application;

class GameInfo
{
    //public static var VERSION:String = Application.current.meta.get("version");

    public static var maxLevels:Int = 5;

    public static function initSave()
    {
        if (FlxG.save.data.firstTime == null)
            FlxG.save.data.firstTime = true;
    }
}