require 'httparty'

class DataExtractor
  def retrieve_user_data
    user_data = []
    page_number = 1
    loop do
      url = "https://driftrock-dev-test-2.herokuapp.com/users?page=#{page_number}&per_page=100"
      response = HTTParty.get(url)
      break if response.parsed_response['data'] == []
      user_data += response.parsed_response['data']
      page_number += 1
    end
    user_data
  end

  def retrieve_purchase_data
    url = 'https://driftrock-dev-test-2.herokuapp.com/purchases?page=1&per_page=20'
    response = HTTParty.get(url)
    response.parsed_response
  end
end
