class BusinessStatsCalculator
  def find_most_sold_item(purchases_data)
    items = purchases_data.map { |purchase| purchase[:item] }
    items_by_freq = items.each_with_object(Hash.new(0)) { |item, freq| freq[item] += 1 }
    items.max_by { |freq| items_by_freq[freq] }
  end

  def find_most_loyal_user_id(purchases_data)
    users = purchases_data.map { |purchase| purchase[:user_id] }
    users_by_freq = users.each_with_object(Hash.new(0)) { |user, freq| freq[user] += 1 }
    users.max_by { |freq| users_by_freq[freq] }
  end
end
