package states;

import props.Collider;
import flixel.group.FlxGroup.FlxTypedGroup;
import utils.Paths;
import flixel.FlxSprite;
import utils.GameInfo;
import props.Player;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var shitShow:Array<Collider> = [];
	public var colliderGroup:FlxTypedGroup<Collider>;

	var player:Player;

	override public function create()
	{
		colliderGroup = new FlxTypedGroup<Collider>();
		add(colliderGroup);

		generateRoom(0);

		player = new Player(250, 250);
		add(player);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		collisionCheck();
		super.update(elapsed);
	}

	function collisionCheck()
	{
		for (collider in shitShow)
		{
			if (FlxG.collide(player, collider))
			{
				//player.setPosition((collider.x - collider.width), (collider.y - collider.height));
				trace("COLLISION!!!");
			}
		}
	}

	function generateRoom(curLevel:Int)
	{
		if (curLevel > GameInfo.maxLevels || curLevel < 0)
		{
			// error out here
		}

		switch (curLevel)
		{
			case 0:
			{
				var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image("levels/" + curLevel + "/bg"));
				add(bg);

				var bgCollider:Collider = new Collider(0, 185, FlxG.width, 24);
				add(bgCollider);
				shitShow.push(bgCollider);

				/*
				var bgCollider:FlxSprite = new FlxSprite(0, 185).loadGraphic("assets/images/collider.png");
				bgCollider.setGraphicSize(FlxG.width, 24);
				bgCollider.updateHitbox();
				bgCollider.x = 0;
				add(bgCollider);
				*/
			}
		}
	}
}
