package commands 
{
	import events.UserChangeEvent;
	import model.UserModel;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	/**
	 * ユーザーに関するコマンド実行
	 * このクラスはコンフィグで設定したイベントがメディエーターで呼ばれた場合、executeメソッドがフレームワーク側から実行される
	 * 他のクラスから、コマンドを直接実行させるのは控えること
	 * 
	 * @author ogino
	 */
	public class UserCommand extends Command
	{
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
		[Inject]
		/** イベント　コマンドを実行したいイベントクラスをpublicで必ず記載すること */
		public var event:UserChangeEvent;		
		
		[Inject(name="modelName")]
		/** ユーザモデル */
		public var user:UserModel;		
		
		[Inject]
		/** コンテキストビュー */
		public var contextView:ContextView;		
		
		//-----------------------------------------------------
		//オーバーライドしたメソッド
		//-----------------------------------------------------			
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void 
		{
			user.name = "変更しました";
		}
		
	}

}