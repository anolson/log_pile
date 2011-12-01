// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var intervalId;

$(document).ready(function() {
  fetchLogMessages();
  appendLogMessages();
  
  $("#append-log-messages").click(function() {
    appendLogMessages();
  });
});

function fetchLogMessages() {
  path = $("#messages").data("poller-location");
  if(path) {
    $("#loader").show();
    $.get(path, function(data) { 
      $("#messages").append(data);
    });
    $("#loader").hide();
    scrollLogMessages();
  }
}

function appendLogMessages() {
  if($("#append-log-messages").is(":checked")) {
    intervalId = setInterval(fetchLogMessages, 10000);    
  }
  else {
    clearInterval(intervalId);
  }
}

function scrollLogMessages() {
  // Don't if we have scrolled earlier in the log messages.
  if($(window).scrollTop() + $(window).height() ==  $(document).height()) {
    $("body").animate({ 
      scrollTop: $(document).height() 
    }, 1000);      
  }
}