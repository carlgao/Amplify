// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  console.log("ready");
  /*generateWord();*/
  /*var browserType = getInternetExplorerVersion();*/
  /*if (browserType > -1) {*/
  /*alert("You're using an unsupported version of Internet Explorer. Please upgrade to a modern browser, such as Google Chrome or Safari.");*/
  /*$(".btn").click(refresh);*/
  /*} else {*/
  /*$(".btn").click(generateWord);*/
  /*}*/
  $.ajax({
    url: "http://developer.echonest.com/api/v4/song/search?api_key=U2IMNUKBKK0RPHBJY&format=json&results=1&artist=pitbull",
    type: "GET",
    dataType: "json"
  })
  .success(function(response) {
    console.log(response);
  })
  ;

  $("#song-input").click(function() {
    var newSong = $.create("audio");
    var songSource = $.create("source");
    $("#songs").prepend(newSong);
  });
   

  $("#request-btn").click(function() {
    alert("request");
    requestText = $("#request-input").val();
    $.ajax({
      url: "/songs/post_request",
      type: "POST",
      data: {name : requestText},
      dataType: "text"
    })
    .success(function(response) {
      alert("success");
      console.log(response);
    })
    .fail(function(response) {
      alert("fail")
      console.log(response);
    })
    ;
  });


  $(".upvote-btn").click(function() {
    songId = $(this).attr('id');
    console.log("Clicked song " + songId);
    $.ajax({
      url: "/songs/vote",
      type: "POST",
      data: {song_id : songId, direction : 'up'},
      dataType: "text"
    })
    .success(function(response) {
      alert("success");
      console.log(response);
      location.reload();
    })
    .fail(function(response) {
      alert("fail")
      console.log(response);
    })
    ;
  });

  $(".downvote-btn").click(function() {
    songId = $(this).attr('id');
    console.log("Clicked song " + songId);
    $.ajax({
      url: "/songs/vote",
      type: "POST",
      data: {song_id : songId, direction : 'down'},
      dataType: "text"
    })
    .success(function(response) {
      alert("success");
      console.log(response);
      location.reload();
    })
    .fail(function(response) {
      alert("fail")
      console.log(response);
    })
    ;
  });

});

function generateWord(){
  $.ajax({
    url: "http://linword.heroku.com/pages/get_word",
    type: "GET",
    dataType: "html"
  })
  .done(function(response) {
    /*for word in response {*/
      $("#word").html('L' + response + "!!");
      /*}*/
  })
  ;
}


/*function getInternetExplorerVersion()*/
/*// Returns the version of Internet Explorer or a -1*/
/*// (indicating the use of another browser).*/
/*{*/
/*var rv = -1; // Return value assumes failure.*/
/*if (navigator.appName == 'Microsoft Internet Explorer')*/
/*{*/
/*var ua = navigator.userAgent;*/
/*var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");*/
/*if (re.exec(ua) != null)*/
/*rv = parseFloat( RegExp.$1 );*/
/*}*/
/*return rv;*/
/*}*/
