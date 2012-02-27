package example.io 
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	/**
	 * ...
	 * @author 
	 */
	public class ExternalPublisher implements IPublisher 
	{
		
		public function ExternalPublisher() 
		{
			
		}
		
		/**
		 * @inheritDoc
		*/
		public function publish(data:String):void 
		{
			
			/**
			 * NOTE:
			 * На самом деле пост даты конечно стоило бы делать не тут а написать сервис который этим бы занимался
			 * чтобы он мог обработать ошибки или полученые данные и произвести нужную реакцию
			 */
			
			var request:URLRequest = new URLRequest('http://blah.com');
			request.data = new URLVariables();
			request.data.data = data;
			var urlLoader:URLLoader = new URLLoader(request);
			
			urlLoader.load(request);
		}
		
	}

}