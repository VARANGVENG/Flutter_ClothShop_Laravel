<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

// Simple Concept
// Route::get('/products', function () {
//     return response()->json([
//         ['id' => 1, 'name' => 'Handbag', 'price' => 99.99],
//         ['id' => 2, 'name' => 'Backpack', 'price' => 79.99],
//         ['id' => 3, 'name' => 'Tote Bag', 'price' => 65.00],
//     ]);
// });

// Using Controller 
Route::get('/products', [ProductController::class, 'index']);
Route::post('/products', [ProductController::class, 'store']);
Route::delete('/products/{id}', [ProductController::class, 'destroy']);

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});