<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\News;
use App\Services\NewsServices;
use App\Services\Services;
use Illuminate\Http\Request;

class NewsController extends Controller
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $news = News::all();
        $cities = City::all();
        return view('allNews.index', ['news' => $news, 'cities' => $cities]);
    }

    /**
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function add(News $news)
    {
        $result = $this->service->add(['news_id' => $news->id]);
        if (!$result) {
            return redirect()->route('news.index')->with('error', 'Новость уже находится в избранном');
        }
        return redirect()->route('news.index')->with('success', 'Новость добавлена в избранное');
    }


    /**
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function sort(Request $request)
    {
        $news = News::all();
        $cities = City::all();
        $news = $this->service->filter($news, $request->city);
        return view('allNews.index', ['news' => $news, 'cities' => $cities]);

    }

    /**
     *
     * @param \App\Models\News $news
     * @return \Illuminate\Http\Response
     */
    public function show(News $news)
    {
        $new = $news;
        $news = News::all();
        $similarText = $this->service->similarText($new, $news);
        return view('allNews.show', ['new' => $new, 'similarText' => $similarText]);
    }

    /**
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request)
    {
        $news = $this->service->search($request);
        $cities = City::all();
        return view('allNews.index', ['news' => $news, 'cities' => $cities]);
    }

}
