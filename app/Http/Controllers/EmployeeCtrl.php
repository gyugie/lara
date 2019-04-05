<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmployeeCtrl extends Controller
{
    public function index(){
        $employee   = \App\Employee::all();

        return view('employee_view_data',['emp'=> $employee]);
    }

    public function temp(){
        $employee   = \App\Employee::all();
        return view('employees',['emp'=> $employee]);
    }
}
