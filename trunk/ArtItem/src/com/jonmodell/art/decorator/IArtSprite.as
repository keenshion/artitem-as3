package com.jonmodell.art.decorator
{
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	public interface IArtSprite extends IEventDispatcher
	{
		function start():void;
		function draw():void;
		
		function set x(val:Number):void;
		function set y(val:Number):void;
		function get x():Number;
		function get y():Number;
		
		function set progress(val:Number):void;
		function get progress():Number;
		
		function set lastPoint(val:Point):void;
		function get lastPoint():Point;
	}
}