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
//= require activestorage
//= require turbolinks
//= require jquery
//= require_tree .

// Close Materialize Toast
function closeToast() {
  M.Toast.dismissAll();
}
  
// Notificaion via materialize toast
function notificationMsg(msg) {
  var toastHTML = '<span class="center center-align center-block">' + msg + '</span><button onclick="closeToast()" class="btn-flat toast-action close">X</button>'
  M.toast({html: toastHTML, classes: 'rounded'});
}

// Date entry validator
function dateEntryValidator(start, end) {
    const today = moment().format('ll')    
    return moment(start).isSameOrAfter(today) && moment(end).isSameOrAfter(today);
}

function onWithPrecondition(callback) {
    var isDone = false;

    return function(e) {
        if (isDone === true)
        {
            isDone = false;
            return;
        }

        e.preventDefault();

        callback.apply(this, arguments);

        isDone = true;
        $(this).trigger(e.type);
    }
}


$(document).ready(function(){
    // Initalize materialize date picker
    $('.datepicker').datepicker();

    // Handle search query parameters checking for validity
    $('#search__form').submit(function(e) {       
        var start_date = $('#search_start_date').val();
        var end_date = $('#search_end_date').val();
        
        if (dateEntryValidator(start_date, end_date)) {
            return true
        } else {
            e.preventDefault() 
            notificationMsg("You cannot pick dates that are already in the past");
        }
    })
});