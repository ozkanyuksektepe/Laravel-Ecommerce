@extends('yonetim.layouts.master')
@section('title', 'Sipariş Yönetimi')
@section('content')
    <h1 class="page-header">Sipariş Yönetimi</h1>
    <form method="post" action="{{ route('yonetim.siparis.kaydet', @$entry->id) }}" enctype="multipart/form-data">
        @csrf
        <div class="pull-right">
          <button type="submit" class="btn btn-primary">
              {{ @$entry->id > 0 ? "Güncelle" : "Kaydet" }}
          </button>
        </div>
        <h3 class="sub-header">
            Sipariş {{ @$entry->id > 0 ? "Düzenle" : "Ekle" }}
        </h3>

        @include('layouts.partials.errors')
        @include('layouts.partials.alert')


        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="adsoyad">Ad Soyad</label>
                    <input type="text" class="form-control" id="adsoyad" name="adsoyad" placeholder="Ad Soyad" value="{{ old('adsoyad', $entry->adsoyad) }}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="telefon">Telefon</label>
                    <input type="text" class="form-control" id="telefon" name="telefon" placeholder="Telefon" value="{{ old('telefon',$entry->telefon) }}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ceptelefonu">Cep Telefonu</label>
                    <input type="text" class="form-control" id="ceptelefonu" name="ceptelefonu" placeholder="Cep Telefonu" value="{{ old('ceptelefonu',$entry->ceptelefonu) }}">
                </div>
            </div>
        </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="adres">Adres</label>
                        <textarea class="form-control" id="adres" name="adres" placeholder="Adres" {{ old('adres', $entry->adres) }}></textarea>
                    </div>
                </div>
            </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="durum">Durum</label>
                    <select name="durum" class="form-control" id="durum">
                      <option {{ old('durum', $entry->durum) == 'Siparişiniz Alındı' ? 'selected' : '' }}>Siparişiniz Alındı</option>
                      <option {{ old('durum', $entry->durum) == 'Ödeme Onaylandı' ? 'selected' : '' }}>Ödeme Onaylandı</option>
                      <option {{ old('durum', $entry->durum) == 'Kargoya Verildi' ? 'selected' : '' }}>Kargoya Verildi</option>
                      <option {{ old('durum', $entry->durum) == 'Sipariş Tamamlandı' ? 'selected' : '' }}>Sipariş Tamamlandı</option>
                    </select>
                </div>
            </div>
        </div>
    </form>

    <h3>Sipariş (SP-{{ $entry->id }})</h3>
    <table class="table table-bordererd table-hover">
        <tr>
            <th colspan="2">Ürün</th>
            <th>Tutar</th>
            <th>Adet</th>
            <th>Ara Toplam</th>
            <th>Durum</th>
        </tr>
        @foreach($entry->sepet->sepet_urunler as $sepeturun)
            <tr>
                <td style="width:120px">
                    <a href="{{ route('urun', $sepeturun->urun->slug) }}">
                        <img src=" {{$sepeturun->urun->detay->urun_resmi!=null ?  asset('uploads/urunler/' .  $sepeturun->urun->detay->urun_resmi) : 'http://lorempixel.com/120/100/food/1' }}" style="width:140px; height:120px;">
                    </a>
                </td>
                <td> <a href="{{ route('urun', $sepeturun->urun->slug) }}">
                        {{ $sepeturun->urun->urun_adi }}
                    </a>
                </td>
                <td>{{ $sepeturun->fiyati }}₺</td>
                <td>{{ $sepeturun->adet }}</td>
                <td>{{ $sepeturun->fiyati * $sepeturun->adet }} ₺</td>
                <td>{{ $sepeturun->durum}}</td>
            </tr>
        @endforeach
        <tr>
            <th colspan="4" class="text-right">Toplam Tutar</th>
            <td colspan="2">{{ $entry->siparis_tutari }} ₺</td>
        </tr>
        <tr>
            <th colspan="4" class="text-right">Toplam Tutar (KDV Dahil)</th>
            <td colspan="2">{{ $entry->siparis_tutari* ((100+config('cart.tax'))/100) }} ₺</td>
        </tr>
        <tr>
            <th colspan="4" class="text-right">Sipariş Durumu</th>
            <td colspan="2">{{ $entry->durum }}</td>
        </tr>

    </table>
@endsection
