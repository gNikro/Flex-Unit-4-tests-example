package example 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * Простая кнопка
	 * @author 
	 */
	public class Button extends Sprite 
	{
		public var lable:String;
		
		public function Button(lable:String) 
		{
			super();
			this.lable = lable;
			var tf:TextField = new TextField();
			tf.border = true;
			tf.text = lable;
			tf.autoSize = TextFieldAutoSize.LEFT;
			addChild(tf);
			tf.selectable = false;
		}
		
	}

}