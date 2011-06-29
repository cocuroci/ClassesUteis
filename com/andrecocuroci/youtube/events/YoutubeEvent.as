package com.andrecocuroci.youtube.events  {
	
	import flash.events.Event;
	
	public class YoutubeEvent extends Event {
		
		/*
		* CONSTANTES PARA OS EVENTOS
		*/
		public static const LOAD_PLAYER:String = "load_player";
		public static const STATE_CHANGE:String = "state_change";
		public static const QUALITY_CHANGE:String = "quality_change";
		public static const ERROR:String = "error";
		
		/*
		* VARIÁVEIS PRIVADAS QUE MOSTRAM OS STATUS DO PLAYER
		*/
		private var _change:String;
		private var _quality:String;
		private var _error:String;		
		
		/*
		* GET E SETER DOS STATUS DO PLAYER
		*/
		public function set change(value:String):void
		{
			_change = value;
		}
		
		public function get change():String
		{
			return _change;
		}
		
		/*
		* GET E SETER DA QUALIDADE DO VIDEO DO PLAYER
		*/
		public function set quality(value:String):void
		{
			_quality = value;
		}
		
		public function get quality():String
		{
			return _quality;
		}
		
		/*
		* GET E SETER DOS ERROS DO PLAYER
		*/
		public function set error(value:String):void
		{
			_error = value;
		}
		
		public function get error():String
		{
			return _error;
		}
		
		/*
		* MÉTODOS SOBRESCRITOS
		*/
		override public function clone():Event
		{
			return new YoutubeEvent(type, bubbles, cancelable);
		}
		
		override public function toString() : String
		{
			return formatToString("YoutubeEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
		
		/*
		* CONSTRUTOR
		*/
		public function YoutubeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}	
}
