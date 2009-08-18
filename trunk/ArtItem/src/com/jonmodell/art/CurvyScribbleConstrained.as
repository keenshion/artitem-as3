package com.jonmodell.art
{
	import flash.events.TimerEvent;

	public class CurvyScribbleConstrained extends ArtItem
	{
		
		private var widthConstraint:Number;
		private var heightContstraint:Number;
		
		public function CurvyScribbleConstrained(
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
			
			this.graphics.lineStyle(0.01*counter,color,0.3 + 0.7*(counter/iterations));
			
			var x1 : Number = widthConstraint;
			while((x1 > widthConstraint / 2) || (x1 < -widthConstraint / 2)){
				x1 = -25 + (Math.random()*50) + x0;
			}
			
			var y1 : Number = heightContstraint;
			while((y1 > heightContstraint / 2) || (y1 < -heightContstraint / 2)){
				y1 = -25 + (Math.random()*50) + y0;
			}
			
			var cx:Number = -25 + (Math.random()*50) + x0;
			var cy:Number = -25 + (Math.random()*50) + y0;

			
			this.graphics.curveTo(cx,cy,x1,y1);
			
			x0 = x1;
			y0 = y1;
			
			counter++;
			
		}
		
	}
}

