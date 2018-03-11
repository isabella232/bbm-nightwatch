$(function () {
  $('body.landing-page').scrollspy({target: '#navbar', offset: 50})

  $('a[href^="#"]').click(function(event){
    event.preventDefault();
    var anchor = $(this).attr('href');
    document.querySelector(anchor).scrollIntoView({ block: 'start', behavior: 'smooth' });
  });
});
