$(document).ready(function() {
  $('#api_test_form').submit(function() {
    url = $('#api_test_form').attr('action') + "?" + $('#api_test_form').serialize();
    // the form will send id as a parameter, but the better form is to put it in the path
    // i.e. this turns /api/pages?id=1234&images=1 into /api/pages/1234?images=1
    // url = url.replace(/\?id=(.*?)(\&|$)/, "/$1?");
    url = url.replace(/\?(.*)format=(xml|json)$/, ".$2?$1");
    url = url.replace(/(\?|\&){1,2}$/, "");
    // alert(url);
    // var index = url.split("?", 2).join("?").length;
    // url = url.substr(0, index) + "&"+ url.substr(index + 1);
    url = url.replace("?locale=en","");
    // fetch the result of the form and send the results to a simple API to be displayed via jQuery
    // should be more safe then sending a URL to the API so people don't fake URLs for us to fetch
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'text',
      beforeSend: function(xhr) {
        $('#api_test_url').fadeTo(100, 0.3);
        $('#api_test_result').fadeTo(100, 0.3);
      },
      error: function(xhr, stat, err) { 
      	$('#api_test_result').html('Sorry, there was an error: '+stat); 
      },
      complete: function() {
        $('#api_test_result').fadeTo(100, 1);
      },
      success: function(data) {
      	
        $('#api_test_url').html("<strong>URL:</strong> " + url);
        $('#api_test_url').fadeTo(100, 1);
        $('#api_test_result').html(data);
      }
    });
    return(false);
  });
});
