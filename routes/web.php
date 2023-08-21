<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

use App\http\Controllers\EventController;

Route::get('/',  [EventController::class, 'index']);
Route::get('/events/create',  [EventController::class, 'create'])->middleware('auth'); //deixar so usuarios logados criar eventos
Route::get('/events/{id}',  [EventController::class, 'show']);
Route::post('/events',[EventController::class, 'store']);




Route::get('/contact', function () {
    return view('contact');
});

Route::get('/dashboard', [EventController::Class, 'dashboard'])->middleware('auth');



