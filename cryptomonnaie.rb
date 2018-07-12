require 'rubygems'
require 'nokogiri'
require 'open-uri'

def noms
tableau_nom = []
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  doc.css(".currency-name-container").each do |nom|
    tableau_nom.push(nom.text)
  end
 return tableau_nom
end


def price
  tableau_price= []
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  doc.css(".price").each do |dollars|
    tableau_price.push(dollars.text)
    end
    return tableau_price
end

var = Hash[noms.zip(price)]
print var
