package mediator 
{
	import events.UserChangeEvent;
	import events.UserChangeStalringEvent;
	import model.UserModel;
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;
	import starling.events.Event;
	import views.UserStarlingView;

	
	/**
	 * ユーザー画面のメディエータクラス
	 * UserModelとUserStarlingViewの仲介を行う
	 * 「ユーザの名前が変更された」というきっかけで「ビューにその名前を反映する」タスクを実行するだけのクラス
	 * 
	 * @author ogino
	 */
	public class UserStarlingMediator extends StarlingMediator 
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		[Inject]
		/** ユーザ画面 */
		public var view:UserStarlingView;
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
		[Inject(name="modelName")]
		/** ユーザモデル */
		public var user:UserModel;
		
		//-----------------------------------------------------
		//オーバーライドしたメソッド
		//-----------------------------------------------------			
		
		/**
		 * @inheritDoc
		 */
		public override function initialize():void
		{
			// 名前が変更されたときに呼び出すメソッドをセット
			user.addEventListener(Event.CHANGE, changeView);
			view.addEventListener(UserChangeStalringEvent.USER_CHANGE, view_userChange);
		}
		
		/**
		 * @inheritDoc
		 */
		public override function destroy():void
		{
			// 登録したメソッドを削除
			user.removeEventListener(Event.CHANGE, changeView);
			view.removeEventListener(UserChangeStalringEvent.USER_CHANGE, view_userChange);
		}
		
		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 画面更新
		 * 
		 * @param e Event
		 */
		public function changeView(e:Event):void
		{
			view.nameChange(user.name);
		}
		
		/**
		 * 画面変更通知イベントハンドラー
		 * 
		 * @param	e
		 */
		private function view_userChange(e:UserChangeStalringEvent):void 
		{
			// コマンドを呼び出すイベントを作成
			var newEvent:UserChangeEvent = new UserChangeEvent(UserChangeEvent.USER_CHANGE);
			// フレームワークに通知　このイベントに紐付けられたCommandクラスが呼ばれる
			eventDispatcher.dispatchEvent(newEvent);
		}		
	}

}