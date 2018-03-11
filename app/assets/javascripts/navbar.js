$(function() {
  // Collapse Navbar
  var navbarCollapse = function() {
    var navBar = $('nav');
    if (navBar.offset().top > 100) {
      navBar.addClass("navbar-scrolled");
    } else {
      navBar.removeClass("navbar-scrolled");
    }
  };
  // Collapse now if page is not at top
  navbarCollapse();
  // Collapse the navbar when page is scrolled
  $(window).scroll(navbarCollapse);
});
