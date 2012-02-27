package  
{
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;
	/**
	 * ...
	 * @author 
	 */
	public class DelegateTest 
	{
		private var etalon:String = 'test';
		private var etalonArray:Array = [1, 2, 3];
		
		[Test]
		public function testDelegate():void
		{
			Delegate.create(functionStringHandler, etalon)();
			Delegate.create(functionStringArrayHandler, etalon, etalonArray)();

		}
		
		private function functionStringArrayHandler(arg1:String, arg2:Array):void 
		{
			assertThat(arg1, equalTo(etalon));
			assertThat(arg2, array(1, 2, 3));
		}
		
		private function functionStringHandler(s:String):void 
		{
			assertThat(s, equalTo(etalon));
		}
		
	}

}