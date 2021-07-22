<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="icon" href="{{Voyager::image(setting('site.logo'))}}" type="image/x-icon"/>
    
    {{-- <title>{{ config('app.name', 'Laravel') }}</title> --}}
    {{-- @stack('header') --}}
    {!! SEOMeta::generate() !!}
    <link rel="canonical" href="http://businessgrills.com/" />

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> --}}

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <style>
        a:hover {
            text-decoration: none !important;
        }
    </style>
</head>
<body>
    <div id="app">

        <div>
            @yield('content')
        </div>
            
    </div>
    
    
</body>
</html>
