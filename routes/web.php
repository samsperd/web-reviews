<?php

use Illuminate\Support\Facades\Route;
use Spatie\Sitemap\SitemapGenerator;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('generate-sitemap', [App\Http\Controllers\SitemapController::class, 'sitemap']);

Route::get('/', [App\Http\Controllers\RouteController::class, 'index'])->name('welcome');
Route::get('/terms', [App\Http\Controllers\RouteController::class, 'terms'])->name('terms');
Route::get('/privacy', [App\Http\Controllers\RouteController::class, 'privacy'])->name('privacy');
Route::get('/donate', [App\Http\Controllers\RouteController::class, 'donate'])->name('donate');
Route::get('/contact-us', [App\Http\Controllers\RouteController::class, 'contact'])->name('contact');
Route::get('/categories', [App\Http\Controllers\RouteController::class, 'categories'])->name('categories');
Route::get('/location/{slug}/category/{cate}', [App\Http\Controllers\RouteController::class, 'category'])->name('category');
Route::get('/browse-location/{slug}', [App\Http\Controllers\RouteController::class, 'browse'])->name('browser');
Route::get('/search/{location}/{term}', [App\Http\Controllers\RouteController::class, 'search'])->name('search');

Route::get('/business/{slug}', [App\Http\Controllers\RouteController::class, 'show'])->name('show');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::group(['prefix' => 'adminpool'], function () {
    Voyager::routes();
});
