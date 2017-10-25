class BusinessStatsCalculator
  def initialize(user_stats_calculator = UserStatsCalculator.new)
    @user_stats_calculator = user_stats_calculator
  end

  def find_most_sold_item(purchases_data)
    items = purchases_data.map { |purchase| purchase['item'] }
    items_by_freq = items.each_with_object(Hash.new(0)) do |item, freq|
      freq[item] += 1
    end
    items.max_by { |freq| items_by_freq[freq] }
  end

  def find_most_loyal_user_id(purchases_data)
    user_ids = purchases_data.map { |purchase| purchase['user_id'] }
    user_ids_by_freq = user_ids.each_with_object(Hash.new(0)) do |user_id, freq|
      freq[user_id] += 1
    end
    user_ids.max_by { |freq| user_ids_by_freq[freq] }
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
end
