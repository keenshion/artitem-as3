package com.jonmodell.art.decorator
{
	import flash.geom.Point;
	
	public class CurvyScribbleDecorator extends AbstractDecorator
	{
		public var color			: uint;
		public var jumpSize			: Number = 25;
		public var maxWidth			: Number;
		public var maxHeight		: Number;
		public var minLineWeight	: Number;
		public var maxLineWeight	: Number;
		public var minAlpha			: Number;
		public var maxAlpha			: Number;
		
		public function CurvyScribbleDecorator(
			decorated:IArtSprite, 
			color:uint 				= 0x000000,
			jumpSize:Number			= 25,
			maxWidth:Number 		= 600,
			maxHeight:Number 		= 600,
			minLineWeight:Number 	= 0.1,
			maxLineWeight:Number 	= 4,
			minAlpha:Number 		= 0.3,
			maxAlpha:Number 		= 1)
		{
			super(decorated);
			this.color 			= color;
			this.jumpSize 		= jumpSize;
			this.maxWidth 		= maxWidth;
			this.maxHeight 		= maxHeight;
			this.minLineWeight 	= minLineWeight;
			this.maxLineWeight 	= maxLineWeight;
			this.minAlpha 		= minAlpha;
			this.maxAlpha 		= maxAlpha;
			
			
		}
		
		override public function draw():void
		{
			var weight:Number	= (minLineWeight) + (maxLineWeight - minLineWeight) * progress;
			var alpha:Number 	= minAlpha + ((maxAlpha - minAlpha)*(progress));
			
			this.graphics.lineStyle(weight ,color, alpha);

			var x1 : Number = maxWidth;
			while((x1 > maxWidth / 2) || (x1 < -maxWidth / 2)){
				x1 = randomJump() + lastPoint.x;
			}
			
			var y1 : Number = maxHeight;
			while((y1 > maxHeight / 2) || (y1 < -maxHeight / 2)){
				y1 = randomJump() + lastPoint.y;
			}
			
			var cx:Number = randomJump() + lastPoint.x;
			var cy:Number = randomJump() + lastPoint.y;

			this.graphics.curveTo(cx,cy,x1,y1);
			
			lastPoint = new Point(x1,y1);
			
			//trace('curvy scribble draw');
			
			_decorated.draw();
		}
		
		private function randomJump():Number{
			return -jumpSize + (Math.random()*(2*jumpSize));
		}
		
		override public function start():void{
			_decorated.start();
			
			for(var r:Number = this.numChildren - 1; r >= 0; r--){
				this.removeChildAt(r);
			}
		}

	}
}