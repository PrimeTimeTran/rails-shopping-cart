# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', =>
  # return unless page.controller() =='products' && page.action() == 'index'
  return unless $('body').data('controller') == 'products' && $('body').data('action') == 'index'
  $('main').append '<h1>Hello World! from products coffee</h1>'
