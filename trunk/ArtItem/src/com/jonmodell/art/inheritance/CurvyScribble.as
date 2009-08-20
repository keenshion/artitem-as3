package com.jonmodell.art.inheritance
{
	import flash.events.TimerEvent;
	
	import mx.collections.ArrayCollection;

	public class CurvyScribble extends ArtItem
	{
		public var widthConstraint			: Number;
		
		public var heightContstraint		: Number;
		
		public var cycle					: Number = 0;
		
		public var iterationsPerCycle		: Number = 100;
		
		public function CurvyScribble(
			iterations:Number 			= 300, 
			rate:Number 				= 100, 
			color:uint 					= 0x000000, 
			widthConstraint:Number 		= 600,
			heightContstraint:Number 	= 600){
			
			super();
			this.iterations 			= iterations;
			this.rate 					= rate;
			this.increment 				= (Math.PI *2)/iterations;
			this.color 					= color;
			this.widthConstraint 		= widthConstraint;
			this.heightContstraint 		= heightContstraint;
		}
		
		override public function get propertyCollection():ArrayCollection{
			return new ArrayCollection([
				{name:'width constraint', property: 'widthConstraint', type:'Number', value:'600'}
			]);
		}
		
		
		override protected function update(e:TimerEvent):void{
			
			if(counter%iterationsPerCycle == 0) cycle++;
			
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

