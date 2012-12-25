// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function() {
  $('#checkout').click(function(e){
    e.preventDefault()
    $(this).parent('form').submit()
  })
  $.each($('.add-to-cart'),function(i,a) {
    $(a).click(function(e){
      e.preventDefault()
      $(a).parent('form').submit()
    })
  })
  $.each($('#header-container li a'), function(i,a){
    $(a).click(function(e){
      console.log($(e.target).parent('li').siblings('li.active'))
      $(e.target).parent('li').siblings('li.active').removeClass('active')
    })
  })

  $.each($('.accordion a'),function(i,a) {
    $(a).click(function(e){
      $(e.target).parents('li').toggleClass('opened-product')
    })
  })
  if ($('.carousel').length > 0) $('.carousel').carousel()

  $('input[name=flare]').hide()
})

