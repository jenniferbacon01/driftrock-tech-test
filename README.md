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
In your command line from the driftrock-tech-test directory:
````
  $ ruby app.rb total_spend example_customer@example.com
  $ ruby app.rb average_spend example_customer@example.com
  $ ruby app.rb most_loyal
  $ ruby app.rb highest_value
  $ ruby app.rb most_sold
````
How to Test
-----
Run all feature tests and unit tests (with coverage) in your command line by typing:
````
  $ rspec
````
Tests are available to view in driftrock-tech-test/spec directory.  
To run the linter in your command line:
````
  $ rubocop
````
What I Would Do With More Time
-----
My refactoring ideas that I haven't yet implemented are below...

Structure:

- Instead of having find_user_email and find_user_id in my Controller, these should be part of the StatsCalculators responsibilities, which would let me get rid of all the private classes at the bottom of my Controller. I really don't like these private methods as they stop my Controller being skinny!
- Potentially I need to split each user instruction into a class of it's own ie CustomerTotalSpendCalculator, MostLoyalCustomerCalculator etc.

Complexity:

- In BusinessStatsCalculator, find_most_sold_item and find_most_loyal_user_id are almost repeats, these can certainly use a common private method. I grouped these methods in one class because they do similar things but I haven't really reaped the benefits (yet).
- In UserStatsCalculator, calculate_total_spend and calculate_average_spend definitely use some of the same logic, I think there is a bit of repetition that can be avoided there too.
- In DataExtractor, retrieve_data also needs refactoring.
- In the Controller, the run method is too long - I couldn't think how to reduce this - suggestions would be appreciated!
- Not happy with my flog score!

Testing:

- The data_extractor_spec definitely needs some work! It should not actually query the api in my tests but didn't have time how to figure out how to stub this out properly.
- I could do with some spec_helpers here too.
- I don't want any of my puts to show when I'm running the tests but didn't have time to look at this.
