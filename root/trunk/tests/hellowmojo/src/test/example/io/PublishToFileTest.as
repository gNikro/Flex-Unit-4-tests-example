package example.io 
{
	import flash.events.Event;
	import flash.net.FileReference;
	import org.flexunit.async.Async;
	
	/**
	 * ...
	 * @author 
	 */
	public class PublishToFileTest 
	{
		private var publisher:PublishToFile;
		private var etalon:String = 'publish it';
		
		
		
		[Before]
		public function standUp():void
		{
			publisher = new PublishToFile();
		}
		
		[Test(async,timeout="500")]
		public function testPublish():void
		{
			/**
			 * NOTE тут вообще не пишу тест т.к будет открыватся диалогове окно :O
			 */
			//publisher.publish(etalon);
			
			//publisher.file.
		}
	}

}