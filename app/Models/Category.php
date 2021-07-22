<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Category extends Model implements Searchable
{
    public function getSearchResult(): SearchResult{
        $url = route('viewcategory', $this->slug);
            return new SearchResult(
                $this,
                $this->name,
                $url
            );
    }
    public static function findBySlug($slug)
    {
        return static::where('slug', $slug)->first();
    }
    public function post()
    {
        return $this->belongsToMany(Post::class, 'post_category');
    }
    public function location()
    {
        return $this->belongsToMany(Post::class, 'category_location');
    }
}
