$(document).ready(function(event){



  $('.answer').hide();

  $('.question').on('click',function(event){
    var answer = $(this).next()
    answer.slideDown();
    $('.answer').not(answer).slideUp();

  });

});