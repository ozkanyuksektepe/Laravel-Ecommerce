<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SepetUrun extends Model
{
    use HasFactory;

    protected $fillable = ['sepet_id','urun_id','adet','fiyati','durum','guncelleme_tarihi','olusturulma_tarihi','silinme_tarihi'];
    protected $softDelete = true;
    protected $table = "sepeturun";


    const CREATED_AT = 'olusturulma_tarihi';
    const UPDATED_AT = 'guncelleme_tarihi';
    const DELETED_AT = 'silinme_tarihi';

    public function urun(){
        return $this->belongsTo('App\Models\Urun');
    }
}
