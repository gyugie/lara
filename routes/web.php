<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/gyugie', function(){
    return "HEllO GYUGIE";
});

Route::get('/hello/{name}/{id}', function($name, $id){
    return 'Hello'. $name . 'youre id='. $id;
});

Route::get('/employees', function(){
    $employee   = App\Employee::all();
    // return $employee;
    foreach($employee as $row){
        echo '<pre>';
        echo $row->name;
    }
});

Route::get('/', function(){
    $employee   = App\Employee::all();
    return view('employee_view')->with(['employee' => $employee]);
});


Route::get('test','TestCtrl@test');
Route::get('employee','EmployeeCtrl@index');
Route::get('empl','EmployeeCtrl@temp');


Route::get('/upload','UploadController@upload');
Route::post('/upload/proses','UploadController@proses_upload');