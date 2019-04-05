<?php
echo 'HELLO WORLD!<br>';
foreach($employee as $row){
    echo '<pre>';
    echo $row->name;
    echo ':';
    echo $row->position;

    
}
?>