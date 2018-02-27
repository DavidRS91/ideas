// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require_tree .

// A $( document ).ready() block.
$( document ).ready(function() {
    console.log( "ready!" );
    let plus = document.querySelectorAll('.plus')
    let minus = document.querySelectorAll('.minus')

    plus.forEach(node=> {
      node.addEventListener('click',event => {
        const {currentTarget} = event;
        console.log(currentTarget);
        currentTarget.parentElement.parentElement.lastElementChild.lastElementChild.style.display = "block"
        currentTarget.style.display = "none"
        currentTarget.parentElement.lastElementChild.style.display = "block"

      });
    });

    minus.forEach(node=> {
      node.addEventListener('click',event => {
        const {currentTarget} = event;
        console.log(currentTarget);
        currentTarget.parentElement.parentElement.lastElementChild.lastElementChild.style.display = "none"
        currentTarget.style.display = "none"
        currentTarget.parentElement.firstElementChild.style.display = "block"
      });
    });
});
