package example.controller 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	/**
	 * ...
	 * @author 
	 */
	public class MovieListControllerTest 
	{
		private var controller:MovieListController;
		
		public function MovieListControllerTest() 
		{
			super();
		}
		
		[DataPoint]
		private var instance:Sprite;
		
		[Before]
		public function startUp():void
		{
			instance = new Sprite();
			controller = new MovieListController(instance);
		}
		
		[Test(ui)]
		public function creationTest():void
		{
			controller.showList();
			
			assertThat(controller.view, not(equalTo(null)));
			assertThat(controller.view.parent, not(equalTo(null)));
		}
		
		[Test]
		public function standartMovielisterTest():void
		{
			controller.setStandartMovieLister();
			controller.fillMoviesList();
			
			assertThat(controller.model.listOfMovies, not(equalTo(null)));
		}
		
		[Test]
		public function fakeMovielisterTest():void
		{
			controller.setFakeMovieLister();
			controller.fillMoviesList();
			
			assertThat(controller.model.listOfMovies, not(equalTo(null)));
		}
		
	}

}