require 'data_extractor'

describe DataExtractor do
  subject(:data_extractor) { described_class.new }
  let(:HTTParty) { double }
  let(:api_data) { double :api_data, :parsed_response => { 'data' => ["hello"]}}
  let(:api_data_2) { double :api_data_2, :parsed_response => { 'data' => []}}

  # it 'gets user data from the API' do
  #   expect(data_extractor.retrieve_users_data).not_to eq nil
  # end
  #
  # it 'gets purchase data from the API' do
  #   expect(data_extractor.retrieve_purchases_data).not_to eq nil
  # end

  it 'loops up to the last page of user data' do
    allow(HTTParty).to receive(:get).with("https://driftrock-dev-test-2.herokuapp.com/users?page=1&per_page=1000")
      .and_return(api_data)
    allow(HTTParty).to receive(:get).with("https://driftrock-dev-test-2.herokuapp.com/users?page=2&per_page=1000")
      .and_return(api_data_2)
    expect(data_extractor.retrieve_users_data).to eq(["hello"])
  end
end
