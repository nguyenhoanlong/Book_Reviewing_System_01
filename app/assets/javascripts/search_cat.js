$(document).ready(function(){
  $('#txt_filter_cat').keyup(function() {
    var keyword = $(this).val()
    $.ajax({
      url: '/admin/categories',
      method: 'GET',
      data: {
        keyword: $.trim(keyword)
      },
    })
  })
})
