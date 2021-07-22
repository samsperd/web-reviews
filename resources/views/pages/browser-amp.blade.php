@extends('layouts.app')

@section('content')

<browseorsearch>
    <div>
            
        @if ($posts != null)
            <browse location={{$slug}}></browse>
        @else
            
            <nolistfound ></nolistfound>
            
        @endif
    </div>
</browseorsearch>
@endsection
