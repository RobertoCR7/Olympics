// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(document).on('turbolinks:load', function() {
    $('ul.term-list').each(function(){
        if( $(this).find('li').length > 3){
            $('li', this).eq(6).nextAll().hide().addClass('toggleable');
            $(this).append('<li class="more">More...</li>');
        }
        $(this).on('click','.more', toggleShow);
    });
    function toggleShow(){
        var opened = $(this).hasClass('less');
        $(this).text(opened ? 'More...' : 'Less...').toggleClass('less', !opened);
        $(this).siblings('li.toggleable').slideToggle();
    }
});
