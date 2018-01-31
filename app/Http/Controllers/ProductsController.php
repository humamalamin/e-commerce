<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Product;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use File;

class ProductsController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('role:admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $q = $request->get('q');
        $products = Product::where('name', 'LIKE', '%'.$q.'%')
            ->orWhere('model', 'LIKE', '%'.$q.'%')
            ->orderBy('name')->paginate(10);
        return view('products.index', compact('products', 'q'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('products.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|unique:products',
            'model' => 'required',
            'photo' => 'mimes:jpeg,png|max:10240',
            'price' => 'required|numeric|min:1000',
            'weight' => 'required|integer|min:100'
        ]);
        $data = $request->only('name', 'model', 'price', 'weight');

        if ($request->hasFile('photo')) {
            $data['photo'] = $this->savePhoto($request->file('photo'));
        }

        $product = Product::create($data);
        $product->categories()->sync($request->get('category_lists'));

        \Flash::success($product->name . ' saved.');
        return redirect()->route('products.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::findOrFail($id);
        return view('products.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        $this->validate($request, [
            'name' => 'required|unique:products,name,'. $product->id,
            'model' => 'required',
            'photo' => 'mimes:jpeg,png|max:10240',
            'price' => 'required|numeric|min:1000',
            'weight' => 'required|numeric|min:100'
        ]);
        $data = $request->only('name', 'model', 'price', 'weight');

        if ($request->hasFile('photo')) {
            $data['photo'] = $this->savePhoto($request->file('photo'));
            if ($product->photo !== '') $this->deletePhoto($product->photo);
        }

        $product->update($data);
        if (count($request->get('category_lists')) > 0) {
            $product->categories()->sync($request->get('category_lists'));
        } else {
            // no category set, detach all
            $product->categories()->detach();
        }

        \Flash::success($product->name . ' updated.');
        return redirect()->route('products.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        if ($product->photo !== '') $this->deletePhoto($product->photo);
        $product->delete();
        \Flash::success('Product deleted.');
        return redirect()->route('products.index');
    }

    /**
     * Move uploaded photo to public/img folder
     * @param  UploadedFile $photo
     * @return string
     */
    protected function savePhoto(UploadedFile $photo)
    {
        $fileName = str_random(40) . '.' . $photo->guessClientExtension();
        $destinationPath = public_path() . DIRECTORY_SEPARATOR . 'img';
        $photo->move($destinationPath, $fileName);
        return $fileName;
    }

    /**
     * Delete given photo
     * @param  string $filename
     * @return bool
     */
    public function deletePhoto($filename)
    {
        $path = public_path() . DIRECTORY_SEPARATOR . 'img'
            . DIRECTORY_SEPARATOR . $filename;
        return File::delete($path);
    }
}
