<?php defined('BASEPATH') OR exit('No direct script access allowed');


// require_once APPPATH . "/third_party/phpqrcode/qrlib.php";
include(APPPATH . "/third_party/phpqrcode/qrlib.php");

class Phpqrcode
{

    public function generate($params = array())
    {
        $params['data'] = (isset($params['data'])) ? $params['data'] : 'http://tecdiary.com';
        if (isset($params['svg']) && !empty($params['svg'])) {

            QRcode::svg($params['data'], $params['savename'], 'H', 2, 0); 
            // $svgCode = QRcode::svg($params['data']); 
            return $params['savename'];

        } else {

            QRcode::png($params['data'], $params['savename'], 'H', 2, 0);
            return $params['savename'];

        }
    }

}
