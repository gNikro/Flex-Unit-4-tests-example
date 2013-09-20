package services 
{
	import flash.display.DisplayObjectContainer;
	import flash.utils.Dictionary;
	import ui.Alert;
	/**
	 * ...
	 * @author 
	 */
	public class AlertService 
	{
		private static var _instance:AlertService;
		private var viewInstance:DisplayObjectContainer;
		
		private var lastAlert:Alert
		private var alerts:Dictionary;
		
		public function AlertService(viewInstance:DisplayObjectContainer) 
		{
			this.viewInstance = viewInstance;
			_instance = this;
			
			alerts = new Dictionary();
		}
		
		public static function get instance():AlertService 
		{
			
				
			return _instance;
		}
		
		public function showCommonAlert(message:String):Alert
		{
			var alert:Alert = new Alert(message);
			
			viewInstance.addChild(alert);
			alert.alpha = 50;
			//TweenLite.to(alert, 5, { alpha:1, onComplete:Delegate.create(removeAlert, alert) } );
			
			alert.x = (viewInstance.width - alert.width) / 2;
			
			
				//alert.y = lastAlert.y + lastAlert.height;
			
				alert.y = (viewInstance.height - alert.height) / 2 - alert.height;
				
			/*var etalonY:Number = alert.y;
			
			var a:Number = 1;
			for each(var zAlert:Alert in alerts)
			{
				etalonY += alert.height;
				TweenLite.to(zAlert, 1, { y:etalonY } );
				a -= 0.1;
				zAlert.alpha = a;
				if (a <= 0)
				{
					TweenLite.killTweensOf(zAlert);
					removeAlert(zAlert);
				}
			}*/
			
			alerts[alert] = alert;
			
			return alert;
		}
		
		private function removeAlert(alert:Alert):void 
		{
			viewInstance.removeChild(alert);
			delete alerts[alert];
				
			alert = null;
		}
		
	}

}