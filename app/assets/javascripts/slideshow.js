/**
* J1 Rehoboth Slideshow JS
*/
// Cycle2 Slideshow settings
$.fn.cycle.defaults.autoSelector = '.slides'; // Selector for wrapper around slides
$.fn.cycle.defaults.slides = '.slide';
$.fn.cycle.defaults.easing = 'easeInOutQuad';
$.fn.cycle.defaults.speed = 1000;
$.fn.cycle.defaults.pauseOnHover = true;
$.fn.cycle.defaults.timeout = 1500;
$.fn.cycle.defaults.fx = 'carousel';
$.fn.cycle.defaults.startingSlide = 3;

window.Slideshow = function() {

  this.initialize();
};

Slideshow.prototype = {

initialize: function() {
  var $slides = $('.slides');
  $('.slides').css('overflow', 'visible'); // Make sure when images are hovered over they don't get cut off by overflow: hidden
  this.preloadImages($slides);
},

/**
 * Preload all slide images and add a 'show' class to the passed in element
 * once they've all loaded
 * @param  {object} $slides jQuery element
 * @return {void}
 */
preloadImages: function($slides) {
  var $images = $slides.find('img');
  var loaded = 0;

  function onImageLoaded() {
    loaded++;
    if (loaded >= $images.length) {
      $slides.addClass('show');
    }
  };

  $images.each(function(index, el) {
    var img = new Image();
    img.onload = onImageLoaded;
    img.src = $(el).attr('src');
  });
}
};
