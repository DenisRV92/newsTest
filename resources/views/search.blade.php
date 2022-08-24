<form method="POST" style="margin: 50px 0; text-align: center" action="{{route('news.search')}}">
    @csrf
    @method('POST')
    <input style="width: 40%" type="text" name="title">
    <input type="submit" class="btn btn-dark" value="Найти">
</form>
<div style="text-align: center">
    <div class="btn-group" role="group" aria-label="Basic example">
        <a href="{{route('news.index')}}" type="button" class="btn btn-success">Все новости</a>
        <a href="{{route('favorites.index')}}" type="button" class="btn btn-secondary">Избранные новости</a>
    </div>
</div>
