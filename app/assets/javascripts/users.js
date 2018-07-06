$( document ).ready(function() {
  $('#portrait-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var image = button.data('image')
    var url = button.data('url')
    var modal = $(this)
    modal.find('.modal-title').text(url)
    modal.find('.modal-image').attr('src', image)
  })
})
