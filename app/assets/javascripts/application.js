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

//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require notifyjs
//= require sweetalert2


//Override the default confirm dialog by railsjQuery ->
$.rails.allowAction = function(link) {
    if (!link.attr('data-confirm'))
        return true 

    $.rails.showConfirmDialog(link)
    return false
}

$.rails.confirmed = function(link) {
    link.removeAttr('data-confirm')
    link.trigger('click')
}

$.rails.showConfirmDialog = function(link) {
    message = link.attr('data-confirm')
    swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then(function () {
        $.rails.confirmed(link)
        return
    });
}