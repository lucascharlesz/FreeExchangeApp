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

//= require jquery
//= require jquery_ujs
//= require notifyjs
//= require sweetalert2


//Override the default confirm dialog by railsjQuery ->
$.rails.allowAction = function(link) {
    if (!link.attr('data-confirm'))
        return true 

    $.rails.showConfirmDialog(link);
    return
}

$.rails.confirmed = function(link) {
    setTimeout(function (){ 
        link.removeAttr('data-confirm')[0].click();
    }, 250);
    
    return
}

$.rails.showConfirmDialog = function(link) {
    message = link.attr('data-confirm');
    title = link.attr('data-title');
    type = link.attr('data-type');
    confirmation_button = link.attr('data-confirmation-button');
    cancel_button = link.attr('data-cancel-button');
    swal({
        title: title || 'Are you sure?',
        text: message,
        type: type,
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: confirmation_button || 'I am sure!',
        cancelButtonText: cancel_button || 'Nevermind',
        reverseButtons: true,
        // showLoaderOnConfirm: true,
        allowOutsideClick: false,        
        preConfirm: function () {
            return new Promise(function (resolve) {
                $.rails.confirmed(link);
                resolve();
            })
        }
    }).then(function () {        
        link.blur()
        return
    }, function () {
        link.blur()
        return
    });
}