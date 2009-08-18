package com.jonmodell.art
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class SharpScribble extends ArtItem
	{
		
		private var widthConstraint:Number;
		private var heightContstraint:Number;
		
		public function SharpScribble(
			iterations:Number 			= 300, 
			rate:Number 				= 100, 
			color:uint 					= 0x000000, 
			widthConstraint:Number 		= 400,
			heightContstraint:Number 	= 400){
			
			super();
			this.iterations 			= iterations;
			this.rate 					= rate;
			this.increment 				= (Math.PI *2)/iterations;
			this.color 					= color;
			this.widthConstraint 		= widthConstraint;
			this.heightContstraint 		= heightContstraint;
		}

		override protected function update(e:TimerEvent):void{
			
			if(counter%100 == 0) cir++;
			
			this.graphics.lineStyle(0.5,color,0.5);
			
			
			var x1 : Number = widthConstraint;
			while((x1 > widthConstraint / 2) || (x1 < -widthConstraint / 2)){
				x1 = -25 + (Math.random()*50) + x0;
			}
			
			var y1 : Number = heightContstraint;
			while((y1 > heightContstraint / 2) || (y1 < -heightContstraint / 2)){
				y1 = -25 + (Math.random()*50) + y0;
			}
			
			this.graphics.lineTo(x1,y1);
			
			x0 = x1;
			y0 = y1;
		}
		
	}
}

