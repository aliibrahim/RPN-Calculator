require_relative '../rpn_expression.rb'
require_relative '../romanize.rb'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.color = true
end