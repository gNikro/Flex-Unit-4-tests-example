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
	 * Модель фильма содержашая данные о нем и способная диспатчить события изменения
	 * @author 
	 */
	public class Movie extends EventDispatcher 
	{
		
		private var _movieName:String;
		private var _movieDescription:String;
		
		/**
		 * 
		 * @param	target <code>IEventDispatcher</code> вышестоящий в EventFlow цепи объект который будет поулчать всплывающие ивенты
		 */
		public function Movie(target:IEventDispatcher=null) 
		{
			super(target);
		}
		
		/**
		 * Вызов этого метода сообщяет слушателям объекта что модель была изменена
		 */
		public function change():void
		{
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		/**
		 * Описание фильма
		 */
		public function get movieDescription():String 
		{
			return _movieDescription;
		}
		
		public function set movieDescription(value:String):void 
		{
			_movieDescription = value;
		}
		
		/**
		 * Название фильма
		 */
		public function get movieName():String 
		{
			return _movieName;
		}
		
		public function set movieName(value:String):void 
		{
			_movieName = value;
			
		}
		
		override public function toString():String 
		{
			return "[Movie movieDescription=" + movieDescription + " movieName=" + movieName + "]";
		}
	}

}