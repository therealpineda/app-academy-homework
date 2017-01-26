function hammerTime(time) {
  window.setTimeout( function() {
    alert(`${time} is hammertime!`);
  }, 3000);
}

hammerTime('8');
