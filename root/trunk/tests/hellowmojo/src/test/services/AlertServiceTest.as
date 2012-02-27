package services 
{
	import flash.display.Sprite;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import ui.Alert;
	/**
	 * ...
	 * @author 
	 */
	public class AlertServiceTest 
	{
		private var service:AlertService;
		private var uiCompensator:Sprite = new Sprite();
		
		[Before]
		[Test]
		public function setupServiceTest():void
		{
			service = new AlertService(uiCompensator);
			assertThat(AlertService.instance, not(equalTo(null)));
		}
		
		[Test(ui)]
		public function addAlertTest():void
		{
			
			var alert:Alert =  service.showCommonAlert('Assert that') as Alert;
			
			assertThat(alert, not(equalTo(null)));
		}
		
	}

}