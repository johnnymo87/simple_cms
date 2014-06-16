class Country < ActiveRecord::Base
  has_many :admin_users

end

module WorldbankAPI
  extend self

  def all_countries
    uri = "http://api.worldbank.org/countries?format=json&per_page=1000"
    response = Net::HTTP.get_response(URI.parse(uri))
    countries = JSON.parse(response.body).last
    countries.each do |c|
      Country.first_or_create({
        :name => c.fetch('name'),
        :capital => c.fetch('capitalCity')
      })
    end
  end
end
