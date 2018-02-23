<?php

//php
phpinfo();

//postgres
$dbUser = getenv('DB_USER');
$dbPassword = getenv('DB_PASSWORD');
new PDO("pgsql:host=postgres user=$dbUser dbname=$dbUser password=$dbPassword");

