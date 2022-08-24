@extends('welcome')
@section('content')
    <div style="display: flex">
        <div style="margin: 40px 0 0 20px;width: 80%" class="container">
            <div style="" class="new">
                <img style="margin: 0 15px 15px 0" align="left"
                     vspace="5" hspace="5" src="{{asset("/storage/".$new->img)}}" alt="">
                <div>{!! nl2br(e($new->description)) !!}</div>
            </div>
        </div>
        <div style="width: 20%;margin-top: 30px;border-left: #0a58ca solid 1px" class="similar">
            <h4 style="text-align: center">Похожие новости</h4>
            @foreach($similarText as $new)
                <a href="{{route('news.show',$new)}}">
                    <div style="padding-left: 15px;margin-bottom: 20px">{{$new->title}}</div>
                </a>
            @endforeach
        </div>
    </div>
@endsection
