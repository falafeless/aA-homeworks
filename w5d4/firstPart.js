const madLib = (verb, adjective, noun) => {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`
}

const isSubstring = (searchString, subString) => {
  return searchString.includes(subString);
}

const fizzBuzz = (array) => {
  let fizzBuzzArray = [];
  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArray.push(el);
    }
  });
  return fizzBuzzArray;
}

const isPrime = (n) => {
  if (n < 2) return false;
  for (let i = 2; i < n; i++) {
    if (n % i === 0) return false;
  }
  return true;
};

const sumOfNPrimes = (n) => {
  let sum = 0;
  let counter = 0;
  let i = 2;

  while (counter < n) {
    if (isPrime(i)) {
      sum += i;
      counter++;
    }
    i++;
  }
  return sum;
};
