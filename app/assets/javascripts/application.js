// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require my
// = require jquery
// = require jquery_ujs
// = require turbolinks
// = require_tree .

// var i = 0;
// function change() {
//   var doc = document.getElementById("box_1");
//   var color = ["#3c7fea", "#39af24", "#eef90e", "#e02121"];
//   doc.style.backgroundColor = color[i];
//   i = (i + 1) % color.length;
// }
// setInterval(change, 1000);

// jquary is working but this isnt
// $(document).ready(function(){
//   $("#box_1").hover(function(){
//     $(this).css("background-color", "#43bce8");
//   });
// });
// #f2b0dd = pink #43bce8 = blue
$(document).ready(function(){
    $(".box_1").hover(function(){
        $(this).css("background-color","#f2b0dd");
        }, function(){
        $(this).css("background-color", "#43bce8");
    });
});

// $(document).ready(function(){
//   $(".box_1").hover(function(){
//     $(".box_1").css(".animation-target")
//   });
// });
 // $(document).ready(function(){
 //  $(".box_1").hover(function(){
 //    $(this).css(-webkit-animation: animation 1000ms linear both;
 //    animation: animation 1000ms linear both;);
 //  })
 // });
