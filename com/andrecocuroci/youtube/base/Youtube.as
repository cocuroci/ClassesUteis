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
		
		public function Youtube(url:String)
		{
			super();
			security();
			
			_url = url;
			
			start();
		}		
		
		public function get player():Object
		{
			return _player;
		}			
		
		private function start():void
		{
			this.contentLoaderInfo.addEventListener(Event.COMPLETE, playerCarregado);
			this.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, playerError);
			this.load(new URLRequest(_url));
		}
		
		private function playerCarregado(e:Event): void
		{		
			trace('Player carregado');
			this.content.addEventListener("onReady", onPlayerReady);
    		this.content.addEventListener("onStateChange", onPlayerStateChange);
			this.content.addEventListener("onPlaybackQualityChange", onPlayerQualityChange);
			this.content.addEventListener("onError", onPlayerError);
		}
		
		private function playerError(e:IOErrorEvent): void
		{		
			trace('Erro ao carregar player :' + e);
		}
			

		private function onPlayerReady(e:Event): void
		{			
			_player = this.content;	
			
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.LOAD_PLAYER);
			dispatchEvent(evt);		
			
			_player.removeEventListener("onReady", onPlayerReady);
		}
		
		private function onPlayerStateChange(e:Event): void
		{
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.STATE_CHANGE);
			var n:Number = Object(e).data;
			
			switch(n)
			{
				case -1:
					evt.change = 'Não Iniciado';
					break;
				case 0:
					evt.change = 'Encerrado';
					break;
				case 1:
					evt.change = 'Em Reprodução';
					break;
				case 2:
					evt.change = 'Pausado';
					break;
				case 3:
					evt.change = 'Em Buffer';
					break;
				case 5:
					evt.change = 'Vídeo Indicado';
					break;
			}
			
			dispatchEvent(evt);
		}
		
		private function onPlayerQualityChange(e:Event): void
		{
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.QUALITY_CHANGE);
			evt.quality = Object(e).data;
			
			dispatchEvent(evt);
		}
		
		private function onPlayerError(e:Event): void
		{
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.ERROR);
			var n:Number = Object(e).data;
			
			switch(n)
			{
				case 100:
					evt.error = 'Video não encontrado, removido ou privado';
					break;
				case 101:
					evt.error = 'Video não pode ser reproduzido em players incorporados';
					break;
				case 150:
					evt.error = 'Video não pode ser reproduzido em players incorporados';
					break;
			}
			
			dispatchEvent(evt);
		}
		
		private function security():void
		{						
			Security.allowDomain('*');
			Security.allowDomain('http://youtube.com.br');
			Security.allowDomain('http://www.youtube.com.br');
			Security.allowDomain('http://s.ytimg.com');
			Security.allowDomain("http://i3.ytimg.com");
		}
	}	
}
