package com.jonmodell.art
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	
	import gs.*;
	import gs.easing.*;
	
	public class ConcentricCircles extends ArtItem
	{
		private var countPerCircle:Number;
		
		private var widthConstraint:Number;
		private var heightContstraint:Number;
		
		public function ConcentricCircles(
			iterations:Number 			= 300, 
			rate:Number 				= 100, 
			color:uint 					= 0x000000, 
			widthConstraint:Number 		= 400,
			heightContstraint:Number 	= 400, 
			countPerCircle:Number 		= 60)
			
			{
			super();
			this.iterations 	= iterations;
			this.rate 			= rate;
			this.increment 		= (Math.PI *2)/countPerCircle;
			this.color 			= color;
			this.widthConstraint 		= widthConstraint;
			this.heightContstraint 		= heightContstraint;
			
			this.countPerCircle = countPerCircle;
		}
		
		override protected function update(e:TimerEvent):void{
			
			if(counter%countPerCircle == 0) cir++;
			
			// a sprite to add
			var sp:Sprite = new Sprite();
				
			width0 		= 2*cir;
			height0 	= 2*cir;
				
			sp.graphics.beginFill(Math.random()*color, 0.2);
			sp.graphics.drawRect(0,0,width0,height0);
			sp.graphics.endFill();
			
			sp.x = sp.y = 0;
				
			x0 = sp.x + Math.sin(increment*counter)*30*cir;
			y0 = sp.y + Math.cos(increment*counter)*30*cir;
			
			sp.rotation = -(increment*counter)/(Math.PI/180);
				
			new TweenLite(sp, .2, {y:y0, x:x0, ease:gs.easing.Bounce});
			this.addChild(sp);
			
			counter++;
		}
		
	}
}