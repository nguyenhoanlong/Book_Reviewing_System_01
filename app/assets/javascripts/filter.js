$(document).on('turbolinks:load', function(){
  $('#txt_filter_book, #category').bind("keyup change",function() {
    var keyword = $('#txt_filter_book').val()
    var cat_id = $('#category').val()
    $.ajax({
      url: '/admin/books',
      method: 'GET',
      data: {
        keyword: keyword,
        cat_id: cat_id
      },
    })
  })
})
