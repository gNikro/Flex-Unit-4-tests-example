package example.io 
{
	
	/**
	 * ...
	 * @author 
	 */
	public interface IPublisher 
	{
		
		/**
		 * Постит полученые данные куда то используя определенный сервис для этого
		 * @param	data
		 */
		function publish(data:String):void;
	}
	
}