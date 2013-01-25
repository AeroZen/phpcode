<?php
class BYAdmin {
	const  TOKEN = '5274a45b4d84d8e5055c5ad1159467ed';
	const  URL = 'http://192.168.100.248:8871/api';// 内网URL值用这个http://192.168.100.248:8871/api
    public static $rev = 2911;
	public static $appid = 185;
	public static $privs = array();
	
	/**
	 * 设置APPID     	
	 */
	public static function setAppid ($appid){
		self::$appid = $appid;
	}
	/**
	 * 检查权限,有权限则返回 true
	 */
	public static function checkPriv($key){
		if (empty(self::$privs)) {
			self::$privs = self::getPriv();
		}
		$key = strtolower($key);
		return isset(self::$privs[$key]) ? (self::$privs[$key] != 0) : true;
	}
	/**
	 * 检查cookie
	 */
	public static function checkCookie(){
		if(!isset($_COOKIE['admin_uid'])||!isset($_COOKIE['admin_key'])){
			if(isset($_REQUEST['admin_uid']) && isset($_REQUEST['admin_key'])){
				setcookie('admin_uid',$_REQUEST['admin_uid'],time()+24*3600,'/');
				setcookie('admin_key',$_REQUEST['admin_key'],time()+24*3600,'/');
				self::redirect();
				return false;
			}
			return true;	
		}else{
			self::redirect();
			return false;
		}
	}
	/*
	*获取用户信息
	*/
	public static function getInfo(){
		if(self::checkCookie()){
			return array('ret'=>0,'error'=>'no_cookie,please login again');	
		}
		$params = array('do'=>'getInfo','uid' => $_COOKIE['admin_uid'],'key' => $_COOKIE['admin_key'],'appid' => self::$appid);
		$url = self::URL.'?'.http_build_query($params);	
		$data = self::url_get($url);
		return  json_decode($data,true);
	}
	/*
	*获取用户权限信息
	*/
	public static function getPriv(){
		if(self::checkCookie()){
			return array('ret'=>0,'error'=>'no_cookie,please login again');	
		}
		$params = array('do'=>'getPriv','uid' => $_COOKIE['admin_uid'],'key' => $_COOKIE['admin_key'],'appid' => self::$appid);
		$url = self::URL.'?'.http_build_query($params);	
		$data = self::url_get($url);
		return json_decode($data,true);
	}
	/*
	*发送报警邮件
	*/
	public static function sendMail($gk,$title,$body){
		if(self::checkCookie()){
			return array('ret'=>0,'error'=>'no_cookie,please login again');	
		}
		$t = time();
		$sig = sha1($gk.$t.self::TOKEN);
		$params = array(
			'do' => 'sendMail',
			'appid' => self::$appid,
			'gk' => $gk,
			'title' => $title,
			'body' => $body,
			't' => $t,
			'sig' => $sig,
		);
		$url = self::URL.'?'.http_build_query($params);	
		$data = self::url_get($url);
		return json_decode($data,true);
	}
	/*
	*向sso发送http get请求
	*/
	private static function url_get($url){
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		$str = curl_exec ( $ch );
		curl_close($ch);
		return $str;
	}
	/*
	*返回登陆首页
	*/
	public static function getLoginUrl(){
		return "http://sso.oa.com/Index/login/appid/".self::$appid;
	}
	/*
	*注销
	*/
	public static function Logout(){
		//setcookie("admin_uid", "", time() - 1,"/",".oa.com");
		//setcookie("admin_key", "", time() - 1,"/",".oa.com");
                /*
		 * 跨域注销
		 */
		setcookie('admin_uid','',time()-1,'/');
		setcookie('admin_key','',time()-1,'/');

		header('Location:http://sso.oa.com/Index/logout/appid/'.self::$appid);

	}
	/*
	 * url跳转
	 */
	public static function redirect(){
		$url = $_SERVER['HTTP_HOST'];
		$params = $_SERVER['REQUEST_URI'];
		$num = strpos($params,'admin_uid');
		if($num!==false){
			$params = substr($params,0,$num-1);
			$url =  'http://'.$url.$params;
			header('Location:'.$url);
		}
	}
	
	
}