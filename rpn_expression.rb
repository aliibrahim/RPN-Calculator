class RPNExpression

  OPERATORS = ['+', '-', '*', '/'] # Operations allowed for calculating expressions.

  attr_reader :expression
  
  def initialize(expr='')
    @expression = clean_expression(expr)
  end

  def calculate
    begin
      items = []
      expression.split("").each do |item|
        if !OPERATORS.include?(item)
          raise InvalidExpression unless is_number?(item)
          items.push(item.to_f) #store the item as float for ensuring accuracy of expression.
        elsif items.size == 2
          a,b = items.pop(2)
          res = evaluate(a, b, item)
          items.push(res)
         else
          raise InvalidExpression
        end
      end
      items.pop.round(3) #last item on top of the array is the result of the expression.
    rescue => e
      puts "Not a valid expression!"
    end
  end

  private

  def clean_expression(expr)
    expr.gsub(/(\n)|(=)|( )/, '') #remove whitespaces, newline characters.
  end
  
  def is_number?(str)
    true if Float(str) rescue false
  end

  def evaluate(operand1, operand2, operator)
    case operator
    when '+'
      operand1 + operand2
    when '-'
      operand1 - operand2
    when '*'
      operand1 * operand2
    when '/'
      operand1 / operand2
    else
      raise InvalidExpression
    end
  end
end



## Testing Results
puts "Enter Expression (Press = to terminate expression):"
$/ = "=" # EOF character to terminate the expression.

expression = gets

puts "\n Expression Result:"
puts RPNExpression.new(expression).calculate
