@extends('layouts.master')
@section('title', 'Sipariş Detayı')
@section('content')
    <div class="container">
        <div class="bg-content">
            <a href="{{ route('siparisler') }}" class="btn btn-xs btn-primary">
                <i class="glyphicon glyphicon-arrow-left"></i> Siparişlere Dön
            </a>
            <h2>Sipariş (SP-{{ $siparis->id }})</h2>
            <table class="table table-bordererd table-hover">
                <tr>
                    <th colspan="2">Ürün</th>
                    <th>Tutar</th>
                    <th>Adet</th>
                    <th>Ara Toplam</th>
                    <th>Durum</th>
                </tr>
                @foreach($siparis->sepet->sepet_urunler as $sepeturun)
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
                    <td colspan="2">{{ $siparis->siparis_tutari }} ₺</td>
                </tr>
                <tr>
                    <th colspan="4" class="text-right">Toplam Tutar (KDV Dahil)</th>
                    <td colspan="2">{{ $siparis->siparis_tutari* ((100+config('cart.tax'))/100) }} ₺</td>
                </tr>
                <tr>
                    <th colspan="4" class="text-right">Sipariş Durumu</th>
                    <td colspan="2">{{ $siparis->durum }}</td>
                </tr>

            </table>
        </div>
    </div>
@endsection
