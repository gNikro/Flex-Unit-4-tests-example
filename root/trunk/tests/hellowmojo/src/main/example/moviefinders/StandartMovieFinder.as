package example.moviefinders 
{
	import example.Library;
	import example.model.Movie;

	
	/**
	 * Класс реализующий интерфейс <code>IMovieFinder</code>
	 * Служаший для поиска списка фильмов каким то образом
	 * 
	 * @see example.model.Movie
	 * 
	 * @see FakeMovieFinder
	 * @see IMovieFinder
	 * 
	 * @author Nikro
	 */
	public class StandartMovieFinder implements IMovieFinder 
	{
		
		public function StandartMovieFinder() 
		{
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMovies():Vector.<Movie> 
		{
			var list:Vector.<Movie> = new Vector.<Movie>;
			
			for each(var xml:XML in Library.library.movie)
			{
				var movie:Movie = new Movie();
				movie.movieDescription = xml.toString();
				movie.movieName = xml.@movieName;
				
				list.push(movie);
			}
			
			return list;
		}
		
	}

}