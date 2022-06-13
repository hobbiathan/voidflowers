console.log("entropy.js is loaded")

var storedSeed = Math.floor(Math.random() * 2983742);

step();

seedDRand(storedSeed);
setupGrowingPlant(document.getElementById("plant div"), false);

var contact = "<br>@voidflowers<br><br><br>";

refresh();


function step() {
  seedDRand(storedSeed);
  setupGrowingPlant(document.getElementById("plant div"), true);
}


function end() {
  seedDRand(storedSeed);
  setupGrowingPlant(document.getElementById("plant div"), false);
}


function pick(array) {
  var index = dRandom() % array.length;
  //console.log("index = " + index);
return array[index];
}


// an integer from the low to the high value specified, includsive
function randomIntIn(low, high) {
  return low + Math.floor((high - low + 1) * Math.random());
}


// an integer from 0 to the high value, noninclusive
function randomInt(range) {
  return Math.floor(range * Math.random());
}
