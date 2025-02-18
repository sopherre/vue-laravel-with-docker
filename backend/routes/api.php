<?php

use Illuminate\Support\Facades\Route;

Route::get('/health', function () {
    return response()->json(["message" => "API Success Health Check"]);
});
