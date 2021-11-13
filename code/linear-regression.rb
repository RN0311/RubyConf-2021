require 'csv'
require 'ruby_linear_regression'

x_data = []
y_data = []

CSV.foreach("sales-dataset.csv", :headers => true) do |row|
  x_data.push( [row[0].to_i, row[1].to_i] )
  y_data.push( row[2].to_i )
end


linear_regression_model = RubyLinearRegression.new

linear_regression_model.load_training_data(x_data, y_data)

linear_regression_model.train_gradient_descent(0.0004, 200, true)


test_dimensions = [1000, 2000]
predicted_price = linear_regression_model.predict(test_dimensions)
puts "\nTo buy a house of dimension 1000sq feet by 2000sq feet you need to pay: #{predicted_price.round} USD :)"