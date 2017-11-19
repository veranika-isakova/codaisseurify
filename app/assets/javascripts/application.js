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

$(document).ready(function() {
  $("form").bind('submit', submitSong);
});

function submitSong(song) {
  event.preventDefault();
  createSong($("#song_name").val(), $("#album_name").val(), $("#release_date").val(), $("#song_artist_id").val());
  $("#song_name").val(null)
  $("#album_name").val(null)
  $("#release_date").val(null) ;
}

function createSong(song_name, album_name, release_date, artist_id) {

  var newSong = { song_name: song_name, album_name: album_name, release_date: release_date, artist_id: artist_id };

  $.ajax({
    type: "POST",
    url: "/api/songs.json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .fail(function(error) {
   console.log(error);
  })
  .done(function(data) {
    var song_info = {song_id: data.song.id, song_name: data.song.song_name, release_date: data.song.release_date, album_name: data.song.album_name, artist_id: data.song.artist_id };
    var message = data.message;
    var div = $('<div></div>')
    .attr('id', song_info.song_id)
    .attr('class', "song");
    var p_song_name = $('<p></p>')
    .html("Name of the song: " + song_info.song_name);
    var p_album_name = $('<p></p>')
    .html("Album: " + song_info.album_name);
    var p_release_date = $('<p></p>')
    .html("Released: " + song_info.release_date);
    var a = $('<a></a>')
    .attr('class', "btn btn-primary delete_song")
    .attr('role', "button")
    .attr('href', "#")
    .bind('click', deleter)
    .html("Delete song")
    var hr = $('<hr>')
    var div_all_songs = $("#songs_all");

    div.append(p_song_name);
    div.append(p_album_name);
    div.append(p_release_date);
    div.append(a)
    div.append(hr)
    div_all_songs.append(div);
  });
}
