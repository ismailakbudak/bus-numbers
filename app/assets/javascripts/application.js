// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function(){
    
    // <span class="img-loader hide"></span> 
    $( ".btn" ).on('click',function(){
           var id = $( this ).find(".img-loader");
           id.removeClass("hide"); 
    });

    $( ".capitalize" ).on('keyup',function(){
            var text = $( this ).val();
            if(  strcmp(  text.charAt(0), " " ) == 0 )    
                text = jQuery.trim( text );
            $( this ).val( text.charAt(0).toUpperCase() + text.slice(1) );
    });
    
    function strcmp ( str1, str2 ) {
                str1 = jQuery.trim(str1); 
                str2 = jQuery.trim(str2);
                return ( ( str1 == str2 ) ? 0 : ( ( str1 > str2 ) ? 1 : -1 ) );
    }

});

 
 
 