function titleize(names, callback) {
  let titled = names.map(function (name) {
    return("Mx. " + name + " Jingleheimer Schmidt");
  });
  callback(titled);
};

function printCallback(array) {
  array.forEach( function (el) {
    console.log(el);
  });
};

titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;

}

Elephant.prototype.trumpet = function () {
  console.log(this.name + ' the elephant goes PHRRR!');
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);

ellie.trumpet();

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  console.log(this.name + ' plays');
};

console.log(ellie.height);
ellie.grow();
console.log(ellie.height);

console.log(ellie.tricks);
ellie.addTrick("sneezing");
console.log(ellie.tricks);

ellie.play();


let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];


function paradeHelper(elephant) {
  console.log(elephant + ' is trotting by...');
}

paradeHelper(micah.name);

herd.forEach( function (elephant) {
  paradeHelper(elephant.name);
})



function dinerBreakfast() {
  
}
