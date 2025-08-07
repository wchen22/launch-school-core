# """
# # Spreadsheets
# ## Problem
# Implement a spreadsheet. The spreadsheet can be represented by a data type of your choosing, but it should be easy to get/update individual cells.
# Each cell in the spreadsheet can have one of the following:
# - A number such as 263 in B1 or 75 in B2
# - A formula linking other items in the spreadsheet such as "=C1*C2" in D2 or "=C1+C2" in D3
# In the language of your choosing, implement the following:
# - Define a "set cell" method or function that accepts a cell reference (ex: "A5", "B17") and a value (number or formula)
# - Define a "get cell" method or function that accepts a cell reference and returns the value of that cell
       
# Assumptions:

# - The spreadsheet will have up to 26 columns and 100 rows, with no initial values in any cell
# - All inputs are valid (no error checking needed on input, particularly formula structure)
# - We just want to handle basic arithmetic operations (+ * -/) between two cells with number values (ex: "=B1*B2" or "=A1+A2")
# - Cell values will be retrieved much more often than they will be set
# """



class Cell
  attr_accessor :value, :dependents

  def initialize(value = nil)
    @value = value
    @dependents = []
  end

  def set_value(new_value)
    @value = new_value
    notify_dependents
  end

  def add_dependent(cell)
    @dependents << cell
  end

  def notify_dependents
    @dependents.each(&:recalculate)
  end

  def recalculate
    if @value.is_a?(String) && @value.start_with?('=')
      # Assuming simple formulas for demonstration purposes
      @value = evaluate_formula(@value)
    end
  end

  private

  def evaluate_formula(formula)
    # Example formula evaluation (very basic)
    # Typically, you'd need a more robust parser and evaluator
    formula.gsub!('=', '')
    eval(formula) # Note: Using eval for demonstration; avoid in production due to security risks
  end
end

class Spreadsheet
  attr_accessor :cells, :n_rows, :n_columns

  def initialize(n_rows, n_columns)
    @cells = {}
    @n_rows = n_rows
    @n_columns = n_columns
  end

  def set_cell_value(cell_id, value)
    if valid_cell_id?(cell_id)
      cells[cell_id] ||= Cell.new
      cells[cell_id].set_value(value)
      update_dependencies(cell_id)
    else
      puts "Invalid cell reference"
    end
  end

  def get_cell_value(cell_id)
    if valid_cell_id?(cell_id) && cells.key?(cell_id)
      cells[cell_id].value
    else
      puts "Invalid cell reference"
      nil
    end
  end

  def print_spreadsheet
    (1..n_rows).each do |row|
      (1..n_columns).each do |col|
        cell_id = "#{(65 + row - 1).chr}#{col}"
        value = get_cell_value(cell_id) || ""
        print "#{value}\t"
      end
      print "\n"
    end
  end


  def valid_cell_id?(cell_id)
    row, col = cell_id.split('')
    row.between?('A', (65 + n_rows - 1).chr) && col.to_i.between?(1, n_columns)
  end

  def update_dependencies(cell_id)
    if cells[cell_id].value.is_a?(String) && cells[cell_id].value.start_with?('=')
      # Parse the formula and update dependencies
      formula = cells[cell_id].value.gsub('=', '')
      formula.scan(/[A-Z]\d+/).each do |reference|
        cells[reference] ||= Cell.new
        cells[reference].add_dependent(cells[cell_id])
      end
    end
  end
end

# Example Usage
spreadsheet = Spreadsheet.new(3, 3)
puts spreadsheet.valid_cell_id?('C3')
spreadsheet.set_cell_value('A1', 5)
# spreadsheet.print_spreadsheet
# spreadsheet.set_cell_value('B1', 10)
# spreadsheet.set_cell_value('C1', '=A1+B1')
# spreadsheet.set_cell_value('A1', 7) # C1 should automatically update
# spreadsheet.print_spreadsheet

# Cell
# @row = 'A'
# @column = 3
# @dependents = [A5, B10, B3]
# @value (can be number or formula)
# @evaluated_value 

# When a cell is initialized(reference, value)
  # row and column are parsed from reference
  # evaluated_value runs evaluate(value) and is assigned to the return

# evaluate(value) -> 
  # if number, return the number. 
  # if string, parse the cell references, the operation, and calculate.
    # for any cell references, cellID.add_dependent(self)

