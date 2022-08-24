@extends('welcome')
@section('content')
    <div style="display: flex;flex-wrap: wrap;justify-content: space-between; margin-top: 50px;position: relative"
         class="container">
        <form style="display: block;position: absolute;right: 0" action="{{ route('favorites.sort') }}"
              method="GET">
            <select name="city" id="">
                @foreach($cities as $item)
                    <option value="{{ $item->city }}"
                            @if(!empty($_GET['city']))
                            @if ($item->city === $_GET['city'] )  selected @endif
                        @endif>{{ $item->city }}</option>
                @endforeach
            </select>
            <input style="" type="submit" value="поиск">
        </form>
        @foreach($news as $new)
            <div style="width: 30%;margin-top: 60px" class="card">
                <div style="display: flex">
                    @foreach($new->newsFavorites->cities->pluck('city') as $city)
                        <span
                            style="display: inline-block; border: solid 0.2px black;border-radius: 5%; padding: 3px;margin: 5px">{{$city}}</span>
                    @endforeach
                </div>
                <img style="max-width: 100%" src="{{asset("/storage/".$new->newsFavorites->img)}}"
                     class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">{{$new->newsFavorites->title}}</h5>
                    <p class="card-text">{{$new->newsFavorites->annonce}}</p>
                    <a href="{{route('favorites.show',$new)}}" class="btn btn-primary">Читать</a>
                </div>
            </div>
        @endforeach
    </div>
@endsection
