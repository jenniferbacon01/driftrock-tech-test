require 'user_stats_calculator'

describe UserStatsCalculator do
  subject(:user_stats_calculator) { described_class.new }
  users_data = [
    {
      "id": "12DF-2324-GA2D-31RT",
      "first_name": "Drift",
      "last_name": "Rock",
      "phone": "0-000-000-0000",
      "email": "drift.rock@email.com"
    },
    {
      "id": "1111-1111-1111-1111",
      "first_name": "Example",
      "last_name": "Exampleson",
      "phone": "0-000-000-0000",
      "email": "example@email.com"
    }
  ]

  purchases_data = [
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

  it 'finds a user ID from an email address' do
    expect(user_stats_calculator.find_user_id("drift.rock@email.com", users_data)).to eq "12DF-2324-GA2D-31RT"
  end

  it 'calculates a users total spend' do
    expect(user_stats_calculator.calculate_total_spend("12DF-2324-GA2D-31RT", purchases_data)).to eq 29.99
  end

  it 'calculates a users average spend' do
    expect(user_stats_calculator.calculate_average_spend("12DF-2324-GA2D-31RT", purchases_data)).to eq 14.995
  end



end
