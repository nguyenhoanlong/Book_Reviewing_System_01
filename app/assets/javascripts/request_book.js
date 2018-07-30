function handle_request_book(e) {
  var status = $(e).val();
  $('#area-reason').empty();
  $('#request_reason').val('');
  switch (status) {
    case '1':
      $('#request_reason').val(I18n.t("accept_request"));
      break;

    case '2':
      html = '<div class="col-md-3"><label><input type="radio" name="cb_reason" onchange="content_reason()" value="have_book" />' + I18n.t("have_book") + '</label></div>'
      html += '<div class="col-md-3"><label><input type="radio" name="cb_reason" onchange="content_reason()" value="not_suitable"/>' + I18n.t("not_suitable") +'</label></div>'
      html += '<div class="col-md-3"><label><input type="radio" name="cb_reason" onchange="content_reason()" value="other"/>' + I18n.t("other") + '</label></div>'
      $('#area-reason').html(html);
      break;
  }
}

function content_reason() {
  var reason = $('input[name=cb_reason]:checked').val()
  switch (reason) {
    case 'have_book':
      $('#request_reason').val(I18n.t('content_have_book'));
      break;

    case 'not_suitable':
      $('#request_reason').val(I18n.t('content_not_suitable'));
      break;

    default:
      $('#request_reason').val('');
      break;
  }
}
