$(document).ready(function(event){

  //FAQ ACCORDION JQUERY

  $('.answer').hide();

  $('.question').on('click',function(event){
    var answer = $(this).next()
    answer.slideDown();
    $('.answer').not(answer).slideUp();

  });


  // IMAGE SLIDER ON INDEX PAGE

  //Set Options



  //Add initial active class
  $('.slide').first().addClass('active');

  //Hide all slides
  $('.slide').hide();

  //Show first slide
  $('.active').show();


  //Auto Slider Handler


  setInterval(nextSlide,7000);

  function nextSlide(){
    $('.active').removeClass('active').addClass('oldActive')

    if($('.oldActive').is(':last-child')){
      $('.slide').first().addClass('active');
      console.log('going back to the beginning...');
    } else {
      $('.oldActive').next().addClass('active');
      console.log('next slide!');
    };
    $('.oldActive').removeClass('oldActive');
    $('.slide').fadeOut(700);
    $('.active').fadeIn(700);
  }



});

