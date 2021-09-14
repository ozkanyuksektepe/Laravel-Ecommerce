<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    use HasFactory;
    protected $softDelete = true;
    protected $table = 'kategori';
    //protected $fillable = ['kategori_adi','slug'];
    protected $guarded = [];
    const CREATED_AT = 'olusturulma_tarihi';
    const UPDATED_AT = 'guncelleme_tarihi';
    const DELETED_AT = 'silinme_tarihi';

    public function urunler(){
        return $this->belongsToMany('App\Models\Urun', 'kategori_urun');
    }

    public function ust_kategori(){
        return $this->belongsTo('App\Models\Kategori', 'ust_id')->withDefault([
            'kategori_adi' => 'Ana Kategori'
        ]);
    }
}
