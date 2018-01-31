<?php

return [

    /*
    |--------------------------------------------------------------------------
    | End Point Api ( Konfigurasi Server Akun )
    |--------------------------------------------------------------------------
    |
    | Starter : http://rajaongkir.com/api/starter
    | Basic : http://rajaongkir.com/api/basic
    | Pro : http://pro.rajaongkir.com/api
    |
    */

    'end_point_api' => env('RAJAONGKIR_ENDPOINTAPI', 'http://rajaongkir.com/api/starter'),

    /*
    |--------------------------------------------------------------------------
    | Api key
    |--------------------------------------------------------------------------
    |
    | Isi dengan api key yang didapatkan dari rajaongkir
    |
    */

    'api_key' => env('RAJAONGKIR_APIKEY', 'dfa4ea26d17b50e2698851676e3a9190'),
    'fallback_fee' => env('RAJAONGKIR_FALLBACK_FEE', 40000),
    'origin' => env('RAJAONGKIR_REGENCY_ORIGIN', 23), // Kota Bandung, Jawa Barat
    'courier' => env('RAJAONGKIR_COURIER', 'jne'),
    'service' => env('RAJAONGKIR_SERVICE', 'REG'),
];
