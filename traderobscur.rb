require 'rubygems'
require 'nokogiri'   
require 'open-uri'




def crypto_value
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	tab =[]

	page.css("a.currency-name-container").each_with_index do |crypto, nb|	
		new_hash = Hash.new
		new_hash = {}
		moname = crypto.text
		new_hash[moname] = page.css("a.price")[nb].text
		tab[nb] = new_hash
		puts tab[nb]
		end		
	p tab
	puts tab.size
end

while true

crypto_value

sleep(3600)
end