@foreach ($posts as $post)
<postlist :post='@json($post)' category-Name={{$category->name}} location={{$slug}} ></postlist>
{{-- <div class="card card-body">
    {{$post}}
</div> --}}
@endforeach
