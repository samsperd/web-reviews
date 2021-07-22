<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use BeyondCode\Comments\Traits\HasComments;

class Post extends Model
{
    use HasFactory;
    use HasComments;
    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }
    public function category()
    {
        return $this->belongsToMany(Category::class, 'post_category');
    }
    public function location()
    {
        return $this->belongsTo(Location::class)->where('status', 'publish');
    }
    public function tag()
    {
        return $this->belongsToMany(Tag::class);
    }
    public static function findBySlug($slug)
    {
        return static::where('slug', $slug)->first();
    }

    public function rating()
    {
        return $this->hasMany(Rating::class);
    }
}
