package com.andrecocuroci.youtube {
	
	import com.andrecocuroci.youtube.base.Youtube;
	import com.andrecocuroci.youtube.events.YoutubeEvent;

	public class PlayerYoutube extends Youtube {
		
		private static const URL_API:String = 'http://www.youtube.com/v/';	
		private static const VERSAO_API:String = '?version=3';
		
		public function PlayerYoutube(idVideo:String)
		{
			super(URL_API+idVideo+VERSAO_API)
		}
	}	
}
