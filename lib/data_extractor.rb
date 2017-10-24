require 'httparty'

class DataExtractor
  def retrieve_users_data
    puts 'users data loading'
    retrieve_data('users')
  end

  def retrieve_purchases_data
    puts 'purchases data loading'
    retrieve_data('purchases')
  end

  private

  def retrieve_data(data_category)
    data = []
    page_number = 1
    loop do
      url = "https://driftrock-dev-test-2.herokuapp.com/#{data_category}?page=#{page_number}&per_page=1000"
      response = HTTParty.get(url)
      break if response.parsed_response['data'] == []
      data += response.parsed_response['data']
      page_number += 1
    end
    data
  end
end
