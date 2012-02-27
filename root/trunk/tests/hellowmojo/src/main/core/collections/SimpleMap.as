package core.collections 
{
	/**
	 * ...
	 * @author 
	 */
	public class SimpleMap 
	{
		
		private var map:Object;
		
		public function SimpleMap() 
		{
			initilize();
		}
		
		public function get storage():Object
		{
			return map;
		}
		
		private function initilize():void 
		{
			map = { };
		}
		
		public function getItem(key:String):*
		{
			return map[key];
		}
		
		public function addItem(key:String, item:*):void
		{
			map[key] = item;
		}
		
		public function removeItem(key:String):void
		{
			delete map[key];
		}
		
	}

}