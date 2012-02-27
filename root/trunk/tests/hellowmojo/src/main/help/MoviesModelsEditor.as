package help 
{
	import example.Button;
	import example.io.ExternalPublisher;
	import example.io.IPublisher;
	import example.io.PublishToClipboard;
	import example.io.PublishToFile;
	import example.model.MovieListModel;
	import example.view.MovieList;
	import fl.controls.ComboBox;
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import services.AlertService;
	
	
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
		private var publisherMap:PublisherMap;
		private var publishChoiser:ComboBox;
		
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
			
			createPublishSection();
		}
		
		private function createPublishSection():void
		{
			publishChoiser = new ComboBox();
			addChild(publishChoiser);
			
			
		
			publisherMap = new PublisherMap();
			publisherMap.addPublisher(new PublishToFile(), 'PublishToFile');
			publisherMap.addPublisher(new PublishToClipboard(), 'PublishToClipboard');
			publisherMap.addPublisher(new ExternalPublisher(), 'ExternalPublisher');
			
			publishChoiser.dataProvider = new DataProvider(publisherMap.getPublishersList());
			
			publishChoiser.setSize(200, publishChoiser.height);
			
			publishChoiser.y = submit.y + submit.height + PADDING;
			
			var publishButton:Button = new Button('Publish films list');
			
			publishButton.addEventListener(MouseEvent.CLICK, publish);
			
			addChild(publishButton);
			
			publishButton.x = publishChoiser.x + publishChoiser.width + PADDING;
			publishButton.y = publishChoiser.y;
		}
		
		private function publish(e:MouseEvent):void
		{
			var publisher:IPublisher = publisherMap.getPublisher(publishChoiser.selectedLabel);
			publisher.publish(model.getRawData());
			
			AlertService.instance.showCommonAlert('Publish films list by:\n\n' + publishChoiser.selectedLabel);
		}
		
		private function submitData(e:MouseEvent):void 
		{
			for (var i:int = 0; i < moviesList.listElements.length; i++)
			{
				moviesList.listElements[i].submitDataToModel();
			}
			
			AlertService.instance.showCommonAlert('Submit films data from editor\n\nto model and etalon view');
		}
		
	}

}