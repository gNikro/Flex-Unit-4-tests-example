package example.io 
{
	import flash.events.Event;
	import flash.net.FileReference;
	/**
	 * ...
	 * @author 
	 */
	public class PublishToFile implements IPublisher 
	{
		
		public var file:FileReference;
		private var data:String;
		
		public function PublishToFile() 
		{
			initilize();
		}
		
		private function initilize():void 
		{
			file = new FileReference();
			
		}
		

		
				
		/**
		 * @inheritDoc
		 * 
		 */
		public function publish(data:String):void
		{
			this.data = data;
			
			file.save(data, 'FilmsList.txt');
		}
		
	}

}