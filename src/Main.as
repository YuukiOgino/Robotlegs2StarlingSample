package 
{
	import configuration.MainConfig;
	import flash.display.Sprite;
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;
	import starling.core.Starling;
	import views.UserStarlingView;
	
	/**
	 * フレームワーク　Robotlegs2　サンプルプロジェクト
	 * as3であればGraphics,Stage3D、Flexで使用可能
	 * このプロジェクトはStage3D(Starling)で記載
	 * 
	 * @author ogino
	 */
	public class Main extends Sprite 
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		/** スターリング */
		private var starling:Starling;			
		
		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 */
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 初期化
		 * 
		 * @param	e Event
		 */
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			starling = new Starling(UserStarlingView, stage);
			
			if (starling.isStarted) 
				starling.stage.addChild(starling.root);// starlingが起動しているなら、stageにaddchildすればRobotlegsで感知できる
			else 
				starling.start(); // Starling起動			
			
			// Robotlegs2を起動するための設定
			// MVCSBundle,StarlingViewMapExtensionをセット
			// コンフィグクラス, Starlingをセット
			// 最後にコンテキストビューをセットし、初期化処理を実行
			
			var context:Context = new Context();
			// おまじない　StarlingViewMapExtensionも追加でインストールする
			context.install(MVCSBundle, StarlingViewMapExtension);
			// コンフィグクラスをセット この時、Starlingもセットする
			context.configure(MainConfig, starling);		
			// コンテキストビューとしてこの画面をセット
			context.configure(new ContextView(this));
			// Robotlegs2初期化
			context.initialize();
			
			addEventListener(Event.REMOVED_FROM_STAGE, removeEventHandler);
		}
		
		/**
		 * ステージから削除された場合のイベントハンドラー
		 * @param	e
		 */
		private function removeEventHandler(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removeEventHandler);
			
			// このどちらかでMediatorのdestroyが呼ばれる
			starling.root.removeFromParent();
			starling.root.dispose();
		}			
		
	}
	
}