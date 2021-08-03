<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::group(['prefix' => 'auth'], function ()
{
    Route::post('signin', 'App\Http\Controllers\ApiAuth\SignInController');
    Route::post('signout', 'App\Http\Controllers\ApiAuth\SignOutController');


    Route::get('me', 'App\Http\Controllers\ApiAuth\MeController');
});

Route::get('posts', 'App\Http\Controllers\PostController@index');
Route::get('location', 'App\Http\Controllers\PostController@searchLocation');
Route::post('searching', 'App\Http\Controllers\PostController@searching');
Route::get('post/{slug}', 'App\Http\Controllers\PostController@show');
Route::get('finder', 'App\Http\Controllers\PostController@finder');
Route::get('sponsoredbrowser/{slug}', 'App\Http\Controllers\PostController@sponsoredbrowser');
Route::get('browser/{slug}', 'App\Http\Controllers\PostController@browser');
Route::get('categories', 'App\Http\Controllers\PostController@categories');
Route::post('category', 'App\Http\Controllers\PostController@showCategory');
Route::post('sponsoredcategory', 'App\Http\Controllers\PostController@showSponsoredCategory');

Route::get('privacy', 'App\Http\Controllers\PostController@showPrivacy');
Route::get('term', 'App\Http\Controllers\PostController@showTerm');
