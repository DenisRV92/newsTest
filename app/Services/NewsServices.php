<?php

namespace App\Services;

use App\Models\Favorites;
use App\Models\News;
use Throwable;

/**
 * Class NewsServices
 * @package App\Services
 */
class NewsServices implements Service
{


    public function similarText($newShow, $news)
    {
        if (isset($newShow->newsFavorites)) {
            $newShow = $newShow->newsFavorites;
        }
        /**
         * Сравнимаем просматриваемую новость с списком всех новостей и сравниваем
         */
        foreach ($news as $key => $new) {
            if ($newShow->id != $new->id) {
                /**
                 * Сравнимаем заголовки
                 */
                similar_text($newShow->title, $new->title, $title);
                if ($title <= 30) {
                    /**
                     * Сравнимаем описание
                     */
                    similar_text($newShow->description, $new->description, $description);
                    if ($description <= 30) {
                        $news->forget($key);
                    }
                }
            } else {
                $news->forget($key);
            }
        }
        return $news;
    }

    /**
     * @param News $news
     * @param string $news
     * @return mixed
     */
    public function filter($news, $city)
    {
        $collection = collect();
        foreach ($news as $key => $new) {
            if (!empty($new->newsFavorites)) {
                foreach ($new->newsFavorites->cities->pluck('city') as $item) {
                    if ($item == $city) {
                        $collection = $collection->merge([$key => $new]);
                    }
                }
            } else {
                if (empty($new->newsFavorites)) {
                    foreach ($new->cities->pluck('city') as $item) {
                        if ($item == $city) {
                            $collection = $collection->merge([$key => $new]);
                        }
                    }
                }
            }
        }
        $news = $collection;
        return $news;
    }

    /**
     * @param array $request
     * @return bool
     */
    public function add($request)
    {
        try {
            $news = new Favorites($request);
            return $news->save();
        } catch (Throwable $e) {
            return 0;
        }
    }

    /**
     * @param array $request
     * @return mixed
     */
    public function search($request)
    {
        $news = News::where('title', 'LIKE', "%$request->title%")->get();
        return $news;
    }
}
