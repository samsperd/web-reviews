<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Location extends Model implements Searchable
{
    public function getSearchResult(): SearchResult{
        $url = route('viewlocation', $this->slug);
            return new SearchResult(
                $this,
                $this->location,
                $url
            );
    }
    
    public static function findBySlug($slug)
    {
        return static::where('status', '=', 'publish')->where('slug', $slug)->first();
    }
    public function post()
    {
        return $this->hasMany(Post::class);
    }
    public function category()
    {
        return $this->belongsToMany(Category::class, 'category_location');
    }
    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id', 'id');
    }
    public function children()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    } 
    public function childrenRecursive()
    {
        return $this->children()->with('childrenRecursive');
    } 
    // public function childrenRecursive()
    // {
    //     return $this->childrenRecursive()->pluck('id');
    // }
}
