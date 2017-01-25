console.log(1);
function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping1();
// logs 'in block'  x2
// because x is re-assigned in the if statement


console.log(2);
function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2();
// logs 'in block', then 'out of block'
// if statement logs first
// const in different scope
// when log is called afterward, the const
// hasn't changed within overall function scope

console.log(3);
function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    // var x = 'in block'; [ERROR]
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping3();
// raises an errors, saying x has already
// been identified

console.log(4);
function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4();
// logs both
// not reassigning x, but declaring a different
// x for each different scope


console.log(5);
function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  // let x = 'out of block again';  [ERROR]
  console.log(x);
}

mysteryScoping5();
// raise error since x was already declared
// in the scope of this function
// we could re-assign x, but we cannot re-declare it


// MAD LIB

function madLib(verb, adj, noun) {
  let v = verb.toUpperCase();
  let a = adj.toUpperCase();
  let n = noun.toUpperCase();
  str = ('We shall ' + v + ' the ' + a + ' ' + n);
  console.log(str);
}

madLib("go", "red", "barn");

// issubString

function isSubstring(searchString, subString) {
  let i = searchString.indexOf(subString);
  if (i > -1) {
    console.log(true);
  } else {
    console.log(false);
  }
}

isSubstring("time to program", "time");
isSubstring("time to program", "thyme");
