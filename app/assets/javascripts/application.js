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
//= require rails-ujs
//= require turbolinks
//= require_tree .


// function log(){
//   var form = $('.ajax');
//   form.on('submit', function(formSubmissionEvent){
//     formSubmissionEvent.preventDefault();
//     console.log("prevented default action!")

//     var form = $(formSubmissionEvent.currentTarget)

//     $.ajax({
//       url: form.attr('action'),
//       method: form.attr('method'),
//       data: form.serialize(),
//       dataType: 'JSON'
//       success: function(response){
//         if (response) {
//           form.append(
//             "<button>"+ response + "</button>");
//           }
//          }
//       })
//     })
// };




function log(){
  var btn = $('#ajax');
  btn.click(function(){
    $("#ajax").append("hehe");
  });
};

document.addEventListener("DOMContentLoaded", log);


