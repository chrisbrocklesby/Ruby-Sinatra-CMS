/////// Responsive Mobile Menu Toggle ///////
function responsiveMenu() {
    var x = document.getElementsByTagName('nav')[0];
    if (x.className === "") {
        x.className += "responsive";
    } else {
        x.className = "";
    }
}

/////// Load Custom Typing Logo onload of site ///////
document.addEventListener('DOMContentLoaded', function(){
      Typed.new('.element', {
        strings: ["Apple Developer", "Joe Blogs"],
        typeSpeed: 100,
        loop: true,
        cursorChar: " _",
        startDelay: 2900,
        backDelay: 2900,
      });
  });
