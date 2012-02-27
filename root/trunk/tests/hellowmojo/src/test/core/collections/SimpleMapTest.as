package core.collections 
{
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	/**
	 * ...
	 * @author 
	 */
	public class SimpleMapTest 
	{
		
		private var item1:String = 'test1';
		private var key1:String = 'testKey1';
		
		private var item2:String = 'test2';
		private var key2:String = 'testKey2';
		
		[Test]
		public function collectionTest():void
		{
			var map:SimpleMap = new SimpleMap();
			
			assertThat(map.storage, not(equalTo(null)));
			
			map.addItem(key1, item1);
			map.addItem(key2, item2);
			
			assertThat(map.getItem(key1), equalTo(item1));
			assertThat(map.getItem(key2), equalTo(item2));
		}
		
	}

}