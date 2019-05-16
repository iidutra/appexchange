$(document).ready ->

  $('form').submit ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
        
$(document).ready ->
  $('#amount').change () ->
    getConvert()
  $('form').submit (event)->
    event.preventDefault()

  $('#invert').click ->
    currency_1 = $("#target_currency").val()
    currency_2 = $("#source_currency").val()

    $("#target_currency").val(currency_2)
    $("#source_currency").val(currency_1)
    getConvert()
