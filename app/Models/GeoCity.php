<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeoCity extends Model
{
    use HasFactory;
    protected $table = 'geo_cities';

    public $primaryKey = 'id';

    public $timestamps = true;
}
