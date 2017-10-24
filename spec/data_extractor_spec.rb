require 'data_extractor'

describe DataExtractor do
  subject(:data_extractor) { described_class.new }

  it 'gets user data from the API' do
    expect(data_extractor.retrieve_user_data).not_to eq nil
  end
end
