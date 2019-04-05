<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestCtrl extends Controller
{
    public function test(){
        // return 'Gyugie Learning Laravel';
        return view('test_view');
    }
}
