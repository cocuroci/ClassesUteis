package com.andrecocuroci.youtube {
	
	import com.andrecocuroci.youtube.base.Youtube;
	import com.andrecocuroci.youtube.events.YoutubeEvent;

	public class PlayerChromeless extends Youtube {
		
		private static const URL_API:String = 'http://www.youtube.com/apiplayer?version=3';		
		
		public function PlayerChromeless ()
		{
			super(URL_API);
		}
	}
}