$('.bordered tr').mouseover(function(){
    $(this).addClass('highlight');
}).mouseout(function(){
    $(this).removeClass('highlight');
});
jQuery(function ($) {

      $('#about_us').clearlick(function (e) {
      $('#about_us_popup').modal();
       return false;
                               });
                               $('#sign_up').click(function (e) {
                              $('#sign_up_popup').modal();
                                return false;
                                });
});
