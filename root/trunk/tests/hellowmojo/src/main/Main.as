package 
{
	import example.Button;
	import example.controller.MovieListController;
	import example.io.PublishToFile;
	import example.io.ResultPublisher;
	import fl.controls.ComboBox;
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import help.MoviesModelsEditor;
	import services.AlertService;

	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var movieList:MovieListController;
		private var actionsMap:Object;
		private var publishChoiser:ComboBox;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			/*var tf:TextField = new TextField();
			tf.text = 'Hello mojo!';
			
			addChild(tf);
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.x = (stage.stageWidth - tf.width) / 2;
			tf.y = (stage.stageHeight - tf.height) / 2;*/
		
			//var publisher:ResultPublisher = new ResultPublisher(new PublishToFile());
			
			
			//return;
			
			var alertService:AlertService = new AlertService(this);
			
			movieList = new MovieListController(this);
			
			actionsMap = { };
			actionsMap['Fakes Movies'] = movieList.setFakeMovieLister;
			actionsMap['Lib Movies'] = movieList.setStandartMovieLister;
			
			movieList.showList();
			movieList.setFakeMovieLister();
			movieList.fillMoviesList();
			
			var editor:MoviesModelsEditor = new MoviesModelsEditor(movieList.model)
			
			var buttonSetFakeMovies:Button = new Button("Set movies finder");
			publishChoiser = new ComboBox();
			
			publishChoiser.dataProvider = new DataProvider([ { label:'Fakes Movies'}, { label:'Lib Movies'}, {label:'for error throw'} ]);
			
			buttonSetFakeMovies.addEventListener(MouseEvent.CLICK, setMoviesFinder);
			
			addChild(editor);
			addChild(buttonSetFakeMovies);
			addChild(publishChoiser);
			
			editor.x = 500;
			buttonSetFakeMovies.y = 500;
			publishChoiser.y = 500;
			buttonSetFakeMovies.x = publishChoiser.x + publishChoiser.width + 10;
		}

		/**
		 * Устанавливает метод поиска фильмов из предаставленного списка
		 * @param	e
		 * 
		 * @throws Error - пуляет ошибку если выбран не существующий метод поиска фильмов
		 */
		private function setMoviesFinder(e:MouseEvent = null):void 
		{
			if(actionsMap.hasOwnProperty(publishChoiser.selectedLabel))
				actionsMap[publishChoiser.selectedLabel]();
			else
			{
				throw new Error("Не существует данного метода поиска фильмов: " + publishChoiser.selectedLabel);
			}
			
			movieList.fillMoviesList();
			
			AlertService.instance.showCommonAlert('Сервис поиска фильмов изменен на:\n\n' + publishChoiser.selectedLabel);
		}
		
	}
	
}