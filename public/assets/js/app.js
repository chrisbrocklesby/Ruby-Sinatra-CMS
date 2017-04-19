/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function responsiveMenu() {
    var x = document.getElementsByTagName('nav')[0];
    if (x.className === "") {
        x.className += "responsive";
    } else {
        x.className = "";
    }
}



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