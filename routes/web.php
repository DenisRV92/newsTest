<?php

use App\Http\Controllers\FavoritesController;
use App\Http\Controllers\NewsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('favorites.index');
});
Route::group(['prefix' => '/favorites', 'as' => 'favorites.'], function () {
    Route::get('/', [FavoritesController::class, 'index'])->name('index');
    Route::get('/sort', [FavoritesController::class, 'sort'])->name('sort');
    Route::get('/{favorites}', [FavoritesController::class, 'show'])->name('show');
});

Route::group(['prefix' => '/news', 'as' => 'news.'], function () {
    Route::get('/', [NewsController::class, 'index'])->name('index');
    Route::get('/sort', [NewsController::class, 'sort'])->name('sort');
    Route::post('/search', [NewsController::class, 'search'])->name('search');
    Route::get('/{news}', [NewsController::class, 'show'])->name('show');
    Route::get('add/{news}', [NewsController::class, 'add'])->name('add');
});
