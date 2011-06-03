package com.andrecocuroci.youtube {
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;
	import com.andrecocuroci.youtube.events.YoutubeEvent;
	import flash.events.IOErrorEvent;
	
	public class Youtube extends Loader {

		private var _player:Object;
		
		private var _chromeless:Boolean;
		private var _videoId:String;
		private var _startSeconds:Number;
		private var _suggestedQuality:String;
		private var _autoPlay:Boolean;
		
		private var _width:Number;
		private var _height:Number;	
		
		private var _url:String;
		
		private static const URL_API:String = 'http://www.youtube.com/apiplayer?version=3';
		private static const URL_API_PLAYER:String = 'http://www.youtube.com/v/';
		
		
		public function Youtube(chromeless:Boolean, videoId:String, startSeconds:Number = 0, suggestedQuality:String = 'default', autoPlay:Boolean = false)
		{
			super();
			
			security();
			
			_videoId = videoId;
			_startSeconds = startSeconds;
			_suggestedQuality = suggestedQuality;
			_autoPlay = autoPlay;
			
			if(chromeless) {
				_url = URL_API;
			} else {
				_url = URL_API_PLAYER+_videoId;
			}
			
			this.contentLoaderInfo.addEventListener(Event.COMPLETE, playerCarregado);
			this.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, playerError);
			this.load(new URLRequest(_url));
		
		}
		
		public function tamanhoPlayer(w:Number, h:Number):void
		{
			_width = w;
			_height = h;
			
			_player.setSize(_width,_height)
		}
		
		private function playerCarregado(e:Event): void
		{		
			this.content.addEventListener("onReady", onPlayerReady);
    		this.content.addEventListener("onStateChange", onPlayerStateChange);
		}
		
		private function playerError(e:IOErrorEvent): void
		{		
			trace(e);
		}
		
		private function onPlayerReady(e:Event): void
		{		
			_player = this.content;
			
			if(!_autoPlay) {
				_player.cueVideoById(_videoId, _startSeconds, _suggestedQuality);	
			} else {
				_player.loadVideoById(_videoId, _startSeconds, _suggestedQuality);	
			}
			
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.LOAD_PLAYER);
			dispatchEvent(evt);		
			
			this.content.removeEventListener("onReady", onPlayerReady);
		}
		
		private function onPlayerStateChange(e:Event): void
		{
			
		}
		
		private function security():void
		{						
			Security.allowDomain('*');
			Security.allowDomain('http://youtube.com.br');
			Security.allowDomain('http://www.youtube.com.br');
			Security.allowDomain('http://s.ytimg.com');
			Security.allowDomain("http://i3.ytimg.com/");
		}
	}	
}
