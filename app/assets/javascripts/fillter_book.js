$(document).on('turbolinks:load', function(){
  $('#txt_filter_book_home, #category_home').bind("keyup change",function() {
    var keyword = $('#txt_filter_book_home').val()
    var cat_id = $('#category_home').val()
    $.ajax({
      url: '/home',
      method: 'GET',
      data: {
        keyword: $.trim(keyword),
        cat_id: cat_id
      },
    })
  })
})
