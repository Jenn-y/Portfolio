ready = ->
  Typed.new '.element',
    strings: [
      "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success. -James Cameron"
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready