package example.model 
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	/**
	 * ...
	 * @author 
	 */
	public class MovieListModelTest 
	{
		
		private var model:MovieListModel = new MovieListModel();
	
		
		[Test]
		public function testSetFilter():void
		{
			var foo:Function = new Function();
			model.filter = foo;
			
			
			assertThat(model.filter, equalTo(foo));
		}
	}
}