$(function() {
    $('.reviews').hide();
    $('.show-reviews').click(function() {
    $(this).next('.reviews').toggle('slow');
    $(this).text(function(index, text) {
      return text === 'Show reviews' ? 'Hide Reviews' : 'Show reviews'
    });
  });
});