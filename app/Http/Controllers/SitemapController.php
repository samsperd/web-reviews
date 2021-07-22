<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use URL;
use App\Models\Post;
use App\Models\Location;
use App\Models\Category;

class SitemapController extends Controller
{
    public function sitemap()
    {
        $sitemap_contents = App::make("sitemap");
        // $sitemap_contents->setCache('laravel.sitemap_contents', 3600);


        // Instantiation
        $categories = Category::all();
        $locations = Location::where('status', '=', 'publish')->get();
        $posts = Post::where('status', '=', 'PUBLISHED')->with('location')->with('category')->get();
        
        // For Posts
        foreach ($posts as $post) {
            $url = url('/business/'.$post->slug);
            $sitemap_contents->add($url, $post->updated_at, '1.0', 'daily');
        }


        // For category
        $checker = [];
        foreach ($categories as $category) {
            foreach ($locations as $location) {
                $data = Location::with('childrenRecursive')->where('slug', $location->slug)->where('status', '=', 'publish')->get();
                $postsId =  $data->pipe(function ($collection) {
                    $array = $collection->toArray();
                    $ids = [];
                    array_walk_recursive($array, function ($value, $key) use (&$ids) {
                        if ($key === 'id') {
                            $ids[] = $value;
                        };
                    });
                    return $ids;
                });

                $poster = $category->post()->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->with('location')->with('category')->get();



                $categoryUrl = url('/location/'.$location->slug.'/category/'.$category->slug);
                if ($poster != null || $poster != '') {
                    $sitemap_contents->add($categoryUrl, $category->updated_at, '1.0', 'daily');
                }
            }
            // $url = url('/location/{slug}/category/{cate}');
            // $sitemap_contents->add($url, $post->updated_at, '1.0', 'daily');
        }


        // For Browser
        foreach ($locations as $location) {
            $browseUrl = url('/browse-location/'.$location->slug);
            $sitemap_contents->add($browseUrl, $location->updated_at, '1.0', 'daily');
        }
        
        // For Search
        $terms = Post::where('status', '=', 'PUBLISHED')
                        ->get(['title', 'deals_with', 'meta_keywords']);
        $deals_with = [];
        $title = [];
        $keywords = [];
        foreach ($terms as $term => $value) {
            $deals_with[$term] = $value['deals_with'];
            $title[$term] = $value['title'];
            $keywords[$term] = $value['meta_keywords'];
        }
        $merger = array_merge($deals_with, $title, $keywords);
        $allArray = explode(',', implode(',', $merger));
        $filteredArray = array_filter($allArray, fn($valued) => !is_null($valued) && $valued !== '');
        $trimmedArray = array_unique(array_map('strtolower', array_map('trim', $filteredArray)));
        // $quote = preg_quote($request->get('term'), '~');
        // $sear = preg_grep('~' .$quote.'~', $trimmedArray);
        $searc = array_column($trimmedArray, null);
        $cont = count($searc);
        foreach ($locations as $location) {
            for ($d=0; $d < $cont; $d++) { 
                // $checker[]= $searc[$d];
                $searchUrl = url('/search/'.$location->slug.'/'.strtolower(str_replace(' ', '-', $searc[$d])));
                $sitemap_contents->add($searchUrl, $location->updated_at, '1.0', 'daily');
                
            }
        }
        // $sitemap_contents->store('xml', 'sitemap');
        return $sitemap_contents->render('xml');
    }
}
