package example.moviefinders 
{
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
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
			//hamcrest smart test example with array match
			assertThat(fakeMovieFinder.getMovies(), arrayWithSize(10));
			
			assertThat('the FakeMovieFinder should provide 10 elements on getMovies', fakeMovieFinder.getMovies().length , equalTo(10));
		}
		
		[Test]
		public function testGetMoviesFail():void
		{
			assertThat('the FakeMovieFinder should provide 10 elements on getMovies', 5, not(equalTo(fakeMovieFinder.getMovies().length)));
		}
		
	}

}