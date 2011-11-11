// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  fetchLogMessages();
  setInterval(fetchLogMessages, 10000);
});

function fetchLogMessages() {
  key = $("#messages").data("stream-key");
  if(key) {
    $.get(this.location + '/messages?key=' + key, function(data) {
      $("#messages").append(data);
    });    
  }
}
