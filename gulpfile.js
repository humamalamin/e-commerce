var elixir = require('laravel-elixir')

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function (mix) {
  mix.sass('app.scss')
  mix.styles([
    '../../../public/css/app.css',
    '../../../node_modules/font-awesome/css/font-awesome.css',
    '../../../node_modules/sweetalert/dist/sweetalert.css',
    '../../../node_modules/selectize/dist/css/selectize.bootstrap3.css'
  ], 'public/css/app.css')

  mix.scripts([
    '../../../node_modules/jquery/dist/jquery.js',
    '../../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.min.js',
    '../../../node_modules/sweetalert/dist/sweetalert.min.js',
    '../../../node_modules/selectize/dist/js/standalone/selectize.min.js',
    'app.js'
  ])

  mix.version(['css/app.css', 'js/all.js'])
  mix.copy('node_modules/font-awesome/fonts', 'public/fonts')
  mix.copy('node_modules/font-awesome/fonts', 'public/build/fonts')
})
