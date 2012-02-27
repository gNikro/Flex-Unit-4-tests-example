package example.io 
{
	/**
	 * Сервис для паблиша информации куда-то
	 * @author 
	 */
	public class ResultPublisher 
	{
		
		private var publishDriver:IPublisher
		
		public function ResultPublisher(publisher:IPublisher) 
		{
			publishDriver = publisher;
		}
		
		public function publishData(data:String):void
		{
			publishDriver.publish(data);
		}
		
	}

}