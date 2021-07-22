    @foreach ($items as $menu_item)
        <menus title="{{$menu_item->title}}" url="{{$menu_item->url}}" iconn="{{$menu_item->icon_class}}" colour="{{$menu_item->icon_color}}"></menus>
    @endforeach
