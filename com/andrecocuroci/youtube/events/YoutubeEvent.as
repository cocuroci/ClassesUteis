package com.andrecocuroci.youtube.events  {
	
	import flash.events.Event;
	
	public class YoutubeEvent extends Event {
		
		public static const LOAD_PLAYER:String = "YoutubeLoadPlayer";
		public static const STATE_CHANGE:String = "YoutubeStateChange";
		public static const QUALITY_CHANGE:String = "YoutubeQualityChange";
		public static const ERROR:String = "YoutubeERROR";
		
		private var _change:String;
		private var _quality:String;
		private var _error:String;
		
		public function YoutubeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set change(value:String):void
		{
			_change = value;
		}
		
		public function get change():String
		{
			return _change;
		}
		
		public function set quality(value:String):void
		{
			_quality = value;
		}
		
		public function get quality():String
		{
			return _quality;
		}
		
		public function set error(value:String):void
		{
			_error = value;
		}
		
		public function get error():String
		{
			return _error;
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
