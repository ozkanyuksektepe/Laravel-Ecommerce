<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Kullanici;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Mail\KullaniciKayitMail;
use Illuminate\Support\Facades\Mail;
use Gloudemans\Shoppingcart\Facades\Cart;;
use App\Models\Sepet;
use App\Models\SepetUrun;
use App\Models\KullaniciDetay;



class kullanicicontroller extends Controller
{
    public function __construct(){
        $this->middleware('guest')->except('oturumukapat');
    }

    public function giris_form(){
        return view('kullanici.oturumac');
    }

    public function giris(){
        $this->validate(request(),[
            'email' => 'required|email',
            'sifre'=> 'required'
        ]);
        $credentials = [
            'email'=> request('email'),
            'password'=> request('sifre'),
            'aktif_mi'=> 1
        ];
        if(auth()->attempt($credentials, request()->has('benihatırla'))){
            request()->session()->regenerate();

            $aktif_sepet_id = Sepet::aktif_sepet_id();
            if (is_null($aktif_sepet_id)){
                $aktif_sepet = Sepet::create(['kullanici_id'=>auth()->id()]);
                $aktif_sepet_id = $aktif_sepet->id;
            }

            session()->put('akitf_sepet_id', $aktif_sepet_id);

            if(Cart::count()>0){
                foreach (Cart::content()as $cartItem){
                    sepeturun::updateOrCreate(
                      ['sepet_id'=> $aktif_sepet_id, 'urun_id'=>$cartItem->id],
                      ['adet'=> $cartItem->qty, 'fiyati', $cartItem->price, 'durum'=> 'Beklemede']
                    );
                }
            }

            Cart::destroy();
            $sepetUrunler = sepeturun::with('urun')->where('sepet_id', $aktif_sepet_id)->get();
            foreach ($sepetUrunler as $sepeturun){
                Cart::add($sepeturun->urun->id, $sepeturun->urun->urun_adi, $sepeturun->adet, $sepeturun->urun->fiyati, ['slug'=> $sepeturun->urun->slug]);
            }

            return redirect()->intended('/');
        }
        else{
            $errors = ['email'=> 'Hatalı Giriş'];
            return back()->withErrors($errors);
        }
    }

    public function kaydol_form(){
        return view('kullanici.kaydol');
    }

    public function kaydol(){

        $this->validate(request(), [
            'adsoyad'=> 'required|min:5|max:60',
            'email'=> 'required|email|unique:kullanici',
            'sifre'=> 'required|confirmed|min:%|max:15',
        ]);

        $kullanici = Kullanici::create([
            'adsoyad'=> request('adsoyad'),
            'email'=> request('email'),
            'sifre'=> Hash::make(request('sifre')),
            'aktivasyon_anahtari'=> Str::random(60),
            'aktif_mi'=> 0
        ]);

        $kullanici->detay()->save(new KullaniciDetay());

        Mail::to(request('email'))->send(new KullaniciKayitMail($kullanici));

        auth()->login($kullanici);

        return redirect()->route('anasayfa');
    }

    public function aktiflestir($anahtar){
        $kullanici = kullanici::where('aktivasyon_anahtari', $anahtar)->first();
        if (!is_null($kullanici)){
            $kullanici->aktivasyon_anahtari = null;
            $kullanici->aktif_mi = 1;
            $kullanici->save();
            return redirect()->to('/')
                ->with('mesaj', 'Kullanıcı kaydınız aktifleştirildi')
                ->with('mesaj_tur', 'success');
        }
        else {
            return redirect()->to('/')
                ->with('mesaj', 'Kullanıcı kaydı bulunamadı')
                ->with('mesaj_tur', 'warning');
        }
    }

    public function oturumukapat(){
        auth()->logout();
        request()->session()->flush();
        request()->session()->regenerate();
        return redirect()->route('anasayfa');
    }

}
