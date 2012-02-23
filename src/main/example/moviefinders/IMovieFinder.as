package example.moviefinders 
{
	import example.model.Movie;
	
	/**
	 * Интерфейс используемый в <code>MovieLister</code> для получения списка фильмов найденых по какому то алгоритму
	 * @author Nikro
	 */
	public interface IMovieFinder 
	{
		/**
		 * Выдает список фильмов который был составлен алгоритмом заложеным внутри класса
		 * 
		 * @return <code>Vector</code> - список объектов класса <code>Movie</code>
		 */
		function getMovies():Vector.<Movie>
		
	
	}
	
}