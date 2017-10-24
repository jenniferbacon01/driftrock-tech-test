# Driftrock Tech Test

This command line application allows users to query Driftrock's JSON API for a client's customer and purchases data.
The application can be used to find out and print the following information in the terminal:

- The total spend for a specific customer
- The average spend for a specific customer
- The customer with the highest number of purchases (most loyal)
- The customer with the highest value of purchases
- The item which has the highest number of purchases (most sold)

How to Install
-----
In your command line type the following:
To clone this repository:
````
  $ git clone https://github.com/jenniferbacon01/driftrock-tech-test
````
To install all the relevant gems:
````
  $ bundle install
````

How to Run
-----
In your command line
````
  $ ruby app.rb total_spend example_customer@example.com
  $ ruby app.rb average_spend example_customer@example.com
  $ ruby app.rb most_loyal
  $ ruby app.rb highest_value
  $ ruby app.rb most_sold
````
How to Test
-----
Run all feature tests and unit tests in your command line by typing:
````
  $ rspec
````
Tests are available to view in driftrock-tech-test/spec directory.  
