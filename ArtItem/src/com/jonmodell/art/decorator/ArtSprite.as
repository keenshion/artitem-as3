package com.jonmodell.art.decorator
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	// base DecoratED class
	public class ArtSprite extends Sprite implements IArtSprite
	{	
		// contains actual implementation of progress variable
		private var _progress			: Number = 0;
		public function set progress(val:Number):void{ _progress = val;}
		public function get progress():Number{return _progress;}
		
		// contains actual implementation of progress variable
		private var _lastPoint			: Point = new Point(0,0);
		public function set lastPoint(val:Point):void{ _lastPoint = val;}
		public function get lastPoint():Point{return _lastPoint;}

		public function ArtSprite()
		{
		}

		public function start():void{
			//trace('basic start');
		}

		public function draw():void{
			//trace('basic draw');
		}
		
		
		
	}
}