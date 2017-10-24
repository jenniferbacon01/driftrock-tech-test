require 'httparty'

class DataExtractor
  def retrieve_user_data
    url = 'https://driftrock-dev-test-2.herokuapp.com/users?page=1&per_page=20'
    response = HTTParty.get(url)
    response.parsed_response
  end

  def retrieve_purchase_data
    url = 'https://driftrock-dev-test-2.herokuapp.com/purchases?page=1&per_page=20'
    response = HTTParty.get(url)
    response.parsed_response
  end
end
