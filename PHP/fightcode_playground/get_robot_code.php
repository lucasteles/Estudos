<?php

header('Content-Type: text/html');

if (preg_match('/^\w+\.js$/', $_GET['file']))
    echo(file_get_contents('robots/' . $_GET['file']));