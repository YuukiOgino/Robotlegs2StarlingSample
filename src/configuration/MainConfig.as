package configuration 
{
	import commands.UserCommand;
	import events.UserChangeEvent;
	import mediator.UserStarlingMediator;
	import model.UserModel;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	import views.UserStarlingView;
	
	/**
	 * メイン画面のコンフィギュレーションを行うクラス
	 * 
	 * このクラスで以下の設定を実行しています。
	 * 	・UserModel はシングルトンである
	 * 	UserStarlingView の対になるメディエータは UserStarlingMediator である
	 * 　・メディエーターでUserChangeEvent.USER_CHANGEが呼ばれた場合、UserCommondを実行する
	 * 
	 * @author ogino
	 */
	public class MainConfig implements IConfig 
	{
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
		[Inject]
		/** インジェクター */
		public var injector:IInjector;
		
		[Inject]
		/** メディエーターマップ */
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		/** イベントコマンドマップ */
		public var commandMap:IEventCommandMap;				
		
		[Inject]
		/** コンテキストビュー */
		public var contextView:ContextView;
		
		//-----------------------------------------------------
		//メソッド
		//-----------------------------------------------------			
		
		/**
		 * コンフィギュレーション実行
		 */
		public function configure():void 
		{
			// おまじない
			
			// UserModel はシングルトンである
			injector.map(UserModel, "modelName").asSingleton();
			injector.map(UserModel).asSingleton();
			
			// UserStarlingView の対になるメディエータは UserStarlingMediator である
			mediatorMap.map(UserStarlingView).toMediator(UserStarlingMediator);
			
			// メディエーターでUserChangeEvent.USER_CHANGEが呼ばれた場合、UserCommondを実行する
			commandMap.map(UserChangeEvent.USER_CHANGE).toCommand(UserCommand);
			
			// このような形で値を注入することも可能
			//var user:UserModel = new UserModel();
			//injector.map(UserModel, "modelName").toValue(user);			
		}
		
	}

}