package states;

import states.substates.Cutscene.FirstBattleCutscene;
import states.substates.BattleSubstate;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxRect;
import flixel.FlxCamera;
import flixel.math.FlxVelocity;
import props.NPC;
import props.Collider;
import flixel.group.FlxGroup.FlxTypedGroup;
import utils.Paths;
import flixel.FlxSprite;
import utils.GameInfo;
import props.Player;
import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxPoint;

class PlayState extends FlxState
{
	public var shitShow:Array<Collider> = [];
	public var colliderGroup:FlxTypedGroup<Collider>;
	public var npcGroup:FlxTypedGroup<NPC>;

	var player:Player;
	//var npctest:NPC;

	override public function create()
	{
		super.create();

		/*
		camGame = new FlxCamera();
		camHUD = new FlxCamera();

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camHUD);

		//FlxCamera.defaultCameras = [camGame];
		camGame.follow(player, FlxCameraFollowStyle.SCREEN_BY_SCREEN);

		FlxG.cameras.setDefaultDrawTarget(camGame, true);
		*/

		//FlxG.camera.followLerp = 0.5;
		//FlxG.camera.setScrollBounds();
		//FlxG.worldBounds.set(0, 0, 0, 0);

		colliderGroup = new FlxTypedGroup<Collider>();
		npcGroup = new FlxTypedGroup<NPC>();
		player = new Player(50, 150);

		//FlxG.camera.zoom = 0.5;

		//FlxG.camera.follow(player, FlxCameraFollowStyle.TOPDOWN, 0.5);
		//FlxG.camera.deadzone.set(80, 80, FlxG.width - 160, FlxG.height - 160);

		generateRoom(0);

		add(colliderGroup);
		add(player);
		add(npcGroup);

		//FlxG.debugger.drawDebug = true;
	}

	override public function update(elapsed:Float)
	{
		eventChecks();

		//trace("distance between player and npc is: " + player.getMidpoint().distanceTo(npctest.getMidpoint()) + "????");

		super.update(elapsed);
	}

	var npcTime:Float = 0;

	function eventChecks()
	{
		if (FlxG.collide(player, colliderGroup))
		{
			trace("colliseien???");
		}

		npcGroup.forEachAlive(function(npc:NPC)
		{
			if (player.overlaps(npc))
			{
				trace("battle time");
				openSubState(new BattleSubstate([player.x, player.y], [npc.x, npc.y]));
			}

			if (player.getMidpoint().distanceTo(npc.getMidpoint()) <= 325 && !npc.isChasing)
			{
				npc.sawPlayer = true;
				//trace("you are gonna die");
			}

			if (npc.sawPlayer)
			{
				npc.alpha = 0.5;
				npcTime += FlxG.elapsed;
				trace(npcTime);
				if (npcTime > 1.5)
				{
					trace("SPOTTED!");
					//npc.color = FlxColor.RED;
					npc.sawPlayer = false;
					npc.isChasing = true;
				}
			}

			if (npc.isChasing)
			{
				//trace("BITCH");
				//trace(npc.chaseRatio);
				npc.chaseRatio += 0.00025;
				npc.chase(player.x, player.y, npc.chaseRatio);
			}
		});
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
				//FlxG.camera.setScrollBounds(0, FlxG.width * 2, 0, FlxG.height);

				var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image("levels/" + curLevel + "/bg"));
				add(bg);

				var bgCollider:Collider = new Collider(0, 175, FlxG.width, 24);

				var npctest:NPC = new NPC(550, 150, true);
				//npctest.setSize(npctest.character.width, npctest.rope.height);
				//npctest.screenCenter();
				npcGroup.add(npctest);
			}
		}
	}

	override function openSubState(SubState:FlxSubState)
	{
		super.openSubState(SubState);
	}
}
