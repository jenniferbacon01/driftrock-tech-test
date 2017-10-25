class UserStatsCalculator
  def calculate_total_spend(user_id, purchases_data)
    total_spend = 0
    purchases_data.each do |purchase|
      total_spend += purchase['spend'].to_f if purchase['user_id'] == user_id
    end
    total_spend
  end

  def calculate_average_spend(user_id, purchases_data)
    total_spend = 0
    count = 0
    purchases_data.each do |purchase|
      if purchase['user_id'] == user_id
        total_spend += purchase['spend'].to_f
        count += 1
      end
    end
    total_spend / count
  end
end
