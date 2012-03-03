// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  console.log("ready");
  generateWord();
  var browserType = getInternetExplorerVersion();
  if (browserType > -1) {
    alert("You're using an unsupported version of Internet Explorer. Please upgrade to a modern browser, such as Google Chrome or Safari.");
    $(".btn").click(refresh);
  } else {
    $(".btn").click(generateWord);
  }
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


function getInternetExplorerVersion()
// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
{
  var rv = -1; // Return value assumes failure.
  if (navigator.appName == 'Microsoft Internet Explorer')
  {
    var ua = navigator.userAgent;
    var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null)
      rv = parseFloat( RegExp.$1 );
  }
  return rv;
}
