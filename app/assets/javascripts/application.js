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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require tinymce
//= require moment
//= require bootstrap-datepicker
//= require serviceworker-companion
//= require_tree .

if ('serviceWorker' in navigator) {
  console.log('Service Worker is supported');
  navigator.serviceWorker.register('/serviceworker.js')
    .then(function(registration) {
      console.log('Successfully registered!', ':^)', registration);
      registration.pushManager.subscribe({ userVisibleOnly: true })
        .then(function(subscription) {
            console.log('endpoint:', subscription.endpoint);
        });
  }).catch(function(error) {
    console.log('Registration failed', ':^(', error);
  });
  navigator.serviceWorker.ready.then(function(reg) {
    reg.pushManager.subscribe({ userVisibleOnly: true })
      .then(function(subscription) {
        $.post("/subscribe", { subscription: subscription.toJSON() });
      });
  });
}

if (!('PushManager' in window)) {
   console.log('Push messaging isn\'t supported.');
 }

if (Notification.permission === 'denied') {
  console.log('The user has blocked notifications.');
}


$(".webpush-button").on("click", (e) => {
  navigator.serviceWorker.ready
  .then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager.getSubscription()
    .then((subscription) => {
      $.post("/push", { subscription: subscription.toJSON(), message: "You clicked a button!" });
    });
  });

reg.pushManager.subscribe({ userVisibleOnly: true })
  .then(function(subscription) {
    $.post("/subscribe", { subscription: subscription.toJSON() });
  });
});



//= require serviceworker-companion
