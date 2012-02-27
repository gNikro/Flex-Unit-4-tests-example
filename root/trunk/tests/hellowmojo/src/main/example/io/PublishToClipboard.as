package example.io 
{
	import flash.system.System;
	/**
	 * ...
	 * @author 
	 */
	public class PublishToClipboard implements IPublisher 
	{
		
		public function PublishToClipboard() 
		{
			
		}
		
		/**
		 * @inheritDoc
		 * 
		 */
		public function publish(data:String):void 
		{
			System.setClipboard(data);
		}
		
	}

}