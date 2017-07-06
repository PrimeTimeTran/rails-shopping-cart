$(document).on 'turbolinks:load', ->
  return unless $('body').data('controller') == 'products' && $('body').data('action') == 'index'
  $('main').append '<h1>Hello World! from carts coffee</h1>'
