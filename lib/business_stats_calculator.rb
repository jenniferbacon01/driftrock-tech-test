class BusinessStatsCalculator
  def find_most_sold_item(purchases_data)
    items = purchases_data.map { |purchase| purchase[:item] }
    items_by_freq = items.each_with_object(Hash.new(0)) { |freq, item| item[freq] += 1; }
    items.max_by { |freq| items_by_freq[freq] }
  end
end
