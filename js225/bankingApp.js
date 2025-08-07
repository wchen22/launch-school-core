function makeAccount(number) {
  let balance = 0;
  let transactions = [];
  return {
    balance() {
      return balance;
    },

    number() {
      return number;
    },

    transactions() {
      return transactions;
    },

    deposit(amount) {
      balance += amount;
      transactions.push({type: "deposit", amount: amount});
      return amount;
    },

    withdraw(amount) {
      if (amount > balance) amount = balance;
      balance -= amount;
      transactions.push({type: "withdrawal", amount: amount});
      return amount;
    }
  }
};

function makeBank() {
  let accounts = [];
  return {
    nextNumber: 101,

    openAccount() {
      let newAccount = makeAccount(this.nextNumber);
      this.nextNumber += 1;
      accounts.push(newAccount);
      return newAccount;
    },

    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    }
  };
}

let bank = makeBank();
let account = bank.openAccount();
console.log(account.balance());
// 0
console.log(account.deposit(17));
// 17
let secondAccount = bank.openAccount();
console.log(secondAccount.number());
// 102
console.log(account.transactions());
console.log(bank.accounts);

// [{...}]
// let source = bank.openAccount();
// console.log(source.deposit(10));
// // 10
// let destination = bank.openAccount();
// console.log(bank.transfer(source, destination, 7));
// // 7
// console.log(source.balance);
// // 3
// console.log(destination.balance);

// let bank = makeBank();

// let account = bank.openAccount();
// let secondAccount = bank.openAccount();

// console.log(account.number);
// console.log(bank.accounts);
// console.log(bank.accounts[0]);
// console.log(secondAccount.number);

// let account = makeAccount();
// let otherAccount = makeAccount();

// console.log(account.deposit(12));
// console.log(account.deposit(10));
// console.log(account.balance);
// console.log(account.withdraw(5));
// console.log(account.balance);
// console.log(account.withdraw(30));
// console.log(account.balance);
// console.log(account.transactions);

// console.log(otherAccount.balance);
