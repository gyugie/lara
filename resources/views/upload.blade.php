<!DOCTYPE html>
<html>
<head>
	<title>Tutorial Laravel #30 : Membuat Upload File Dengan Laravel</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
</head>
<body>
	<div class="row">
		<div class="container">
			<h2 class="text-center my-5">Tutorial Laravel #30 : Membuat Upload File Dengan Laravel</h2>
			
            <div class="col-lg-8 mx-auto my-5">
                @if(count($errors) > 0)
                    <div class="alert alert-danger">
                        @foreach($errors->all() as $error)
                        {{  $error }} <br/>
                        @endforeach
                    </div>
                @endif

                <form action="/upload/proses" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_field()}} ">
                    <div class="form-group">
						<b>File Gambar</b><br/>
						<input type="file" name="file[]">
                        <input type="file" name="file[]">
					</div>
 
					<div class="form-group">
						<b>Keterangan</b>
						<textarea class="form-control" name="keterangan"></textarea>
					</div>
 
					<input type="submit" value="Upload" class="btn btn-primary">
                </form>

                <h4 class="my-5">Data</h4>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th width="1%"> File </th>
                                <th>Keterangan</th>
                                <th width="1%">OPSI</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($gambar as $row)
                                <tr>
                                    <td><img width="150px" src="{{url('/data_file/'.$row->file)}}"></td>
                                    <td>{{$row->keterangan}}</td>
                                    <td><a class="btn btn-danger" href="/upload/hapus/{{$row->id}}">Hapus</a></td>
                                </tr>
                            @endforeach
                        </body>
                    </table>


            </div>
		</div>
	</div>
</body>
</html>