<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Location;
use App\Models\Tag;
use App\Models\Category;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\OpenGraph;
use Artesaos\SEOTools\Facades\TwitterCard;
use Artesaos\SEOTools\Facades\JsonLd;
use Artesaos\SEOTools\Facades\JsonLdMulti;
use Artesaos\SEOTools\Facades\SEOTools;

class RouteController extends Controller
{
    private function getView($viewName)
    {
        if (request()->segment(1) == 'amp') {
            if (view()->exists($viewName . '-amp')) {
                $viewName .= '-amp';
            } else {
                abort(404);
            }
        }
        return $viewName;
    }    
    public function index()
    {
        SEOMeta::setTitle(setting('site.title'));
        SEOMeta::setDescription(setting('site.description'));
        SEOMeta::setCanonical('https://www.businessgrills.com/');
        SEOMeta::addKeyword(setting('site.keywords'));
        return view('pages.index');
    }
    public function terms()
    {
        SEOMeta::setTitle('Terms - Businessgrills');
        SEOMeta::setDescription('Terms and Conditions of businessgrills');
        SEOMeta::setCanonical('https://www.businessgrills.com/terms');
        return view('pages.terms');
    }
    public function privacy()
    {
        SEOMeta::setTitle('Privacy');
        SEOMeta::setDescription('Privacy policy of businessgrills');
        SEOMeta::setCanonical('https://www.businessgrills.com/privacy');
        return view('pages.privacy');
    }
    public function donate()
    {
        SEOMeta::setTitle('Donate');
        SEOMeta::setDescription('Help Businessgrills carry on its services by donating to their account');
        SEOMeta::setCanonical('https://www.businessgrills.com/donate');
        SEOMeta::addKeyword(setting('site.keywords'));
        return view('pages.donate');
    }
    public function contact()
    {
        SEOMeta::setTitle('Contact us or Add your business to businessgrills');
        SEOMeta::setDescription('Contact Businessgrills or add your business to its network');
        SEOMeta::setCanonical('https://www.businessgrills.com/contact');
        return view('pages.contact-us');
    }
    public function categories()
    {
        SEOMeta::setTitle('Best Online Businesses by categories');
        SEOMeta::setDescription('Find the best online businesses according to their categories');
        SEOMeta::setCanonical('https://www.businessgrills.com/categories');
        return view($this->getView('pages.categories'));
    }
    public function category($slug, $cate)
    {
        $category = Category::findBySlug($cate);
        $location = Location::findBySlug($slug);
        if (!is_null($category)) {
            if(!is_null($location)){
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

                $posts = $category->post()->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->with('location')->with('category')->get();
                SEOMeta::setTitle('Best '.$location->location.' '.$category->name. ' Online Businesses');
                SEOMeta::setDescription('Find the best' .$location->location.'' .$category->name. 'online businesses');
                SEOMeta::setCanonical('https://www.businessgrills.com/location/'.$slug.'/category/'.$cate);
                return view($this->getView('pages.category'))->with(['posts' => $posts, 'category' => $category, 'cate' => $cate, 'slug' => $slug, 'location' => $location]);
            }
            else
            {
                return abort(404);
            }
            
        } else {
            return abort(404);
        }
    }
    public function show($slug)
    {
        $post = Post::where('status', '=', 'PUBLISHED')->where('slug', $slug)->with('location')->with('category')->first();
        if (!is_null($post)) {
            $category = Category::all();
            $relatives = Post::limit(3)->whereHas('category', function($q) use($post) {
                return $q->whereIn('name', $post->category->pluck('name'));
            })->where('id', '!=', $post->id)->where('status', '=', 'PUBLISHED')->get();

            $categories = Category::inRandomOrder()->limit(3)->get();
            SEOMeta::setTitle($post->seo_title);
            SEOMeta::setDescription($post->meta_description);
            SEOMeta::setCanonical('https://www.businessgrills.com/business/'.$slug);
            SEOMeta::addKeyword($post->meta_keywords);
    

            return view($this->getView('pages.show'))->with(['post' => $post,'slug'=> $slug, 'categories' => $categories, 'relatives' => $relatives]);
        } else {
            return abort(404);
        }        
    }
    public function browse($slug)
    {
        $location = Location::findBySlug($slug);
        $allposts = Post::where('status', '=', 'PUBLISHED');
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

            $posts = $allposts->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->with('category')->with('location')->get();
            SEOMeta::setTitle('Browse the best '.$location->location.' online businesses');
            SEOMeta::setDescription('Get the best '.$location->location.' online businesses and their ratings');
            SEOMeta::setCanonical('https://www.businessgrills.com/browse-location/'.$slug);
        
            return view($this->getView('pages.browser'))->with(['posts' => $posts, 'slug' => $slug, 'location' => $location]);
        } 
        else {
            return abort(404);
        }
        
    }
    public function search($location, $ter)
    {
        if ((!is_null($location))) {
            $findLocation = Location::findBySlug($location);
            if ($ter != null) {
                $term = str_replace('-', ' ', $ter);
                $data = Location::with('childrenRecursive')->where('slug', $location)->where('status', '=', 'publish')->get();
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
                                ->with('category')
                                ->with('location')
                                ->where('title', 'LIKE', "%{$term}%")
                                ->orWhere('excerpt', 'LIKE', "%{$term}%")
                                ->orWhere('deals_with', 'LIKE', "%{$term}%")
                                ->orWhere('meta_keywords', 'LIKE', "%{$term}%")
                                ->orWhereHas('category', function($query) use ($term) {
                                    $query->where('name', 'LIKE', "%{$term}%");
                                })
                                ->whereIn('location_id', $postsId)
                                ->get();
                // $posts = $allposts->whereIn('location_id', $postsId)->where('status', '=', 'PUBLISHED')->with('location')->get();
                SEOMeta::setTitle('Best online businesses related to '.$term.' in '.$findLocation->location);
                SEOMeta::setDescription('Get the best '.$findLocation->location.' online businesses related to '.$term);
                SEOMeta::setCanonical('https://www.businessgrills.com/location-'.$location.'/'.$term);
    

                return view($this->getView('pages.search'))->with(['posts' => $posts, 'term' => $term, 'location' => $location, 'foundLocation' => $findLocation]);
            } 
            else {
                return redirect($this->getView('/browse-location/' + $location))->with(['posts' => null, 'slug' => $slug, 'location' => $findLocation]);
            }
                
        } else {
            return abort(404);
        }
        
    }
}
