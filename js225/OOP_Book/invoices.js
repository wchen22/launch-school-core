let invoices = {
  unpaid: [],
  paid: [],

  add(name, amount) {
    this.unpaid.push({name, amount});
  },

  payInvoice(name) {
    let newUnpaid = [];
    this.unpaid.forEach(invoice => {
      if (name === invoice.name) {
        this.paid.push(invoice);
      } else newUnpaid.push(invoice);
    });

    this.unpaid = newUnpaid;
  },

  totalDue() {
    return this.unpaid.reduce((sum, invoice) => sum + invoice.amount, 0);
  },

  totalPaid() {
    let total = 0;
    for (let i = 0; i < this.paid.length; i += 1) {
      total += this.paid[i].amount;
    }
    return total;
  }
};

invoices.add('Starbucks', 300);
console.log(invoices);
console.log(invoices.totalDue());

invoices.add('Due North', 250);
invoices.add('Moonbeam', 187.50);
invoices.add('Slough', 300);

console.log(invoices.totalDue());

invoices.payInvoice('Starbucks');
console.log(invoices.totalDue());
console.log(invoices.paid);
console.log(invoices.totalPaid());

invoices.payInvoice('Due North');
invoices.payInvoice('Slough');

console.log(invoices.totalDue());
console.log(invoices.totalPaid());
