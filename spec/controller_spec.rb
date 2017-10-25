require 'controller'

describe Controller do
  let(:data_extractor) { double :data_extractor }
  let(:user_stats_calculator) { double :user_stats_calculator }
  let(:business_stats_calculator) { double :business_stats_calculator }
  subject(:controller) do
    described_class.new(data_extractor, user_stats_calculator, business_stats_calculator)
  end
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
      'user_id' => '12DF-2324-GA2D-31RT',
      'item' => 'Another item',
      'spend' => '10.00'
    }
  ]

  before do
    allow(data_extractor).to receive(:retrieve_users_data)
      .and_return(users_data)
    allow(data_extractor).to receive(:retrieve_purchases_data)
      .and_return(purchases_data)
  end

  it 'loads data from the api' do
    expect(data_extractor).to receive(:retrieve_users_data)
    expect(data_extractor).to receive(:retrieve_purchases_data)
    controller.load_data
  end

  it 'finds a users email from their id' do
    controller.load_data
    expect(controller.find_user_email('12DF-2324-GA2D-31RT'))
      .to eq 'drift.rock@email.com'
  end

  it 'finds a user ID from an email address' do
    controller.load_data
    expect(controller.find_user_id('drift.rock@email.com'))
      .to eq '12DF-2324-GA2D-31RT'
  end

  it 'calculates total spend for a customer' do
    allow(user_stats_calculator).to receive(:calculate_total_spend)
      .with('12DF-2324-GA2D-31RT', purchases_data)
    expect(user_stats_calculator).to receive(:calculate_total_spend)
      .with('12DF-2324-GA2D-31RT', purchases_data)
    controller.run(['total_spend', 'drift.rock@email.com'])
  end

  it 'calculates average_spend for a customer' do
    allow(user_stats_calculator).to receive(:calculate_average_spend)
      .with('12DF-2324-GA2D-31RT', purchases_data)
    expect(user_stats_calculator).to receive(:calculate_average_spend)
      .with('12DF-2324-GA2D-31RT', purchases_data)
    controller.run(['average_spend', 'drift.rock@email.com'])
  end

  it 'finds the most loyal customer' do
    allow(business_stats_calculator).to receive(:find_most_loyal_user_id)
      .with(purchases_data).and_return("12DF-2324-GA2D-31RT")
    expect(business_stats_calculator).to receive(:find_most_loyal_user_id)
      .with(purchases_data)
    controller.run(['most_loyal'])
  end

  it 'finds the most highest value customer' do
    allow(business_stats_calculator).to receive(:find_highest_value_user_id)
      .with(users_data, purchases_data).and_return("12DF-2324-GA2D-31RT")
    expect(business_stats_calculator).to receive(:find_highest_value_user_id)
      .with(users_data, purchases_data)
    controller.run(['highest_value'])
  end

  it 'finds the most sold item' do
    allow(business_stats_calculator).to receive(:find_most_sold_item)
      .with(purchases_data)
    expect(business_stats_calculator).to receive(:find_most_sold_item)
      .with(purchases_data)
    controller.run(['most_sold'])
  end
end
