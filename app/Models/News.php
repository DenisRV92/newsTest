<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use HasFactory;

    public function cities()
    {
        return $this->belongsToMany(City::class, 'city_news', 'news_id', 'cities_id');
    }
}
