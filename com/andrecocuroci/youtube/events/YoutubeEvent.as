package com.andrecocuroci.youtube.events  {
	
	import flash.events.Event;
	
	public class YoutubeEvent extends Event {
		
		public static const LOAD_PLAYER:String = "YoutubeLoadPlayer";
		
		public function YoutubeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new YoutubeEvent(type, bubbles, cancelable);
		}
		
		override public function toString() : String
		{
			return formatToString("YoutubeEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}	
}
