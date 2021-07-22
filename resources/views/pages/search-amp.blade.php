@extends('layouts.app')

@section('content')

<browseorsearch>
    <div>
        @if ($posts != null)
            <searched location="{{$location}}" term="{{$term}}" ></searched>
        @else
            
            <nolistfound term="{{$term}}" ></nolistfound>
            
        @endif
    </div>
</browseorsearch>
@endsection
