<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Siparis extends Model
{
    use HasFactory;

    protected $softDelete = true;
    protected $table = "siparis";

    protected $fillable = ['sepet_id','siparis_tutari', 'adsoyad', 'adres', 'telefon', 'ceptelefonu', 'banka', 'taksit_sayisi', 'durum'];

    const CREATED_AT = 'olusturulma_tarihi';
    const UPDATED_AT = 'guncelleme_tarihi';
    const DELETED_AT = 'silinme_tarihi';

    public function sepet(){
        return $this->belongsTo('App\Models\Sepet');
    }
}
