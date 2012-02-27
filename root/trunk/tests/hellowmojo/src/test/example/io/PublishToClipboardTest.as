package example.io 
{
	
	/**
	 * ...
	 * @author 
	 */
	public class PublishToClipboardTest 
	{
		private var publisher:PublishToClipboard;
		private var etalon:String = 'publish it';
		
		
		
		[Before]
		public function standUp():void
		{
			publisher = new PublishToClipboard();
		}
		
		[Test]
		public function testPublish():void
		{
			/**
			 * не можем протестить правильная ли строка задалась на клип борд но все же
			 * проверим сам факт вызова метода
			 */
			publisher.publish(etalon);
		}
	}

}