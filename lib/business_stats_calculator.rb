class BusinessStatsCalculator
  def initialize(user_stats_calculator = UserStatsCalculator.new)
    @user_stats_calculator = user_stats_calculator
  end

  def find_most_sold_item(purchases_data)
    find_most_freq(purchases_data, 'item')
  end

  def find_most_loyal_user_id(purchases_data)
    find_most_freq(purchases_data, 'user_id')
  end

  def find_highest_value_user_id(users_data, purchases_data)
    highest_total_spend = 0
    highest_value_user_id = ''
    user_ids = users_data.map { |user| user['id'] }
    user_ids.each do |user_id|
      next unless @user_stats_calculator.calculate_total_spend(user_id, purchases_data) > highest_total_spend
      highest_value_user_id = user_id
      highest_total_spend = @user_stats_calculator
                            .calculate_total_spend(user_id, purchases_data)
    end
    highest_value_user_id
  end


  private

  def find_most_freq(purchases_data, selected_category)
    categories = purchases_data.map { |purchase| purchase[selected_category] }
    categories_by_freq = categories.each_with_object(Hash.new(0)) do |category, freq|
      freq[category] += 1
    end
    categories.max_by { |freq| categories_by_freq[freq] }
  end
end
