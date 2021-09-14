<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Urun;

class uruncontroller extends Controller
{
    public function index($slug_urunadi){
        $urun = Urun::whereSlug($slug_urunadi)->firstOrFail();
        $kategoriler = $urun->kategoriler()->distinct()->get();
        return view('urun', compact('urun','kategoriler'));
    }

    public function ara(){
        $aranan = request()->input('aranan');
        $urunler = Urun::where('urun_adi', 'like', "%$aranan%")
           ->orWhere('aciklama', 'like', "%$aranan%")
            ->paginate(2);
        request()->flash();
        return view('arama', compact('urunler'));
    }

}
