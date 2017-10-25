require_relative 'data_extractor'
require_relative 'user_stats_calculator'
require_relative 'business_stats_calculator'

class Controller
  def initialize(data_extractor = DataExtractor.new, user_stats_calculator = UserStatsCalculator.new, business_stats_calculator = BusinessStatsCalculator.new)
    @data_extractor = data_extractor
    @user_stats_calculator = user_stats_calculator
    @business_stats_calculator = business_stats_calculator
  end

  def load_data
    @users_data = @data_extractor.retrieve_users_data
    @purchases_data = @data_extractor.retrieve_purchases_data
  end

  def run(arguments)
    load_data
    instruction = arguments[0]
    case instruction
    when 'total_spend'
      calculate_total_spend(arguments[1])
    when 'average_spend'
      calculate_average_spend(arguments[1])
    when 'most_loyal'
      calculate_most_loyal_customer
    when 'highest_value'
      calculate_highest_value_customer
    when 'most_sold'
      calculate_most_sold_item
    else
      puts 'You must enter a correct argument!'
    end
  end

  def find_user_email(user_id)
    @users_data.each do |user|
      return user['email'] if user['id'] == user_id
    end
  end

  def find_user_id(email)
    @users_data.each do |user|
      return user['id'] if user['email'] == email
    end
  end

  private

  def calculate_total_spend(user_email)
    user_id = find_user_id(user_email)
    puts @user_stats_calculator
      .calculate_total_spend(user_id, @purchases_data)
  end

  def calculate_average_spend(user_email)
    user_id = find_user_id(user_email)
    puts @user_stats_calculator
      .calculate_average_spend(user_id, @purchases_data)
  end

  def calculate_most_loyal_customer
    user_id = @business_stats_calculator
              .find_most_loyal_user_id(@purchases_data)
    puts find_user_email(user_id)
  end

  def calculate_highest_value_customer
    user_id = @business_stats_calculator
              .find_highest_value_user_id(@users_data, @purchases_data)
    puts find_user_email(user_id)
  end

  def calculate_most_sold_item
    puts @business_stats_calculator.find_most_sold_item(@purchases_data)
  end
end
