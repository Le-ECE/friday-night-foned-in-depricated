package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OptionsSubState extends MusicBeatSubstate
{
	var textMenuItems:Array<String> = ['Master Volume', 'Sound Volume', 'Controls'];

	var selector:FlxSprite;
	var curSelected:Int = 0;

	var grpOptionsTexts:FlxTypedGroup<FlxText>;
	var scrollUp:Bool;
	var scrollDown:Bool;
	var scrollRight:Bool;
	var accept:Bool;
	var back:Bool;

	public function new()
	{
		super();

		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

		selector = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);
		add(selector);

		for (i in 0...textMenuItems.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 50), 0, textMenuItems[i], 32);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		scrollUp = false;
		scrollDown = false;
		scrollRight = false;
		accept = false;
		back = false;

		// The angle in degrees, between -180 and 180. 0 degrees points straight up.
		for (swipe in FlxG.swipes)
		{
			if(swipe.distance >= 25){
				if(swipe.angle >= -45 && swipe.angle <= 45)
					scrollDown = true;
				
				if(swipe.angle > -135 && swipe.angle < -45){
					back = true;
				}

				if(swipe.angle > 45 && swipe.angle < 135){
					scrollRight = true;
				}

				if((swipe.angle >= -180 && swipe.angle <= -135) || (swipe.angle >= 135 && swipe.angle <= 180))
					scrollUp = true;
			}
			else
				accept = true;
		}

		if (controls.UP_P || scrollUp)
			curSelected -= 1;

		if (controls.DOWN_P || scrollDown)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (controls.ACCEPT || accept)
		{
			switch (textMenuItems[curSelected])
			{
				case "Controls":
					FlxG.state.closeSubState();
					FlxG.state.openSubState(new ControlsSubState());
			}
		}
	}
}
