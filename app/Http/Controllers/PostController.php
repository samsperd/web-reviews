<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Location;
use App\Models\Tag;
use App\Models\Category;
use App\Models\Page;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::where('status', '=', 'PUBLISHED')->with('category')->with('location')->with('rating')->get();
        $locations = Location::where('status', '=', 'publish')->orderBy('slug', 'DESC')->get();
        return response()->json(['posts' => $posts, 'locations' => $locations]);
    }

    public function searchLocation()
    {
        $locations = Location::where('status', '=', 'publish')->orderBy('slug', 'DESC')->get();
        return response()->json(['locations' => $locations]);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    public function showCategory(Request $request)
    {
        $slug = $request->get('location');
        $cate = $request->get('cate');
        $category = Category::findBySlug($cate);
        $locations = Location::where('status', '=', 'publish')->orderBy('order', 'DESC')->get();
        $location = null;
        $categories = Category::orderBy('name')->get();
        
        if (!is_null($category)) {
            if(!is_null($slug)){
                $data = Location::with('childrenRecursive')->where('slug', $slug)->where('status', '=', 'publish')->get();
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

                $posts = $category->post()->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->where('featured','=','0')->with('location')->with('category')->paginate(2);

            }
            else
            {
                $posts = $category->post()->where('status', '=', 'PUBLISHED')->where('featured','=','0')->with('location')->with('category')->orderByRaw('FIELD(location_id, '.implode(",", $postsId).')')->paginate(1);
            }
            return response()->json(['posts' => $posts, 'category' => $category, 'cate' => $cate, 'locations' => $locations, 'categories' => $categories]);
        } else {
            return response()->json(['posts'=> null, 'category' => $category,'cate' => $cate]);
        }
    }
    public function showSponsoredCategory(Request $request)
    {
        $slug = $request->get('location');
        $cate = $request->get('cate');
        $category = Category::findBySlug($cate);
        $locations = Location::where('status', '=', 'publish')->orderBy('order', 'DESC')->get();
        $location = null;
        $categories = Category::orderBy('name')->get();
        
        if (!is_null($category)) {
            if(!is_null($slug)){
                $data = Location::with('childrenRecursive')->where('slug', $slug)->where('status', '=', 'publish')->get();
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

                $posts = $category->post()->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->where('featured','=','1')->with('location')->with('category')->get();

            }
            else
            {
                $posts = $category->post()->where('status', '=', 'PUBLISHED')->where('featured','=','1')->with('location')->with('category')->orderByRaw('FIELD(location_id, '.implode(",", $postsId).')')->get();
            }
            return response()->json(['posts' => $posts]);
        } else {
            return response()->json(['posts'=> null, 'category' => $category,'cate' => $cate]);
        }
    }
    
    public function categories()
    {
        $categories = Category::orderBy('name')->get();
        return response()->json(['categories'=> $categories]);
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $post = Post::where('status', '=', 'PUBLISHED')->where('slug', $slug)->with('location')->with('category')->first();
        // return response()->json(['post' => $post]);
        if (!is_null($post)) {
            $category = Category::all();
            $categoryrelatives = Post::with('location')->whereHas('category', function($q) use($post) {
                return $q->whereIn('name', $post->category->pluck('name'));
            })->where('id', '!=', $post->id)->where('status', '=', 'PUBLISHED');
            $data = Location::with('childrenRecursive')->where('slug', $post->location->slug)->where('status', '=', 'publish')->get();
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
            $relatives = $categoryrelatives->limit(3)->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->with('category')->with('location')->get();
            $categories = Category::inRandomOrder()->limit(3)->get();
            return response()->json(['post' => $post, 'categories' => $categories, 'relatives' => $relatives]);
        } else {
            return response()->json(['0' => '0']);
        }        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }
    public function showPrivacy()
    {
        $page = Page::find(1);
        return response()->json(['privacy' => $page]);
    }
    public function showTerm()
    {
        $page = Page::find(2);
        return response()->json(['term' => $page]);
    }
    public function finder(Request $request)
    {
        $location = Location::findBySlug($request->get('location'));
        $tikitiki = str_replace('-', ' ', $request->get('search'));
        $locations = Location::where('status', '=', 'publish')->orderBy('order', 'DESC')->get();
        if ($tikitiki != null) {
            if ((!is_null($location))) {
                $data = Location::with('childrenRecursive')->where('slug', $request->get('location'))->where('status', '=', 'publish')->get();
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
                $posts = Post::where('status', '=', 'PUBLISHED')
                                ->with('location')
                                ->with('category')
                                ->where('title', 'LIKE', "%{$tikitiki}%")
                                ->orWhere('excerpt', 'LIKE', "%{$tikitiki}%")
                                ->orWhere('deals_with', 'LIKE', "%{$tikitiki}%")
                                ->orWhere('meta_keywords', 'LIKE', "%{$tikitiki}%")
                                ->orWhereHas('category', function($query) use ($tikitiki) {
                                    $query->where('name', 'LIKE', "%{$tikitiki}%");
                                })
                                ->whereIn('location_id', $postsId)
                                ->orderByRaw('FIELD(location_id, '.implode(",", $postsId).')')
                                ->paginate(2);

                return response()->json(['posts' => $posts, 'locations' => $locations]);


            } 
            else {
                return response()->json(['error' => '0']);
            }
            
        } else {
            return response()->json(['browse' => '0']);
        }
        
        
    }


    public function searching(Request $request)
    {
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
        $quote = preg_quote($request->get('term'), '~');
        $sear = preg_grep('~' .$quote.'~', $trimmedArray);
        $searc = array_column($sear, null);
        $all = array_slice($searc, 0, 5);
        return response()->json(['posts' => $all]);
        
        
    }
    public function browser($slug)
    {
        $location = Location::findBySlug($slug);
        $allposts = Post::where('status', '=', 'PUBLISHED');
        $locations = Location::where('status', '=', 'publish')->orderBy('order', 'DESC')->get();
        $categories = Category::orderBy('name')->get();

        if ((!is_null($location))) {
            $data = Location::with('childrenRecursive')->where('slug', $slug)->where('status', '=', 'publish')->get();
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

            $posts = $allposts->whereIn('location_id', $postsId)->where('featured','=','0')->with('category')->with('location')->orderByRaw('FIELD(location_id, '.implode(",", $postsId).')')->paginate(2);

            return response()->json(['posts' => $posts, 'locations' => $locations, 'categories' => $categories]);


        } 
        else {
            return response()->json(['posts' => null]);
        }
        
    }
    public function sponsoredbrowser($slug)
    {
        $location = Location::findBySlug($slug);
        $allposts = Post::where('status', '=', 'PUBLISHED');
        $locations = Location::where('status', '=', 'publish')->orderBy('order', 'DESC')->get();
        $categories = Category::orderBy('name')->get();

        if ((!is_null($location))) {
            $data = Location::with('childrenRecursive')->where('slug', $slug)->where('status', '=', 'publish')->get();
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

            $posts = $allposts->whereIn('location_id', $postsId)->with('category')->where('featured','=','1')->with('location')->orderByRaw('FIELD(location_id, '.implode(",", $postsId).')')->get();

            return response()->json(['posts' => $posts]);


        } 
        else {
            return response()->json(['posts' => null]);
        }
        
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
