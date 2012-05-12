<?


/**
 * ����� ������� ���������� ������������
 *
 * @author akalend
 * @package quickly
 */

/**
 *  ����� ������� ���������� ������������
 *
 */
class Config {
		
	private $db;
	private $mc;
	private $mongo;
	private $name = null;
	private $data = null;
	//private $ngx = null;
	/**
	 * ����������� ������ 
	 * �� ��������� ������ ��������� �������
	 *
	 */
	function __construct( $name = null, $section = null ){
		
	    /* fix for external app.conf */
	    if (file_exists('app.conf.php')) {
    	    require( 'app.conf.php' );
    	    //ƒecho "construct name=$name\n";
    		if ( is_null( $section ) ) {
    			$this->db=$db_conf;
    			return $this;
    		} 
	    } else 
	       echo "file app.conf not exist\n";

		require("$name.conf.php"  );
		$this->name = $name;
		$section_name = $name.'_'.$section;
		$this->data = $$section_name;		
		return $this;
	}

	/**
	 * �������� �������� ����������
	 *
	 * @param  string $name - ��� ���������� ���������� 
	 * @return mixed - ���������� ������ ������ ���� �� ���������� 
	 */
	public function get( $name ) {	    
		if ( !is_null( $this->name )  &&  !is_null( $this->data)) {
		   // echo '----------';
			if ( isset( $this->data['name'] ))
				return $this->data['name'];
		}

		if (!isset($this->{$name}) )
			throw new Exception('unknow section in config file'); 
		return $this->{$name};
	}
	/**
	 * �������� �� ������� ������ ���������� 
	 *
	 * @param string $name ��� ������
	 * @return array - ������ ����������
	 */
	public function getSection($name=NULL) {
		if ( $name) {
			$section_name = $this->name.'_'.$name;
			$this->data = $$section_name;			
		}
		return $this->data;
	}
	
	
}
