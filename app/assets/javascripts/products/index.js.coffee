$(document).on 'turbolinks:load', =>
  return unless page.controller() == 'products' && page.action() == 'index'
  $('main').append '<li>Hello from products index</li>'
