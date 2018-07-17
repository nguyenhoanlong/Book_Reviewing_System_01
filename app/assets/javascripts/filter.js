$(document).ready(function(){
  $('#form_filter').change(function() {
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
