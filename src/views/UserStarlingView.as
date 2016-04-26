package views 
{
	import events.UserChangeEvent;
	import events.UserChangeStalringEvent;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	
	/**
	 * ユーザー情報表示画面
	 * 
	 * @author ogino
	 */
	public class UserStarlingView extends Sprite 
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		/** ユーザー名表示領域 */
		private var nameTextField:TextField;		
		
		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 */
		public function UserStarlingView() 
		{
			super();
			init();
		}
		
		//-----------------------------------------------------
		//メソッド
		//-----------------------------------------------------			
		
		/**
		 * 初期化
		 */
		private function init():void 
		{
			nameTextField= new TextField(100, 100, "初期化");
			nameTextField.addEventListener(TouchEvent.TOUCH, nameTextFieldClickHandler);
			addChild(nameTextField);
		}
		
		/**
		 * 名前変更
		 * 
		 * @param	name
		 */
		public function nameChange(name:String):void 
		{
			nameTextField.text = name;
		}
		
		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 名前テキストをクリックしたときのイベントハンドラー
		 * 
		 * @param	e
		 */
		private function nameTextFieldClickHandler(e:TouchEvent):void 
		{	
			// メディエーターに更新イベントを通知
			dispatchEvent(new UserChangeStalringEvent(UserChangeStalringEvent.USER_CHANGE));
		}		
		
	}

}