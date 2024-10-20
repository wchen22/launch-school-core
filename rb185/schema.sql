DROP TABLE IF EXISTS expenses;

CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(6,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL DEFAULT NOW()
  CHECK(amount > 0)
);

-- Add a check constraint to the expenses table to ensure that amount only holds a positive value.

ALTER TABLE expenses
ADD CONSTRAINT positive_expense_amount CHECK (amount > 0);

INSERT INTO expenses (amount, memo, created_on) VALUES 
  (14.56, 'Pencils', NOW()),
  (3.29, 'Coffee', NOW()),
  (49.99, 'Text Editor', NOW())
  ;
