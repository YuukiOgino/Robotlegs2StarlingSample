package events 
{
	import starling.events.Event;
	
	/**
	 * ユーザーがデーターを変更した時のイベント
	 * Staling用
	 * 
	 * @author ogino
	 */
	public class UserChangeStalringEvent extends Event 
	{
		
		//-----------------------------------------------------
		//イベント定数
		//-----------------------------------------------------			
		
		/** ユーザー変更 */
		public static const USER_CHANGE:String = "userChange";
		
		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 * 
		 * @param	type
		 * @param	bubbles
		 * @param	data
		 */
		public function UserChangeStalringEvent(type:String, bubbles:Boolean=false,  data:Object=null) 
		{ 
			super(type, bubbles, data);
		} 
		
		//-----------------------------------------------------
		//メソッド
		//-----------------------------------------------------			
		
		/**
		 * クローン処理
		 */
		public function clone():Event 
		{
			var e:UserChangeStalringEvent = new UserChangeStalringEvent(type, bubbles, data);
			return e;
		}
		
	}

}