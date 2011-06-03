package com.andrecocuroci.youtube.base {
	
	import com.andrecocuroci.youtube.events.YoutubeEvent;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.Security;
	
	public class Youtube extends Loader {
		
		private var _url:String;
		private var _player:Object;
		
		public function Youtube()
		{
			super();			
			security();		
		}
		
		public function set url(value:String):void
		{
			_url = value;
			start();
		}
		
		private function start():void
		{
			this.contentLoaderInfo.addEventListener(Event.COMPLETE, playerCarregado);
			this.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, playerError);
			this.load(new URLRequest(_url));
		}
		
/*		public function tamanhoPlayer(w:Number, h:Number):void
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
		}*/
		
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
