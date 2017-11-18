//= require jquery
//= require bootstrap-sprockets

//= require jquery_ujs
//= require_tree .

// One song
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

// All songs

$(document).ready(function() {
  $("a.delete_all_songs").bind('click', deleter_all_songs);
});

function deleter_all_songs() {
  var songs = $(".song");
  var songCount = songs.length;
  for (var i = 0; i < songCount; i++) {
    var song = songs[i];
    deleteSong( $(song).attr('id') );
  }
}

// Add song
