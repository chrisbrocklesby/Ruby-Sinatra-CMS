/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
    var x = document.getElementsByTagName('nav')[0];
    if (x.className === "") {
        x.className += "responsive";
    } else {
        x.className = "";
    }
}