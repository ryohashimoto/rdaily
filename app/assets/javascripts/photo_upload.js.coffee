$ ->
  $('textarea.image_upload').on 'drop', (event) ->
    $textarea = $(@)
    event.stopPropagation()
    event.preventDefault()
    formData = new FormData()
    file = event.originalEvent.dataTransfer.files[0]
    formData.append('image', file)
    cursorPosition = $textarea.prop('selectionStart')
    val = $textarea.val()
    textBefore = val.substring(0, cursorPosition)
    textAfter = val.substring(cursorPosition, val.length);
    textUploading = "![Uploading #{file.name} . . .]()"
    $textarea.val(textBefore + textUploading + textAfter)
    $.ajax '/account/photos',
      type: 'POST'
      data: formData
      cache: false
      contentType: false
      processData: false
    .done (data) =>
      text = $textarea.val()
      textUploaded = "![#{data.image.name}](#{data.image.url})"
      $textarea.val(text.replace(textUploading, textUploaded))
