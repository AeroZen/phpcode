<?php
/**
 * RTX机器人
 */
class RTX {
	static private $secrtKey = 's3wJPEfwR18YXnL1OkRZLjAMVVxWP8S3e5mq';

	/**
	 * 
	 * @param  [type] $recevier 多个人用;分割
	 * @param  [type] $msg      内容
	 * @param  [type] $sendType 通知：sendNotify, 机器人：sendIM
	 */
	public static function send ($recevier, $msg, $sendType) {
		set_time_limit(0);

		$dateH = date('H');
		if( $dateH < 9 || $dateH > 19 ){
			die();
		}

		$secrtKey = self::$secrtKey;
		$url = 'http://192.168.100.50:8012/im-api.php?';

		$recevier = $recevier;
		$msg = $msg;
		$raw = strtoupper(md5($recevier));
		$guid = substr($raw,0,8).'-'.substr($raw,8,4).'-'.substr($raw,12,4).'-'.substr($raw,16,4).'-'.substr($raw,20);
		$msg = mb_convert_encoding( $msg, 'gb2312', 'utf-8'); //转成gb2312

		$param = array();
		$param['by_action'] = $sendType;//sendNotify, sendIM
		$param['by_time'] = time();
		$param['by_data'] = urlencode(serialize( array( 'touser' => $recevier, 'msg' => $msg, 'guid' => $guid)));
		$param['by_sig'] = self::build_sign( $param );
		$data = file_get_contents( $url . http_build_query( $param));

		$result = json_decode($data, true);

		return $result;
	}

	public static function build_sign( $param ){
		if( empty( $param ) || !is_array( $param ) ){
			return '';
		}

		$aMustSig = array();
		foreach( $param as $pk => $pv ){
			if( substr( $pk, 0, 3 ) == 'by_' ){
				$aMustSig[substr( $pk, 3 )] = $pv;
			}
		}
		ksort( $aMustSig );
		$qString = http_build_query( $aMustSig ) . self::$secrtKey;
		return md5( $qString );
	}
}

