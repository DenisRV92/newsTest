<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Favorites;
use App\Models\News;
use App\Services\NewsServices;
use Illuminate\Http\Request;

class FavoritesController extends Controller
{
    /**
     * @var NewsServices $service
     */
    private $service;

    /**
     * UserController constructor.
     * @param NewsServices $service
     */
    public function __construct(NewsServices $service)
    {
        $this->service = $service;
    }

    /**
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $news = Favorites::query()->paginate(6);
        $cities = City::all();
        return view('favorites.index', ['news' => $news, 'cities' => $cities]);

    }


    /**
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function sort(Request $request)
    {
        $news = Favorites::all();
        $cities = City::all();
        $news = $this->service->filter($news, $request->city);
        return view('favorites.index', ['news' => $news, 'cities' => $cities]);
    }

    /**
     *
     * @param \App\Models\Favorites $favorites
     * @return \Illuminate\Http\Response
     */
    public function show(Favorites $favorites)
    {
        $news = News::all();
        $similarText = $this->service->similarText($favorites, $news);
        return view('favorites.show', ['new' => $favorites, 'similarText' => $similarText]);
    }

}
