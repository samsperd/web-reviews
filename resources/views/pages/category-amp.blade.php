@extends('layouts.app')

@section('content')
    <browseorsearch>
        <div>
            @if ($posts != null)
                <category location-Slug={{$slug}} category-Slug={{$cate}}></category>
            
            @else
                
                <nolistfound term={{$cate}} ></nolistfound>
                
            @endif
        </div>
    </browseorsearch>
@endsection
