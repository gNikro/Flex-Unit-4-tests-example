package example.view 
{
	import example.model.MovieListModel;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class MovieList extends Sprite 
	{
		private var _editable:Boolean = false;
		
		private var model:MovieListModel;
		
		private var _listElements:Vector.<MovieListElement>
		
		public function MovieList(model:MovieListModel) 
		{
			super();
			this.model = model;
			
			initilize();
		}
		
		public function set editable(value:Boolean):void
		{
			_editable = value;
			
			for (var i:int = 0; i < _listElements.length; i++)
			{
				_listElements[i].editable = _editable;
			}
		}
		
		public function get listElements():Vector.<MovieListElement> 
		{
			return _listElements;
		}
		
		private function initilize():void 
		{
			createViewComponents();
			manageEvents();
			
			rebuildMoviesList();
		}
		
		private function createViewComponents():void 
		{
			_listElements = new Vector.<MovieListElement>;
			
			var listElement:MovieListElement;
			var yAnchorn:Number = 0;
			
			for (var i:int = 0; i < 10; i++)
			{
				listElement = new MovieListElement();
				_listElements.push(listElement);
				
				listElement.y = yAnchorn;
				
				addChild(listElement)
				
				yAnchorn += listElement.height;
			}
		}
		
		private function manageEvents():void 
		{
			model.addEventListener(Event.CHANGE, rebuildMoviesList);
		}
		
		private function rebuildMoviesList(e:Event = null):void 
		{
			for (var i:int = 0; i < listElements.length; i++)
			{
				listElements[i].clear();
				
				if (model.listOfMovies.length > i)
				{
					if(model.listOfMovies[i])
						listElements[i].setMovie(model.listOfMovies[i]);
				}
			}
		}
		
	}

}