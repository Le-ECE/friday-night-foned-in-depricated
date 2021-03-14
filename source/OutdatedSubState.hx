package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";

	var grpOptionsTexts:FlxTypedGroup<FlxText>;

	var accept:Bool;
	var back:Bool;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Kade Engine is Outdated!\n"
			+ MainMenuState.kadeEngineVer
			+ " is your current version\nwhile the most recent version is " + needVer
			+ "!\nPress Space to go to the github or ESCAPE to ignore this!!",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		accept = false;
		back = false;

		// The angle in degrees, between -180 and 180. 0 degrees points straight up.
		for (swipe in FlxG.swipes)
		{
			if(swipe.distance >= 25){
				if(swipe.angle > -135 && swipe.angle < -45){
					back = true;
				}
			}
			else
				accept = true;
		}

		if (controls.ACCEPT || accept)
		{
			FlxG.openURL("https://github.com/KadeDev/Kade-Engine/releases/latest");
		}
		if (controls.BACK || back)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
