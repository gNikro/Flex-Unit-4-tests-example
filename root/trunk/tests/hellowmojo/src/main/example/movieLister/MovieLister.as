package  example.movieLister
{
	import example.model.Movie;
	import example.model.MovieListModel;
	import example.moviefinders.IMovieFinder;

	/**
	 * Сервис предоставляющий список клипов найденых по какому то алгоритму поиска и отфильтрованых по
	 * каким то параметрам
	 * 
	 * @author Nikro
	 */
	public class MovieLister 
	{	
		private var movieFinder:IMovieFinder;
		
		public function MovieLister() 
		{
			
		}
		
		/**
		 * Ижектит муви финдер в этот объект таким образом этот сервис может использовать разные
		 * алгоритмы для поиска фильмов
		 * 
		 * NOTE: в таком случае лучше воспользоватся сервис локатором наверно для внедрения разных муви финдеров
		 * 
		 * @param	movieFinder - объект реализующий интерфейс <code>IMovieFinder</code>
		 */
		public function injectMovieFinder(movieFinder:IMovieFinder):void
		{
			this.movieFinder = movieFinder;
		}
		
		/**
		 * Возвращает список фильмов найденых сервисом
		 * @param	filter - функция фильтр для исключения ненужных по какому то параметру фильмов, стандартная функция формата <code>Array.filter</code>
		 * @return <code>Vecotr</code> - список объектов фильмов типа <code>Movie</code>
		 */
		public function getMoviesList(filter:Function = null):Vector.<Movie>
		{
			var list:Vector.<Movie> = movieFinder.getMovies();
			
			//if(filter != null)
			//	list = list.filter(filter);
				
			return list;
		}
		
		private function sortMovies():void
		{
			
		}
		
	}

}