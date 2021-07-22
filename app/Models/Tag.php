<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    public static function findBySlug($slug)
    {
        return static::where('slug', $slug)->first();
    }
    public function post()
    {
        return $this->belongsToMany(Post::class);
    }
}
