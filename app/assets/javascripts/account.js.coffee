# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(document).on 'click', '#toggle_new_post', ->
    $this = $(this)
    if $this.data('new-post-open') == true
      $this.text('Create new post')
      $this.removeClass('secondary')
      $this.data('new-post-open', false)
      $('#new_post').slideUp()
    else
      $this.text('Close the form')
      $this.addClass('secondary')
      $this.data('new-post-open', true)
      $('#new_post').slideDown()
    return false
  $(document).on 'click', '.post_category', ->
    $this = $(this)
    if $this.attr('data-category-selected') == "false"
      $this.attr('data-category-selected', "true")
      $this.addClass('category_selected')
      categoryID = $this.attr('data-category-id')
      categoryName = $this.find('a').text()
      console.log categoryID
      console.log categoryName
      $('#new_post_categories').append('<li id="post_category_' + categoryID + '">' + categoryName + '</li>')
      categoryIDs = $('#post_category_ids').attr('value')
      $('#post_category_ids').attr('value', categoryIDs + ',' + categoryID)
    else if $this.attr('data-category-selected') == "true"
      $this.attr('data-category-selected', "false")
      $this.removeClass('category_selected')
      categoryID = $this.attr('data-category-id')
      console.log categoryID
      $('#new_post_categories').find('li#post_category_' + categoryID).remove()
      categoryIDs = $('#post_category_ids').attr('value')
      newCategoryIDs = categoryIDs.split(',').filter (x) -> x != categoryID
      $('#post_category_ids').attr('value', newCategoryIDs.join(','))        
    return false
  jQuery.event.props.push('dataTransfer')
  $('textarea').bind 'drop', (event) ->
    $textarea = $(this)
    event.stopPropagation()
    event.preventDefault()
    dt = event.dataTransfer
    file = dt.files[0]
    console.log(file)
    console.log($textarea.val())
    $textarea.val($textarea.val() + '{' + file.name + '}')
    $textarea.attr('selectionEnd', 0)
    $textarea.attr('selectionStart', 0)
    $textarea.focus()
