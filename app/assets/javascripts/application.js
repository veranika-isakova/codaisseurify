//= require jquery
//= require bootstrap-sprockets

//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
  $("a.delete_song").bind('click', deleter);
});

function deleter() {
  var delete_song = this;
  var songId = $(delete_song).parent().attr('id');
  deleteSong(songId);
}

function deleteSong(songId) {
  $.ajax({
    type: "DELETE",
    url: "/api/songs/" + songId,
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    $('div#'+songId).remove();
  });
}
