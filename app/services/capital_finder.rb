require 'countries'

module CapitalFinder
  extend self

  def for(country)
    code = code_of(country)
    capital_of(code) unless code.nil?
  end

  private

  def code_of(country)
    nation = Country.find_country_by_name(country)
    nation.alpha2.downcase unless nation.nil?
  end

  def capital_of(two_letter)
    world_bank(two_letter).fetch('capitalCity')
  end

  def world_bank(two_letter)
    uri = "http://api.worldbank.org/countries/#{two_letter}?format=json"
    response = Net::HTTP.get_response(URI.parse(uri))
    JSON.parse(response.body).last.last
  end
end
