package com.andrecocuroci.youtube {
	
	import com.andrecocuroci.youtube.base.Youtube;
	import com.andrecocuroci.youtube.events.YoutubeEvent;
	
	public class PlayerChromeless extends Youtube {
		
		private static const URL_API:String = 'http://www.youtube.com/apiplayer?version=3';		
		
		public function PlayerChromeless ()
		{
			super(URL_API);
		}
		
		/* METODO QUE CARREGA O VIDEO PELO ID. COM ESTE METODO O VIDEO COMEÇA PAUSADO */
		public function cueVideoById(videoId:String, startSeconds:Number=0, suggestedQuality:String='default'):void
		{
			player.cueVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		/* METODO QUE CARREGA O VIDEO PELO ID. COM ESTE METODO O VIDEO COMEÇA ASSIM QUE FOR CARREGADO */
		public function loadVideoById(videoId:String, startSeconds:Number=0, suggestedQuality:String='default'):void
		{
			player.loadVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		/* METODO QUE INICIA O VIDEO */
		public function playVideo():void
		{
			player.playVideo();
		}
		
		/* METODO QUE PAUSA O VIDEO */
		public function pauseVideo():void
		{
			player.pauseVideo();
		}
		
		/* METODO QUE PARA O VIDEO */
		public function stopVideo():void
		{
			player.stopVideo();
		}
	}
}