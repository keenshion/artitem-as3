package com.jonmodell.art.inheritance
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;

	public class ArtItem extends Sprite implements IArtItem
	{
		// every repeating item needs a timer
		protected var timer 		: Timer;
		
		// and a counter
		public var counter		: Number;
		
		// this property is set to determine how many repeats
		public var iterations 	: Number;
		
		// the repeat rate in milliseconds
		public var rate			: Number;
		
		public var increment		: Number;
		
		public var color			: uint;

		// storage for the last values
		protected var x0			: Number;
		
		protected var y0			: Number;
		
		protected var width0		: Number;
		
		protected var height0		: Number;
		
		
		[Bindable] private var _propertyCollection: ArrayCollection;
		[Bindable] public function get propertyCollection():ArrayCollection { return _propertyCollection; }
		public function set propertyCollection(val:ArrayCollection):void { _propertyCollection = val; }
		
		
		public function ArtItem()
		{
			super();
		}
		
		public function draw():void{
			for(var r:Number = this.numChildren - 1; r >= 0; r--){
				this.removeChildAt(r);
			}
			
			counter = 0;
			x0 = 0;
			y0 = 0;
			
			// start the timer
			if(timer){
				timer.removeEventListener(TimerEvent.TIMER, update);
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);	
			}

			timer 			= new Timer(rate,iterations);
			timer.addEventListener(TimerEvent.TIMER, update);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			timer.start();
		}
		
		protected function update(e:TimerEvent):void{
			
		}
		
		private function onTimerComplete(e:TimerEvent):void{
			(e.target as Timer).removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
	}
}