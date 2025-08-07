// To be able to process multiple invoices, we'll need to have a factory function that we can use to create invoices. The requirements for this factory function are the following:

// It returns an invoice object, with phone and internet properties, and a total method.
// The default value for the phone service is 3000, and the internet service is 5500 (in cents, of course!).
// The function takes an object argument with attributes to override the default values.
// Your implemented function should be able to work with the code below:

function createInvoice(services = {}) {
  // implement the factory function here
  return {
    payments: [],
    phone: services.phone || 3000,
    internet: services.internet || 5500,

    total: function() {
      return this.phone + this.internet;
    },

    addPayment: function(payment) {
      this.payments.push(payment);
    },

    addPayments: function(payments) {
      //this.payments.push(...payments);
      payments.forEach(payment => this.addPayment(payment));
    },

    totalPayments: function() {
      return this.payments.reduce((total, payment) => total + payment.total(), 0)
    },

    amountDue: function() {
      return this.total() - this.totalPayments();
    }
  }
}

function invoiceTotal(invoices) {
  let total = 0;
  let i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

let invoices = [];
invoices.push(createInvoice()); // 8500 default
invoices.push(createInvoice({
  internet: 6500,
})); // 6500, 3000 = 9500

invoices.push(createInvoice({
  phone: 2000,
})); // 2000, 5500 = 7500

invoices.push(createInvoice({
  phone: 1000,
  internet: 4500,
})); // 5500

console.log(invoiceTotal(invoices));             // => 31000

// Now let's build a factory function to create payments. The function can take an object argument in one of 3 forms:

// Payment for one service, such as: {internet: 1000} or {phone: 1000}
// Payment for both services, such as: {internet: 2000, phone: 1000}.
// Payment with just an amount property, such as: {amount: 2000}.
// and should return an object that has paid services, and a total method that returns the payment total. If the amount property is not present, this should return the sum of phone and internet services; if the amount property is present, just return the value of that property.

function createPayment(services = {}) {
  // implement the factory function here
  let payment = {};

  if (services.amount) payment.amount = services.amount;
  payment.internet = services.internet || 0;
  payment.phone = services.phone || 0;

  payment.total = function() {
    return this.amount || this.internet + this.phone;
  }
  return payment;
}


function paymentTotal(payments) {
  let total = 0;
  let i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

let payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone: 2000,
}));

payments.push(createPayment({
  phone: 1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount: 10000,
}));


console.log(paymentTotal(payments));      // => 24000

// Update your createInvoice function to make it possible to add payment(s) to invoices. Use the code below as a guideline:

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

console.log(invoice.total())

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);

console.log(invoice.payments)
console.log(invoice.amountDue());       // this should return 0