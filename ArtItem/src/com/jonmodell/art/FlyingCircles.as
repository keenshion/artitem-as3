package com.jonmodell.art
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	
	import gs.*;
	import gs.easing.*;
	
	public class FlyingCircles extends ArtItem
	{
		private var countPerCircle:Number;
		private var sway:Number;
		private var fall:Number;
		
		public function FlyingCircles(
			iterations:Number = 300, 
			rate:Number = 100, 
			color:uint = 0x000000,
			sway:Number = 500,
			fall:Number = 800,
			countPerCircle:Number = 60
		){
			super();
			this.iterations 	= iterations;
			this.rate 			= rate;
			this.increment 		= (Math.PI *2)/countPerCircle;
			this.color 			= color;
			this.countPerCircle = countPerCircle;
			this.sway 			= sway;
			this.fall			= fall;
		}
		
		override protected function update(e:TimerEvent):void{
			
			if(counter%countPerCircle == 0) cir++;
			
			for(var c:Number = 0; c < 10; c++){
				// a sprite to add
				var sp:Sprite = new Sprite();

				sp.graphics.beginFill(Math.random()*0xffffff, 0.4);
				sp.graphics.drawCircle(0,0,5);
				sp.graphics.endFill();
				
				sp.x = -150 + (c*30);
				sp.y = 0;
				
				this.addChild(sp);
				new TweenLite(sp, 5, {y:fall, ease:gs.easing.Sine.easeOut, onComplete:onDownComplete, onCompleteParams: [sp]});
				new TweenLite(sp, 1, {x: sway, overwrite:0, delay:c*.05, ease:gs.easing.Sine.easeInOut, onComplete:onSideComplete, onCompleteParams: [sp, sway]});
			
			}
			
			counter++;
		}
		
		private function onDownComplete(sp:Sprite):void{
			this.removeChild(sp);
		}
		
		private function onSideComplete(sp:Sprite, dist:Number):void{
			if(sp) new TweenLite(sp, 1, {x:- dist, overwrite:0, ease:gs.easing.Sine.easeInOut, onComplete:onSideComplete, onCompleteParams: [sp, -dist]});
		}
		
	}
}