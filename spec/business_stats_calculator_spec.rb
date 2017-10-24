require 'business_stats_calculator'

describe BusinessStatsCalculator do
  subject(:business_stats_calculator) { described_class.new }
  users_data = [
    {
      'id' => '12DF-2324-GA2D-31RT',
      'first_name' => 'Drift',
      'last_name' => 'Rock',
      'phone' => '0-000-000-0000',
      'email' => 'drift.rock@email.com'
    },
    {
      'id' => '1111-1111-1111-1111',
      'first_name' => 'Example',
      'last_name' => 'Exampleson',
      'phone' => '0-000-000-0000',
      'email' => 'example@email.com'
    }
  ]

  purchases_data = [
    {
      'user_id' => '12DF-2324-GA2D-31RT',
      'item' => 'Some purchaseable item',
      'spend' => '19.99'
    },
    {
      'user_id' => '1111-1111-1111-1111',
      'item' => 'Some purchaseable item',
      'spend' => '19.99'
    },
    {
      'user_id' => '12DF-2324-GA2D-31RT',
      'item' => 'Another item',
      'spend' => '10.00'
    }
  ]

  it 'finds the most sold item' do
    expect(business_stats_calculator.find_most_sold_item(purchases_data)).to eq 'Some purchaseable item'
  end

  it 'finds the most loyal customer' do
    expect(business_stats_calculator.find_most_loyal_user_id(purchases_data)).to eq '12DF-2324-GA2D-31RT'
  end

  it 'finds the highest value customer' do
    expect(business_stats_calculator.find_highest_value_user_id(users_data, purchases_data)).to eq '12DF-2324-GA2D-31RT'
  end

  it 'finds a users email from their id' do
    expect(business_stats_calculator.find_user_email('12DF-2324-GA2D-31RT', users_data)).to eq 'drift.rock@email.com'
  end
end
