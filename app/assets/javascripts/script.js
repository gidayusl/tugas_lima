$('.grid').masonry({
  itemSelector: '.grid-item',
});

/*
 function clear_image() {
 $("#show_article_image").hide();
 $("#input_article_image").show();
 }*/

$(document).ready(function() {
  $('#article_picture').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('.show_form_image').html(img);
    }
    reader.readAsDataURL(image);
  });
});

