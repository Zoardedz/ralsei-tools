package ralseidevelop;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.text.TextField;
import openfl.text.TextFormat;

class Notification {
	public function new(leMessage:String) {
		var newTransparentBlackGraphic:Bitmap = new Bitmap(Assets.getBitmapData('ralseidevelop/img/black.png'));
		newTransparentBlackGraphic.alpha = 0.5;
		newTransparentBlackGraphic.x = -500;
		newTransparentBlackGraphic.y = 0;

		var thejoker:TextField = new TextField();
		thejoker.wordWrap = false;
		thejoker.text = leMessage;
		thejoker.x = newTransparentBlackGraphic.x;
		thejoker.y = newTransparentBlackGraphic.y;
		thejoker.setTextFormat(new TextFormat(Assets.getFont('ralseidevelop/fonts/ps3.ttf').fontName, 10, 0xFFFFFF));

		FlxG.stage.addChild(newTransparentBlackGraphic);
		FlxG.stage.addChild(thejoker);
		
		FlxTween.tween(newTransparentBlackGraphic, {x: 0}, 1, {
			ease: FlxEase.expoInOut,
			onComplete: function (flxTween:FlxTween) {
				FlxTween.tween(newTransparentBlackGraphic, {x: -500}, 3, {
					ease: FlxEase.expoInOut,
					onComplete: function(tweener:FlxTween){
						FlxG.stage.removeChild(newTransparentBlackGraphic);
						}
					});
				}
			});
		
		FlxTween.tween(thejoker, {x: 0}, 1, {
			ease: FlxEase.expoInOut,
			onComplete: function (flxTween:FlxTween) {
				FlxTween.tween(thejoker, {x: -500}, 3, {
					ease: FlxEase.expoInOut,
					onComplete: function(tweener:FlxTween){
						FlxG.stage.removeChild(thejoker);
						}
					});
				}
			});
	}
}