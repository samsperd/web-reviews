@extends('layouts.app')

@section('content')
    <welcome welcometitle="{{setting('site.welcome_title')}}" sourced="{{Voyager::image(setting('site.background_image'))}}">
            {{menu('main', 'layouts.links')}}
    </welcome>
@endsection
