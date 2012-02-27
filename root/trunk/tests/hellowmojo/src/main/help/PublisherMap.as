package help 
{
	import core.collections.SimpleMap;
	import example.io.IPublisher;
	/**
	 * ...
	 * @author 
	 */
	public class PublisherMap 
	{
		private var map:SimpleMap;
		
		public function PublisherMap() 
		{
			initilize();
		}
		
		private function initilize():void 
		{
			map = new SimpleMap();
		}
		
		public function addPublisher(publisher:IPublisher, id:String):void
		{
			map.addItem(id, publisher);
		}
		
		public function getPublisher(id:String):IPublisher
		{
			return map.getItem(id) as IPublisher;
		}
		
		public function getPublishersList():Array
		{
			var a:Array = [];
			
			for ( var id:String in map.storage)
			{
				a.push( { label:id, data:id } );
			}
			
			return a;
		}
	}

}