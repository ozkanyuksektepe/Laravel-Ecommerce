<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\Siparis;

class odemecontroller extends Controller
{
    public function index(){
        if (!auth()->check()){
            return redirect()->route('kullanici.oturumac')
                ->with('mesaj_tur','info')
                ->with('mesaj','Ödeme işlemi için oturum açmanız veya Kullanıcı kaydı yapmanız gerekmektedir.');
        }
        else if(count(Cart::content())==0)
        {
            return redirect()->route('anasayfa')
                ->with('mesaj_tur','info')
                ->with('mesaj','Ödeme işlemi için sepetinizde bir ürün bulunmalıdır.');
        }

        $kullanicidetay = auth()->user()->detay();

        return view('odeme', compact('kullanicidetay'));
    }

    public function odemeyap(){
        $siparis = request()->all();
        $siparis['sepet_id'] = session()->get('akitf_sepet_id');
        $siparis['banka'] = "Garanti";
        $siparis['taksit_sayisi'] = 1;
        $siparis['durum'] = "Siparişiniz alındı";
        $siparis['siparis_tutari'] = Cart::Subtotal(12,4);

        Siparis::create($siparis);
        Cart::destroy();
        session()->forget('aktif_sepet_id');

        return redirect()->route('siparisler')
            ->with('mesaj_tur', 'success')
            ->with('mesaj', 'Ödemeniz başarıli bir şekilde gerçekleştirildi.');
    }
}
