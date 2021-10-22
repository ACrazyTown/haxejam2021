package states.substates;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import props.NPC;
import props.Player;
import flixel.FlxG;
import flixel.FlxSubState;

class BattleSubstate extends FlxSubState
{
    var optionGroup:FlxTypedGroup<>

    var playerBattlePos:Array<Int> = [50, 75];
    var npcBattlePos:Array<Int> = [FlxG.width - 125, 75];

    var bg:FlxSprite;

	var player:Player;
    var npc:NPC;

    public function new(playerPos:Array<Float>, npcPos:Array<Float>)
    {
        super();

        bg = new FlxSprite(0, -FlxG.height).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        bg.alpha = 1;
        add(bg);

        player = new Player(playerPos[0], playerPos[1]);
        player.disableMovement = true;
        add(player);

        npc = new NPC(npcPos[0], npcPos[1], true);
        add(npc);

        FlxTween.tween(bg, {alpha: 1, y: 0}, 2, {ease: FlxEase.quadInOut});

        FlxTween.tween(player, {x: playerBattlePos[0], y: playerBattlePos[1]}, 1.25, {ease: FlxEase.quartInOut});
        FlxTween.tween(npc, {x: npcBattlePos[0], y: npcBattlePos[1]}, 1.25, {ease: FlxEase.quartInOut});
    }

    override function update(elapsed:Float)
    {
        trace(player.x);

        /*
        if (player.x != playerBattlePos[0] && player.y != playerBattlePos[1] || npc.x != npcBattlePos[0] && npc.y != npcBattlePos[1])
        {
            lerpPositions();
        }
        */

        super.update(elapsed);
    }

    function lerpPositions()
    {
        player.x = FlxMath.lerp(player.x, playerBattlePos[0], 0.05);
        player.y = FlxMath.lerp(player.y, playerBattlePos[1], 0.05);

        npc.x = FlxMath.lerp(npc.x, npcBattlePos[0], 0.05);
        npc.y = FlxMath.lerp(npc.y, npcBattlePos[1], 0.05);
    }
}