<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Favorites extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $fillable = [
        'news_id',
    ];

    public function newsFavorites()
    {
        return $this->hasOne(News::class, 'id', 'news_id');
    }

}
