package states.substates;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import props.NPC;
import props.Player;
import flixel.FlxG;
import flixel.FlxSubState;

class FirstBattleCutscene extends FlxSubState
{
	public function new(playerPos:Array<Float>, npcPos:Array<Float>)
	{
		super();

		var playerBattlePos:Array<Int> = [50, 75];
		var npcBattlePos:Array<Int> = [FlxG.width - 125, 75];

		var bg:FlxSprite = new FlxSprite(0, -FlxG.height).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 1;
		add(bg);

		var player:Player = new Player(playerPos[0], playerPos[1]);
		player.disableMovement = true;
		add(player);

		var npc:NPC = new NPC(npcPos[0], npcPos[1], true);
		add(npc);

		FlxTween.tween(bg, {alpha: 1, y: 0}, 2.25, {ease: FlxEase.quadInOut});

		FlxTween.tween(player, {x: playerBattlePos[0], y: playerBattlePos[1]}, 1.5, {ease: FlxEase.quartInOut});
		FlxTween.tween(npc, {x: npcBattlePos[0], y: npcBattlePos[1]}, 1.5, {ease: FlxEase.quartInOut});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}