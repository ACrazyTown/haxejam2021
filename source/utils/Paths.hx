package utils;

class Paths
{
	#if desktop
	public static var soundExtension:String = ".ogg";
	#else
	public static var soundExtension:String = ".mp3";
	#end

    public static function font(name:String)
    {
        return "assets/fonts/" + name + ".otf";
    }

    public static function image(name:String)
    {
        return "assets/images/" + name + ".png";
    }

    public static function sound(name:String)
    {
        return "assets/sounds/" + name + soundExtension;
    }

	public static function music(name:String)
	{
		return "assets/music/" + name + soundExtension;
	}

    public static function text(name:String, ?extension:String = ".txt")
    {
        return "assets/data/" + name + extension;
    }
}