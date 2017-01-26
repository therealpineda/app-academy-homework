const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function likeTea() {
  reader.question("Ya like tea?\n", teaResponse);
}

function teaResponse(response) {
  console.log(`You said: ${response}`)
  teaRep = response
  reader.question("Ya like biscuit?\n", bisResponse);
}

function bisResponse(response) {
  console.log(`You said: ${response}`)
  console.log(`You replied: ${teaRep} to tea, and ${response} to biscuits...`);
}
likeTea();
