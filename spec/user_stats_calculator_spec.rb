require 'user_stats_calculator'

describe UserStatsCalculator do
  subject(:user_stats_calculator) { described_class.new }

  purchases_data = [
    {
      'user_id' => '12DF-2324-GA2D-31RT',
      'item' => 'Some purchaseable item',
      'spend' => '19.99'
    },
    {
      'user_id' => '12DF-2324-GA2D-31RT',
      'item' => 'Another item',
      'spend' => '10.00'
    }
  ]

  it 'calculates a users total spend' do
    expect(user_stats_calculator
      .calculate_total_spend('12DF-2324-GA2D-31RT', purchases_data)).to eq 29.99
  end

  it 'calculates a users average spend' do
    expect(user_stats_calculator
      .calculate_average_spend('12DF-2324-GA2D-31RT', purchases_data))
      .to eq 14.995
  end
end
