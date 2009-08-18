package com.jonmodell.art
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class ArtItem extends Sprite implements IArtItem
	{
		protected var timer 		: Timer;
		
		protected var counter		: Number;
		
		protected var iterations 	: Number;
		protected var increment	: Number;
		protected var color		: uint;
		protected var rate		: Number;
		
		// storage for the last values
		protected var x0			: Number;
		protected var y0			: Number;
		
		protected var width0		: Number;
		protected var height0		: Number;
		
		protected var cir			: Number = 0;
		
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