package com.andrecocuroci.youtube.base {
	
	import com.andrecocuroci.youtube.events.YoutubeEvent;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.Security;
	
	/*
	* Eventos da classe YoutubeEvent
	*/
	[Event(name="load_player", type="com.andrecocuroci.youtube.events.YoutubeEvent")]
	[Event(name="state_change", type="com.andrecocuroci.youtube.events.YoutubeEvent")]
	[Event(name="quality_change", type="com.andrecocuroci.youtube.events.YoutubeEvent")]
	[Event(name="error", type="com.andrecocuroci.youtube.events.YoutubeEvent")]	
	
	public class Youtube extends Loader {
		
		/*
		* VARIÁVEIS DA CLASSE
		*/
		private var _url:String; //VAR QUE CONTÉM A URL DA API
		protected var _player:Object; //VAR QUE CONTÉM A REFERENCIA DO PLAYER DO YOUTUBE	
		
		/*
		* MÉTODO QUE DEFINE O TAMANHO DO PLAYER
		*/
		public function $setSize(w:Number, h:Number):void
		{
			_player.setSize(w,h)
		}
		
		/*
		* MÉTODO PROTEGIDO PARA SER USADO APENAS NAS CLASSES QUE EXTENDEM A YOUTUBE. ELE RETORNA A REFERÊNCIA DO PLAYER
		*/
		protected function get player():Object
		{
			return _player;
		}
		
		/*
		* MÉTODO PROTEGIDO PARA SER USADO APENAS NAS CLASSES QUE EXTENDEM A YOUTUBE. ELE SETA A REFERÊNCIA DO PLAYER
		*/
		protected function set player(value:Object):void
		{
			_player = value;
		}
		
		/*
		* MÉTODO QUE INICIALIZA O CARREGAMENTO DO PLAYER
		*/
		private function start():void
		{
			this.contentLoaderInfo.addEventListener(Event.COMPLETE, playerCarregado);
			this.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, playerError);
			this.load(new URLRequest(_url));
		}
		
		/*
		* MÉTODO QUE ADICIONA OUVINTES A TODOS OS EVENTOS DA API DO YOUTUBE
		*/
		private function playerCarregado(e:Event): void
		{		
			this.content.addEventListener("onReady", onPlayerReady);
    		this.content.addEventListener("onStateChange", onPlayerStateChange);
			this.content.addEventListener("onPlaybackQualityChange", onPlayerQualityChange);
			this.content.addEventListener("onError", onPlayerError);
			
			this.contentLoaderInfo.removeEventListener(Event.COMPLETE, playerCarregado);
		}
		
		/*
		* MÉTODO CHAMADA CASO O PLAYER NÃO FOR CARREGADO
		*/
		private function playerError(e:IOErrorEvent): void
		{		
			trace('Erro ao carregar player :' + e);
			
			this.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, playerError);
		}
			
		/*
		* MÉTODO QUE DESPACHA O EVENTO AVISANDO QUE O PLAYER FOI CARREGADO E ESTÁ PRONTO PARA USO.
		*/
		private function onPlayerReady(e:Event): void
		{			
			_player = this.content;	
			
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.LOAD_PLAYER);
			dispatchEvent(evt);		
			
			_player.removeEventListener("onReady", onPlayerReady);
		}
		
		/*
		* MÉTODO QUE É  DESPACHADO TODA HORA QUE O PLAYER TEM SEU STATUS ALTERADO
		*/
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
		
		/*
		* MÉTODO QUE É DESPACHADO TODA HORA QUE O PLAYER TEM A QUALIDADE DO VIDEO ALTERADA
		*/
		private function onPlayerQualityChange(e:Event): void
		{
			var evt:YoutubeEvent = new YoutubeEvent(YoutubeEvent.QUALITY_CHANGE);
			evt.quality = Object(e).data;
			
			dispatchEvent(evt);
		}
		
		/*
		* MÉTODO QUE DESPACHA OS ERROS QUE PODEM OCORRER AO CARREGAR O PLAYER
		*/
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
		
		/*
		* MÉTODO QUE CONFIGURA ALGUMAS DIRETRIZES DE SEGURANÇA
		*/
		private function security():void
		{						
			Security.allowDomain('*');
			Security.allowDomain('http://youtube.com.br');
			Security.allowDomain('http://www.youtube.com.br');
			Security.allowDomain('http://s.ytimg.com');
			Security.allowDomain("http://i3.ytimg.com");
		}
		
		/*
		* CONSTRUTOR
		*/
		public function Youtube(url:String)
		{
			super();
			security();
			
			_url = url;
			
			start();
		}
	}	
}
