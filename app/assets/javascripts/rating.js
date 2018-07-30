$(document).on('turbolinks:load', function(){
  if ($(".area-rate").length > 0) {
    $(".fa-star").click(function() {
      poin = $(this).data("poin")
      for (i = 1; i <= 5; i++) {
        $(".fa-star-" + i).css("color", "#333333")
      }
      for (i = 1; i <= poin; i++) {
        $(".fa-star-" + i).css("color", "orange")
      }
      if ($("#rating_poin").length == 1){
        $("#rating_poin").val(poin)
      }
    })
  }
});
