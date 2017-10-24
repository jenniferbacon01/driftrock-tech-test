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
    instruction = arguments[0]
    case instruction
    when 'total_spend'
      load_data
      user_id = @user_stats_calculator.find_user_id(arguments[1], @users_data)
      p @user_stats_calculator.calculate_total_spend(user_id, @purchases_data)
    when 'average_spend'
      load_data
      user_id = @user_stats_calculator.find_user_id(arguments[1], @users_data)
      p @user_stats_calculator.calculate_average_spend(user_id, @purchases_data)
    when 'most_loyal'
      load_data
      user_id = @business_stats_calculator.find_most_loyal_user_id(@purchases_data)
      p @business_stats_calculator.find_user_email(user_id, @users_data)
    when 'highest_value'
      load_data
      user_id = @business_stats_calculator.find_highest_value_user_id(@users_data, @purchases_data)
      p @business_stats_calculator.find_user_email(user_id, @users_data)
    when 'most_sold'
      load_data
      p @business_stats_calculator.find_most_sold_item(@purchases_data)
    else
      puts 'You must enter a correct argument!'
    end
  end
end
