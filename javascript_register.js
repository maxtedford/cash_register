const coins = {
  25: "quarter",
  10: "dime",
  5: "nickel",
  1: "penny"
};

function Register(price, pmt) {
  this.change = [];
  this.difference = pmt - price;
};

Register.prototype.calculateChange = function() {
  console.log(Object.keys(coins).sort().reverse());
  while(this.difference >= 0) {
    console.log(coins);
    for(var amt in coins) {
      if(this.difference - amt >= 0) {
        this.change.push(coins[amt]);
        this.difference -= amt;
      }
    };
  }
  return this.change
};

var register = new Register(936, 1000);
console.log(register.calculateChange());
