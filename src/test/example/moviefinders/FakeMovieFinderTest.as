package example.moviefinders 
{
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	/**
	 * ...
	 * @author 
	 */
	public class FakeMovieFinderTest 
	{
		
		public function FakeMovieFinderTest() 
		{
			super();
		}
		
		[DataPoint]
		public static var fakeMovieFinder:FakeMovieFinder = new FakeMovieFinder();
		
		
		
		[Test]
		public function testGetMovies():void
		{
			assertThat('the FakeMovieFinder should provide 10 elements on getMovies', fakeMovieFinder.getMovies().length , equalTo(10));
		}
		
		[Test]
		public function testGetMoviesFail():void
		{
			assertThat('the FakeMovieFinder should provide 10 elements on getMovies', 5, not(equalTo(fakeMovieFinder.getMovies().length)));
		}
		
	}

}