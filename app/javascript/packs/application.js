window.Rails = require("@rails/ujs")

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick")
require("chart.js")
require("moment")

window.Noty = require("noty")
global.toastr = require("toastr")

import $ from 'jquery';
global.$ = jQuery;

import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

import 'assets/javascripts/sb-admin-2.min.js'
import 'assets/stylesheets/sb-admin-2.css'

import '@fortawesome/fontawesome-free/js/all'
import '@fortawesome/fontawesome-free/css/all.css'

Notification.requestPermission().then(function (result) {})

$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

jQuery(function($) {
    $("tr[data-link]").click(function() {
		// Same tab call :
          window.location = $(this).data('link');
        // New tab call: 
        //  window.open($(this).data('link'),"_Blank");
    });
});

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/service-worker.js', { scope: './' })
                         .then(function(registration) {
                           console.log('[Companion]', 'Service worker registered!')
                           console.log(registration)
                         })
}

