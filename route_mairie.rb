require 'rubygems'
require 'nokogiri'
require 'open-uri'
url = "http://annuaire-des-mairies.com/95/vaureal.html"

def get_the_email_of_a_townhal_from_its_webpage(url)

  page = Nokogiri::HTML(open(url))
  links = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

#======================================================================================================
url1 = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_all_the_urls_of_val_doise_townhalls(url1)
  page = Nokogiri::HTML(open(url1))
  town_webpages = Array.new()
  news_links = page.css("a[class=lientxt]")
  news_links.each do |adresse|
    name_town = adresse.text
    var = adresse['href']
    annuaire = "http://annuaire-des-mairies.com" + var
    mail = get_the_email_of_a_townhal_from_its_webpage(annuaire)
    town_webpages.push({"name" => name_town, "mail" => mail})
  end
  return town_webpages
end
print get_all_the_urls_of_val_doise_townhalls(url1)
