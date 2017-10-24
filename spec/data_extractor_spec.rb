require 'data_extractor'

describe DataExtractor do
  subject(:data_extractor) { described_class.new }

  it 'gets user data from the API' do
    expect(data_extractor.retrieve_users_data).not_to eq nil
  end

  it 'gets purchase data from the API' do
    expect(data_extractor.retrieve_purchases_data).not_to eq nil
  end
end
