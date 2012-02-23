package example.moviefinders 
{
	import example.model.Movie;
	/**
	 * Класс реализующий интерфейс <code>IMovieFinder</code>
	 * Служаший для поиска списка фильмов каким то образом
	 * 
	 * @see example.model.Movie
	 * 
	 * @see StandartMovieFinder
	 * @see IMovieFinder
	 * 
	 * @author Nikro
	 */
	public class FakeMovieFinder implements IMovieFinder 
	{
		
		public function FakeMovieFinder() 
		{
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMovies():Vector.<Movie> 
		{
			var list:Vector.<Movie> = new Vector.<Movie>;
			for (var i:int = 0; i < 10; i++)
			{
				var movie:Movie = new Movie();
				
				movie.movieName = 'Spacemarine legion: ' + Math.floor(Math.random() * 100);
				movie.movieDescription = 'In the future there is only war....';
				
				list.push(movie);
				
			}
			
			return list;
		}
		
	}

}