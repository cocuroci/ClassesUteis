package com.andrecocuroci.youtube {
	
	import com.andrecocuroci.youtube.base.Youtube;
	import com.andrecocuroci.youtube.events.YoutubeEvent;
	
	public class PlayerChromeless extends Youtube {
		
		/*
		* VARIÁVEL ESTÁTICA QUE CONTÉM A URL DA API
		*/
		private static const URL_API:String = 'http://www.youtube.com/apiplayer?version=3';		
		
		
		/*
		* MÉTODO QUE CARREGA O VÍDEO PELO ID. COM ESTE METODO O VÍDEO COMEÇA PAUSADO 
		*/
		public function $cueVideoById(videoId:String, startSeconds:Number=0, suggestedQuality:String='default'):void
		{
			player.cueVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		/*
		* MÉTODO QUE CARREGA O VÍDEO PELO ID. COM ESTE METODO O VÍDEO COMEÇA ASSIM QUE FOR CARREGADO
		*/
		public function $loadVideoById(videoId:String, startSeconds:Number=0, suggestedQuality:String='default'):void
		{
			player.loadVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		/*
		* MÉTODO QUE CARREGA O VÍDEO PELO URL DO YOUTUBE
		*/
		public function $cueVideoByUrl(mediaContentUrl:String, startSeconds:Number):void
		{
			player.cueVideoByUrl(mediaContentUrl, startSeconds);
		}
		
		/*
		* MÉTODO QUE INICIA O VÍDEO
		*/
		public function $playVideo():void
		{
			player.playVideo();
		}
		
		/*
		* MÉTODO QUE PAUSA O VÍDEO
		*/
		public function $pauseVideo():void
		{
			player.pauseVideo();
		}
		
		/*
		* MÉTODO QUE PARA O VÍDEO
		*/
		public function $stopVideo():void
		{
			player.stopVideo();
		}
		
		/*
		* MÉTODO QUE PROCURA O PONTO EM SEGUNDOS DE UM VÍDEO
		*/
		public function $seekTo(seconds:Number, allowSeekAhead:Boolean):void
		{
			player.seekTo(seconds, allowSeekAhead);
		}
		
		/*
		* MÉTODO QUE DESATIVA O ÁUDIO DO PLAYER
		*/
		public function $mute():void
		{
			player.mute();
		}
		
		/*
		* MÉTODO QUE ATIVA O ÁUDIO DO PLAYER
		*/
		public function $unMute():void
		{
			player.unMute();
		}
		
		/*
		* MÉTODO QUE RETORNA TRUE SE O VÍDEO ESTIVER SEM ÁUDIO E FALSE SE TIVER COM ÁUDIO
		*/
		public function $isMuted():Boolean
		{
			return player.isMuted();
		}
		
		/*
		* MÉTODO QUE SETA O VOLUME DO VÍDEO, VALORES ACEITOS DE 0 A 100
		*/
		public function $setVolume(volume:Number):void
		{
			player.setVolume(volume);
		}
		
		/*
		* MÉTODO QUE RETORNA O VOLUME DO VÍDEO (MESMO SE O ÁUDIO TIVER DESATIVADO);
		*/
		public function $getVolume():Number
		{
			return player.getVolume();
		}
		
		/*
		* MÉTODO QUE RETORNA O NÚMEROS DE BYTES CARREGADOS
		*/
		public function $getVideoBytesLoaded():Number
		{
			return player.getVideoBytesLoaded();
		}
		
		/*
		* MÉTODO QUE RETORNA O NÚMEROS DE BYTES TOTAL
		*/
		public function $getVideoBytesTotal():Number
		{
			return player.getVideoBytesTotal();
		}
		
		/*
		* MÉTODO QUE RETORNA O NÚMERO DE BYTES A PARTIR DO VÍDEO E POSIÇÃO QUE FOI CARREGADO
		*/
		public function $getVideoStartBytes():Number
		{
			return player.getVideoStartBytes();
		}
		
		/*
		* MÉTODO QUE RETORNA O ESTADO DO PLAYER. (não iniciado (-1), encerrado (0), em reprodução (1), pausado (2), armazenando em buffer (3), vídeo indicado (5))
		*/
		public function $getPlayerState():Number
		{
			return player.getPlayerState();
		}
		
		/*
		* MÉTODO QUE RETORNA O TEMPO DECORRIDO DO VÍDEO CARREGADO
		*/
		public function $getCurrentTime():Number
		{
			return player.getCurrentTime();
		}
		
		/*
		* MÉTODO QUE RETORNA A QUALIDADE REAL DO VÍDEO ATUAL
		*/
		public function $getPlaybackQuality():String
		{
			return player.getPlaybackQuality();
		}
		
		/*
		* MÉTODO QUE SETA A QUALIDADE DO VIDEO, VALORES POSSÍVEIS: small, medium, large, hd720 E default
		*/
		public function $setPlaybackQuality(suggestedQuality:String):void
		{
			player.setPlaybackQuality(suggestedQuality);
		}
		
		/*
		* MÉTODO QUE RETORNA UM CONJUNTO DE QUALIDADES DISPONÍVEIS PARA O VIDEO CARREGADO
		*/
		public function $getAvailableQualityLevels():Array
		{
			return player.getAvailableQualityLevels();
		}
		
		/*
		* MÉTODO QUE RETORNA A DURAÇÃO EM SEGUNDOS DO VÍDEO
		*/
		public function $getDuration():Number
		{
			return player.getDuration();
		}
		
		/*
		* MÉTODO QUE RETORNA A URL DO VÍDEO ATUAL
		*/
		public function $getVideoUrl():String
		{
			return player.getVideoUrl();
		}
		
		/*
		* MÉTODO QUE RETORNA O CÓDIGO INCORPORADO PARA O VÍDEO CARREGADO
		*/
		public function $getVideoEmbedCode():String
		{
			return player.getVideoEmbedCode();
		}
		
		/*
		* MÉTODO QUE RETORNA O CÓDIGO INCORPORADO PARA O VÍDEO CARREGADO
		*/
		public function $destroy():void
		{
			player.destroy();
			player = null;
		}

		
		/*
		* CONSTRUTOR
		*/
		public function PlayerChromeless()
		{
			super(URL_API);
		}
	}
}