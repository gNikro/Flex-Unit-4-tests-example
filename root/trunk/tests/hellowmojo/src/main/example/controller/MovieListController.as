package example.controller 
{
	
	import example.model.Movie;
	import example.model.MovieListModel;
	import example.moviefinders.FakeMovieFinder;
	import example.moviefinders.StandartMovieFinder;
	import example.movieLister.MovieLister;
	
	import example.view.MovieList;
	import flash.display.DisplayObjectContainer;
	/**
	 * Класс инкапсулирующий логику работы списка фильмов
	 * Создает:
	 * <code>view:MovieList</code> 
	 * и
	 * <code>model:MovieListModel</code>
	 * 
	 * @author Nikro
	 */
	public class MovieListController 
	{
		/**
		 * Модель списка содержит в себе информацию о фильмах которые должны быть отображены и прочее
		 * @default null
		 */
		public var model:MovieListModel;
		
		/**
		 * Визуальный компонент списка
		 * @default null
		 */
		public var view:MovieList;
		
		//Контейнер в который добавляется визуальный компонент
		private var instance:DisplayObjectContainer;
		
		//Сервис предоставляющий список фильмов
		private var moviesListService:MovieLister;
		
		/**
		 * Конструктор, после вызова конструктора будет вызван метод <code>initilize</code>
		 * 
		 * @param	instance <code>DisplayObjectContainer</code> в который будет добавлен <code>view</code>
		 */
		public function MovieListController(instance:DisplayObjectContainer) 
		{
			this.instance = instance;
			initilize();
		}
		
		/**
		 * Иницилизация внутренних компонентов контроллера
		 */
		private function initilize():void 
		{
			moviesListService = new MovieLister();
			
			model = new MovieListModel();
			view = new MovieList(model);
		}
		
		/**
		 * После вызова этого метода <code>view</code> будет добавлен в дисплей лист
		 */
		public function showList():void
		{
			instance.addChild(view);
		}
		
		/**
		 * Устанавливает стандартный способ поиска фильмов в <code>movieListService</code>
		 */
		public function setStandartMovieLister():void
		{
			var finder:StandartMovieFinder = new StandartMovieFinder();
			moviesListService.injectMovieFinder(finder);
		}
		
		/**
		 * Устанавливает не стадартный <code>FakeMovieFinder</code> способ поиска фильмов в <code>movieListService</code>
		 */
		public function setFakeMovieLister():void
		{
			var finder:FakeMovieFinder = new FakeMovieFinder();
			moviesListService.injectMovieFinder(finder);
		}
		
		/**
		 * Задает в модель список фильмов который предоставляет <code>moviesListService</code>
		 * После чего этот список отображается в <code>view</code>
		 */
		public function fillMoviesList():void
		{
			var listOfMovies:Vector.<Movie>  = moviesListService.getMoviesList(model.filter);
			
			model.listOfMovies = listOfMovies;
		}
		
	}

}