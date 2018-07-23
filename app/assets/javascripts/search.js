$(document).on('turbolinks:load', function(){
  $('#txt_search').bind('focus keyup', function(){
    var search = $(this).val();
    if (search != '') {
      $('.ul-result_search').css('display', 'block')
      $.ajax({
        url: 'search_books',
        method: 'GET',
        data: {search: search},
      })
    } else {
      $('.ul-result_search').css('display', 'none')
    }
  })
})
