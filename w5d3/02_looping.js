function fizzBuzz(array) {
  let arr = []
  array.forEach(function (num) {
    if (num % 3 === 0 || num % 5 === 0) {
      if (num % 3 === 0 && num % 5 === 0) {
      } else {
        arr.push(num);
      }
    }
  });
  return arr;
}

console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,12,15]));


function isPrime(number) {

 if (number <= 1) {
   return false;
 }

 if (number === 2) {
   return true;
 }

 for (i = 2; i < number; i++) {
   if (number % i === 0) {
     return false;
   }
 }

 return true;

}

console.log(isPrime(2));
console.log(isPrime(5));
console.log(isPrime(6));
console.log(isPrime(61));

function firstNPrimes(num) {
  if (num <= 0) {
    return [];
  }
  arr = []
  let i = 2
  do {
    if (isPrime(i)) {
      arr.push(i);
    }
    i += 1;
  } while (arr.length < num )
  return arr;
}

console.log(firstNPrimes(0));

function sumOfNPrimes(n) {
  primes = firstNPrimes(n);
  let count = 0;
  primes.forEach( function (num) {
    count += num;
  });
  return count;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(2));

function allOrNothing(mod, ...nums) {
  var nums = Array.prototype.slice.call(nums);
  nums.forEach( function (num) {
    if (num % mod !== 0) {
      return false;
    }
  });
  return true;
}

console.log(allOrNothing(3, 9, 12, 6));
console.log(allOrNothing(5, 1, 2, 10));
