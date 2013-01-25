package {
	import flash.display.*;
	import com.adobe.serialization.json.JSON;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.system.Security;
	import flash.utils.getDefinitionByName;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import com.greensock.TweenLite;
	import com.greensock.plugins.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.StageScaleMode;
	import flash.external.ExternalInterface;
	import flash.events.KeyboardEvent;
	
	public class newyear extends Sprite {
		
		/*
		 * 涉及到的变量：{"nextid":20,"username":["188","254","078","310","426","391","180","082","158","409"]}
		 * _nextId		=>	nextid,下一轮要抽的奖品id
		 * _userName	=>	username,php传过来的中奖号码，最多10个	
		 */	
		
		private var _nextId:int=20;				//下一轮的礼物id
		private var _number:int;				//中奖人数
		private var _oldnumber:int=10;				//上一次中奖人数
		private var _userName:Array;			//中奖号码对象
		private var _trigger:int=1;				//是否播放动画的开关
		private var _canDr:int=0;					//动画是否播完是否可以抽奖的开关
		private	var obj:Array = [];				//放置numbox的数组对象
		private var _i:int = 0;
		private var _runtime:int = 3;			//礼物动画播放的时间
		private var _cclick:int = 0;
		
		private var _initial:int = 1;
		
		private var _phpurl:String = "http://127.0.0.1/lottery/json.php";
		private var loader:URLLoader = new URLLoader();
		
		private var myTimer:Timer;

		public function newyear() {
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			
			var obj:Object = this.loaderInfo.parameters;
			_phpurl = obj.phpurl;
			_initial = obj.initial;
			
			TweenPlugin.activate([FramePlugin]);
			
			initSet();
			this["btn"].addEventListener(MouseEvent.CLICK, clickFun);
			this["btn"].buttonMode = true;
			//stage.addEventListener(MouseEvent.CLICK, fullscreen);
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,ballrect);
		}
		
		//初始化设置
		public function initSet() {
			this['giftbox'].visible = false;
			this['giftbox'].gotoAndStop(1);
		}
		
		//
		//public function fullscreen(e:MouseEvent){
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			//stage.scaleMode = StageScaleMode.SHOW_ALL;
		//}
		
		//
		public function ballrect(event:KeyboardEvent) {
			switch(event.keyCode) {
				case 66:
					if (_cclick == 0) {
						clickFun();
					}
					break;
					
				default:
					break;
				
			}
			
		}
		
		//按钮点击的函数
		public function clickFun(e:MouseEvent=null) {
			this["btn"].gotoAndStop(4);
			_cclick = 1;
			this["btn"].removeEventListener(MouseEvent.CLICK, clickFun);
			if(_canDr==0){
				var url:URLRequest = new URLRequest(_phpurl+"?="+Math.random());
				url.method = URLRequestMethod.POST;
				loader.addEventListener(Event.COMPLETE, loaded);			
				loader.load(url);
			}else {				
				doDraw();
			}
		}
		
		//获取返回数据
		public function loaded(e:Event) {			
			var _persons:Object = com.adobe.serialization.json.JSON.decode(URLLoader(e.target).data);			
			_nextId=_persons.nextid;	//下一轮的礼物id				
			_userName=_persons.username;//中奖号码对象
			_number = _userName.length;	//中奖人数
			if (_persons.resetprize == 0||_initial==0) {
				_trigger = 1;
				removeNumb();
				giftShow();
				_initial = 1;
			}else{
				_trigger = 0;
				removeNumb();
				numShow(_number);
			}
			_oldnumber = _number;
			myTimer = new Timer(5000, 1);
			myTimer.addEventListener(TimerEvent.TIMER,reDraw); 
			myTimer.start();
		}
		//
		public function godoDraw(evemt:TimerEvent) {
			doDraw();
		}
		//点击开始抽奖
		public function giftShow() {
			//初始值，第一次打开系统的时候，抽的是第20号的奖品
			this['giftbox'].visible = true;
			this['giftbox'].gotoAndStop(_nextId);
			TweenLite.to(this['giftbox']['gift'], _runtime, { frame: 70, onComplete:numShow, onCompleteParams:[_number] } );			
		}
		
		//点击抽取中奖号码
		public function doDraw() {
			for (_i = 0 ; _i < _number; _i++ ) {
				evalText(_i);
				TweenLite.to(obj["numb" + _i], 3 + _i, { frame: 25 } );				
			}
			_canDr = 0;
			myTimer = new Timer(5000, 1);
			myTimer.addEventListener(TimerEvent.TIMER,reDraw); 
			myTimer.start();
		}	
		
		//
		public function reDraw(e:TimerEvent) {
			
			this["btn"].gotoAndStop(1);
			_cclick = 0;
			this["btn"].addEventListener(MouseEvent.CLICK, clickFun);
		}
		
		//给text赋值
		public function evalText(_i) {
			var ntext:Array = [],
				nstr:String = '';
			nstr = _userName[_i];
			ntext = nstr.split('');
			//单独为每个数位赋值
			for (var x:int = 0; x < 3 ; x++) {
				obj["numb" + _i]['box']['n' + x]['tb']['text'].text = ntext[x];
			}		
		}		
		
		//隐藏numbox
		public function removeNumb() {
			for (_i = 0; _i < _oldnumber; _i++) {
				if (obj["numb" + _i]) {
					removeChild(obj["numb" + _i]);
				}else {
					trace('no numbox');
					return false;
				}			
			}
		}
		
		//显示numbox
		public function numShow(_number) {
			var	initx:int = 0,						//初始的x轴的位置				
				mod:int = 2,						//每一行的个数
				tempx:int = 0, tempy:int = 0,		//x轴和y轴的值
				addx:int = 0, addy:int = 0,			//累加的x轴和y轴的值
				numbW:int = 250, numbH:int = 52;	//numbox的宽和高
			
			//设置不同个数号码的numbox显示的位置和大小
			switch(_number) {
				case 10:
				case 9:{
					tempx = initx = 550; tempy = 150; addx = 320; addy = 90;
				};break;
				case 8:
				case 7:{
					tempx = initx = 550; tempy = 200; addx = 320; addy = 90;
				};break;
				case 6:
				case 5:{
					tempx = initx = 550; tempy = 240; addx = 320; addy = 90;
				};break;
				case 4: {
					tempx = initx = 550; tempy = 200; addx = 320; addy = 140;
				};break;
				case 3: {
					mod = 1; numbW = 350; numbH = 75; tempx = initx = 700; tempy = 180;	addx = 0; addy = 120;
				};break;
				case 2: {
					mod = 1; numbW = 390; numbH = 80; tempx = initx = 700; tempy = 160;	addx = 0; addy = 180;
				};break;
				case 1: {
					mod = 1; numbW = 440; numbH = 100; tempx = initx = 700; tempy = 180; addx = 0; addy = 220;
				};break;
				default: {
					trace('error');
				};break;
			}			
			//追加新的类，并显示出来
			for (var i:int = 0; i < _number; i++ ) {
				var myClass:Class = getDefinitionByName("numbox") as Class;
				var fm = new myClass();
				fm.names = String("numb"+i);
				addChild(fm);
				obj["numb" + i] = fm;
				obj["numb" + i].width = numbW;
				obj["numb" + i].height = numbH;
				if (i % mod == 0) {
					tempx = initx;
					tempy += addy;
				}else {
					tempx += addx;
				}
				obj["numb" + i].x += tempx;
				obj["numb" + i].y += tempy;	
			}
			//开关控制
			_canDr = 1;
			if(_trigger==0){
				myTimer = new Timer(2000, 1);
				myTimer.addEventListener(TimerEvent.TIMER, godoDraw); 
				myTimer.start();   
				//trace(1);
			}
		}	
		
	}
}