package example.model 
{
	

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * Ивент об изменении данных модели
	 * @eventType	flash.events.Event.CHANGE
	 */
	[Event(name="change", type="flash.events.Event")] 
	
	
	/**
	 * Модель списка фильмов - объект содержаший в себе данные нужные для работы списка фильмов
	 * @author 
	 */
	public class MovieListModel extends EventDispatcher 
	{
		private var _listOfMovies:Vector.<Movie>
		private var _filter:Function;
		
		/**
		 * 
		 * @param	target <code>IEventDispatcher</code> вышестоящий в EventFlow цепи объект который будет поулчать всплывающие ивенты
		 */
		public function MovieListModel(target:IEventDispatcher=null) 
		{
			super(target);
			
			initilize();
		}
		
		private function initilize():void 
		{
			_listOfMovies = new Vector.<Movie>;
		}
		
		/**
		 * Список фильмов
		 */
		public function get listOfMovies():Vector.<Movie> 
		{
			return _listOfMovies;
		}
		
		public function set listOfMovies(value:Vector.<Movie>):void 
		{
			_listOfMovies = value;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		/**
		 * Фильтр для поиска фильмов
		 * функция стандартного для <code>Array.filter</code> формата
		 */
		public function get filter():Function 
		{
			return _filter;
		}
		
		public function set filter(value:Function):void 
		{
			_filter = value;
		}
		
	}

}