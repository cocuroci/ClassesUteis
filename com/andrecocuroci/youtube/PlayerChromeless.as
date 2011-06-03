package com.andrecocuroci.youtube {
	
	import com.andrecocuroci.youtube.base.Youtube;
	import com.andrecocuroci.youtube.events.YoutubeEvent;

	public class PlayerChromeless extends Youtube {
		
		private static const URL_API:String = 'http://www.youtube.com/apiplayer?version=3';		
		
		public function PlayerChromeless ()
		{
			super();
			url = URL_API;
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
*/	}	
}
