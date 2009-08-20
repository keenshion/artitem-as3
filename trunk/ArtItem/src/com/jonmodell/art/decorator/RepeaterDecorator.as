package com.jonmodell.art.decorator
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class RepeaterDecorator extends AbstractDecorator
	{
		
		// timer
		private		var timer 			: Timer;
		
		// total drawing repetitions
		public 		var steps	 		: Number;
		
		// to keep track of the current step
		public 		var currentStep		: Number;
		
		// rate
		public 		var rate			: Number;
		
		public function RepeaterDecorator(decorated:IArtSprite, steps:Number = 50, rate:Number = 50)
		{
			super(decorated);
			this.steps 	= steps;
			this.rate 	= rate;
		}
		
		override public function start():void{
			_decorated.start();
			currentStep 	= 0;
			// start the timer
			if(timer){
				timer.removeEventListener(TimerEvent.TIMER, update);
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);	
			}

			timer 			= new Timer(rate,steps);
			timer.addEventListener(TimerEvent.TIMER, update);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			timer.start();
			
			//trace ('Repeater Start');
		}
		
		private function update(e:TimerEvent):void{
			currentStep++;
			progress = currentStep / steps;
			draw();
			
		}
		
		override public function draw():void{
			//trace('repeater draw');
			
			_decorated.draw();
		}
		
		private function onTimerComplete(e:TimerEvent):void{
			(e.target as Timer).removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}

	}
}