package help 
{
	import example.Button;
	import example.model.MovieListModel;
	import example.view.MovieList;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 
	 */
	public class MoviesModelsEditor extends Sprite 
	{
		private var model:MovieListModel;
		public var moviesList:MovieList;
		private var submit:Button;
		static private const PADDING:Number = 10;
		
		public function MoviesModelsEditor(model:MovieListModel ) 
		{
			super();
			this.model = model;
			
			initilize();
		}
		
		private function initilize():void 
		{
			moviesList = new MovieList(model);
			moviesList.editable = true;
			
			addChild(moviesList);
			
			submit = new Button('Submit');
			addChild(submit);
			
			submit.addEventListener(MouseEvent.CLICK, submitData);
			
			submit.y = moviesList.y + moviesList.height + PADDING;
		}
		
		private function submitData(e:MouseEvent):void 
		{
			for (var i:int = 0; i < moviesList.listElements.length; i++)
			{
				moviesList.listElements[i].submitDataToModel();
			}
		}
		
	}

}