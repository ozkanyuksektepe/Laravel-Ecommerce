require('./bootstrap');

setTimeout(function(){
    $('.alert').slideUp(500);
}, 3000);

$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

$('.urun-adet-artır, .urun-adet-azalt').on('click', function(){
   var id= $(this).attr('data-id');
   var adet= $(this).attr('data-adet');

   $.ajax({
       type: 'PATCH',
       url: '/sepet/guncelle/' + id,
       data: { adet: adet },
       success: function(result){
           window.location.href={{ route('sepet')}};
       }
   });
});
