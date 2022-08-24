<?php

namespace App\Services;

interface Service
{

    public function similarText($new, $news);

    public function filter($news, $city);

    public function add($request);

    public function search($request);
}
