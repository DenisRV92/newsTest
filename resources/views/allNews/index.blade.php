@extends('welcome')
@section('content')
    @if(Session::has('success'))
        <div style="position: absolute;top: 5%;right: 50%" class="alert alert-success" id="alert">
            {{Session::get('success')}}
        </div>
    @endif
    @if(Session::has('error'))
        <div style="position: absolute;top: 5%;right: 50%" class="alert alert-danger" id="alert">
            {{Session::get('error')}}
        </div>
    @endif
    <div style="display: flex;flex-wrap: wrap;justify-content: space-between; margin-top: 50px;position: relative"
         class="container">
        <form style="display: block;position: absolute;right: 0" action="{{ route('news.sort') }}"
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
                <a href="{{ route('news.add',$new) }}" style="text-align: right;display: inline">Добавить в
                    избранное</a>
                <div style="display: flex">
                    @foreach($new->cities->pluck('city') as $city)
                        <span
                            style="display: inline-block; border: solid 0.2px black;border-radius: 5%; padding: 3px;margin: 5px">{{$city}}</span>
                    @endforeach
                </div>
                <img style="max-width: 100%" src="{{asset("/storage/".$new->img)}}" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">{{$new->title}}</h5>
                    <p class="card-text">{{$new->annonce}}</p>
                    <a href="{{route('news.show',$new)}}" class="btn btn-primary">Читать</a>
                </div>
            </div>
        @endforeach
    </div>
@endsection
