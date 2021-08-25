<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\GeoContinent;
use App\Models\GeoCountry;
use App\Models\GeoCity;

class Place extends Model
{
    use HasFactory;
    public static function Continents()
    {
        return GeoContinent::all();
    }
    public static function Countries()
    {
        return GeoCountry::all();
    }
    public static function Cities()
    {
        return GeoCity::all();
    }
    // public static function Countries()
    // {
    //     return Geo_Countries::all();
    // }
    
    public static function findBySlug($slug)
    {
        return static::where('status', '=', 'publish')->where('slug', $slug)->first();
    }
}
