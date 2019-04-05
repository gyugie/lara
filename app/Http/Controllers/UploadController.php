<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gambar;
class UploadController extends Controller
{
    public function upload(){
        $gambar = Gambar::get();
        return view('upload',['gambar' => $gambar]);
    }

    public function proses_upload(Request $request){
   
        $this->validate($request, [
            'file'          => 'required',
            'keterangan'    => 'required'
        ]);


        

        // //nama file
        // echo 'File Name : '.$file->getClientOriginalName();
        // echo '<br>';

        // //real path
        // echo 'File Real Path :'.$file->getRealPath();
        // echo '<br>';

        // //ukuran file
        // echo 'File Size :'.$file->getSize();
        // echo '<br>';

        // //tipe mime
        // echo 'File Mime Type:'.$file->getMimeType();


        //menyimpan data file yang di upload ke variable $file 
        $file = $request->file('file');
     
        if($file > 0){
            foreach($file as $row):
                $nama_file = time()."_".$row->getClientOriginalName();

                //isi dengan nama folder tempat kemana file upload
                $tujuan_upload = 'data_file';
        
                //upload file
                $row->move($tujuan_upload,$nama_file);
        
                Gambar::create([
                    "file"      => $nama_file,
                    "keterangan"=> $request->keterangan
                ]);
            endforeach;
        }
       

        return redirect()->back();

    }
}
