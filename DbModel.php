<?
/**
 * 
 * base class DbModel
 *
 * @author akalend
 * @package quickly
 */

/**
 * extended class from template engine (blitz)
 * for DB helpers
 *
 */        
class blitzDb extends blitz {
	private $db=null;
	
	public function __construct( $db ) {
		parent::__construct();
		$this->db = $db;
}
	
	public function s($str) {
		return $this->db->real_escape_string($str); 
	}

	public function i($str) {
		return (int)$str;
	}
}

class DbModel {
		
	protected $db = null;
	private $isntCall = true;
	private $conf = null;
	private $sqlCache = array();
	private $tpl = null;
	private $rows =0;
	private $res;
	private $encoding = false;
	
	/**
	 * ����������� ������
	 */
	public function __construct() {
		$conf = new Config('app');
		$this->conf = $conf->get('db');
	}
		
	public function setEncoding($encoding) {
		$this->encoding = $encoding;
	}
	
	protected  function check($arg){
		if (is_null($arg))
			return false;
		if (is_string($arg) && trim($arg) == '')
			return false;
			
		if (!$arg)
			return false;
			
		return true;		
	}
	
	public function initialize(){
		
	}
	
	public function finalize () {
		if ( count($this->sqlCache) ) {
			return $this->getStat();
		}
		
	}

	public function getStat() {
		return $this->sqlCache;
	}

	public function getUtf8() {
		$this->db->query("SET NAMES 'UTF8'");
	}
				
	protected function init () {
		if ( $this->isntCall ) {
			$this->isntCall=false;
			$this->db = new mysqli( $this->conf['host'], $this->conf['user'],$this->conf['password'], $this->conf['dbname']);
			if (mysqli_connect_error() ){
				throw new Exception('Conection error '.mysqli_connect_error());
			}
			$this->db->query("SET NAMES 'utf8'");
			
			//$this->encoding = 'UTF-8';
			

		}
	
	}
	
	public function exec ( $sql , array $data =array() ) {
			$this->init();
			
			$this->tpl = new blitzDb( $this->db );
			$this->tpl->load( $sql );
			
			$sql = $this->tpl->parse($data);
			unset($this->tpl);
//			var_dump($data);
//			echo "<font color=blue>$sql</font><br>";

			$time_start = microtime();
			$res = $this->db->query( $sql );
			
			if (!$res) {
				//echo $this->db->
				echo "<font color=blue>$sql</font><br>";
				echo 'mysql error: '.$this->db->error;
				$result = false;				
				return false;
			} 
	//			var_dump( $this->db,$res );
				$time = microtime()-$time_start;
			
//			var_dump( $sql, $res );
			$this->sqlCache[] = $toSave = array( 'sql' =>$sql , 'time'=>$time );
			
			//var_dump($toSave);
			$log = Log::getInstance();
			$log->toLog($toSave, log::DEBUG);
			
			//$this->rows = $this->db->affected_rows();
			if (!is_object($res)) return true;

			$result = array();
			while ($row = $res->fetch_assoc()) {
//			    var_dump($row);
     		    if ($this->encoding) {
                    die('encoding');
     		        foreach ( $row as $key => $value) {     		             
     		             if($value)
     		                $row[$key] = iconv('CP1251',$this->encoding,$value);
     		         }       
			    }  
			    $result[]=$row;     		  
			}
    		
    		return $result;
	}

	
	public function query( $sql , array $data =array() ) {
			
            $this->init();			
            $this->tpl = new blitzDb($this->db);  
            $this->tpl->load($sql);	   	
            $sql = $this->tpl->parse($data);
            
            unset($this->tpl);
                            
            $time_start = microtime();
            $this->res = $this->db->query( $sql );
			
            if (!$this->res) {
                echo 'mysql error: '.$this->db->error;
		$result = false;				
            } 
//				var_dump( $this->db,$res );
			$time = microtime()-$time_start;
			
//			var_dump( $sql, $res );
            $toSave = array( 'sql' =>$sql , 'time'=>$time );
			
            $this->sqlCache[] = $toSave;
			//$this->rows = $this->db->affected_rows();
            if (!is_object($this->res)) return true;			
	}
	
	/**
	 * return one row as assoc array
	 *
	 * @return array result of one row
	 */
	public function iterate() {
		if (!$this->res) throw new Exception('the mysql result is null');
		return $this->res->fetch_array(MYSQLI_ASSOC);
	}
	
	
	public function getRowCount() {
		return $this->db->affected_rows;
	}
	
	public function getId() {
		return $this->db->insert_id;
	}
	
}
