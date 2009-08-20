package com.jonmodell.art.inheritance
{
	import mx.collections.ArrayCollection;
	
	public interface IArtItem 
	{
		function draw():void;
		
		function get propertyCollection():ArrayCollection;
		
	}
}