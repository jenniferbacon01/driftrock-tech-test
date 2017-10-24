class UserStatsCalculator
  def find_user_id(email, users_data)
    users_data.each do |user|
      return user[:id] if user[:email] == email
    end
  end

  def calculate_total_spend(user_id, purchases_data)
    total_spend = 0
    purchases_data.each do |purchase|
      total_spend += purchase[:spend].to_f if purchase[:user_id] == user_id
    end
    total_spend
  end
end
