class UserStatsCalculator
  def find_user_id(email, users_data)
    users_data.each do |user|
      return user[:id] if user[:email] == email
    end
  end
end
