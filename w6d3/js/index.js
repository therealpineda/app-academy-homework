console.log("Hello from the JavaScript console!");

// Your AJAX request here

console.log('Right before AJAX request');
$.ajax("http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b", {
  method: 'GET',
  success: (weather) => {
    console.log('Just got my response and am now handling...');
    $w = $(weather)[0].weather;
    $w.forEach((weather) => {
      console.log(weather);
    });
  }
});

// Add another console log here, outside your AJAX request
console.log("I'm outside and after the AJAX request.");
setTimeout( function() { console.log("Also after the request, on 1 sec timeout...");} , 1000);
