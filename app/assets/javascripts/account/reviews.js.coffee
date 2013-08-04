# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  source = $('#product_template').html()
  template = Handlebars.compile(source)

  $('input#search_product_button').on 'click', (event) =>
    $('#products').empty()
    search_keyword = $('input#search_keyword').val()
    search_index = $('select#search_index').val()
    unless search_keyword == ''
      postSearchKeyword '/account/reviews/search_product',
        {search: { keyword: search_keyword, index: search_index } }, 
        renderSearchResult
  
  postSearchKeyword = (url, data, callback) ->
    $.ajax
      url: url
      type: 'POST'
      dataType: 'json'
      data: data
      success: callback
  
  renderSearchResult = (ajax) ->
    if ajax
      console.dir(ajax)
      for item in ajax.items
        html = template(item)
        $('#products').append(html)