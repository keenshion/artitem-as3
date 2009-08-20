package com.jonmodell.art.decorator
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class AbstractDecorator extends Sprite implements IArtSprite
	{
		protected var _decorated : IArtSprite;
		
		
		public function set progress(val:Number):void{
				_decorated.progress = val;
		}
		public function get progress():Number{
			return _decorated.progress;
		}
		
		public function set lastPoint(val:Point):void{
				_decorated.lastPoint = val;
		}
		public function get lastPoint():Point{
			return _decorated.lastPoint;
		}

		public function AbstractDecorator(decorated:IArtSprite)
		{
			this._decorated = decorated;
			this.addChild(_decorated as Sprite);
		}

		public function start():void
		{
			return _decorated.start();
		}
		
		public function draw():void
		{
			return _decorated.draw();
		}
		
	}
}