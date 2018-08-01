$(document).on('turbolinks:load', function(){
  $('#txt_search').bind('focus keyup', function(){
    var search = $(this).val();
    if (search != '') {
      $('.ul-result_search').css('display', 'block')
      $.ajax({
        url: '/search_books',
        method: 'GET',
        data: {search: $.trim(search)},
      })
    } else {
      $('.ul-result_search').css('display', 'none')
    }
  })

  $('#txt_search_user').bind('focus keyup', function(){
    var search = $(this).val()
    var path = window.location.pathname
    var user_id = path.charAt(7)
    if (search != '') {
      $.ajax({
        url: '/search_users',
        method: 'GET',
        data: {
          keyword: search,
          user_id: user_id,
          from_tab: $('li.active').data('tab_id')
        },
      })
    } else {
      $.ajax({
        url: '/users/' + user_id,
        method: 'GET',
        from_tab: $('li.active').data('tab_id')
      })
    }
  })
})
