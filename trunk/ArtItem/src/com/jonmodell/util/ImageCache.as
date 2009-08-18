package com.jonmodell.util
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class ImageCache extends EventDispatcher
	{
		public function ImageCache(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function capture(src:DisplayObject):Bitmap{
				
				var bd:BitmapData = new BitmapData(src.width, src.height);
				bd.draw(src);
				
				return new Bitmap(bd);
				
				/* 
				var jpe:JPEGEncoder = new JPEGEncoder(70);
				var ba:ByteArray = jpe.encode(bd); 
				*/
				
			}

	}
}