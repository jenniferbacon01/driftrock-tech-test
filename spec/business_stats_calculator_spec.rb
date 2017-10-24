require 'business_stats_calculator'

describe BusinessStatsCalculator do
  subject(:business_stats_calculator) { described_class.new }

  purchases_data = [
    {
      "user_id": "12DF-2324-GA2D-31RT",
      "item": "Some purchaseable item",
      "spend": "19.99"
    },
    {
      "user_id": "12DF-2324-GA2D-31RT",
      "item": "Some purchaseable item",
      "spend": "19.99"
    },
    {
      "user_id": "12DF-2324-GA2D-31RT",
      "item": "Another item",
      "spend": "10.00"
    }
  ]

  it 'finds the most sold item' do
    expect(business_stats_calculator.find_most_sold_item(purchases_data)).to eq "Some purchaseable item"
  end

end
