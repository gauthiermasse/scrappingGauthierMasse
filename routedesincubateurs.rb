require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def route_des_incubateurs
	page = Nokogiri::HTML(open("http://www.mon-incubateur.com/site_incubateur/incubateurs"))
	tab=[]

	page.css("div#incubators_list p a[0]").each_with_index do |incub, nb|
		new_hash = Hash.new  
		new_hash = {}
		nomincub = incub.text
		site = "http://www.mon-incubateur.com" + incub["href"].text
		arrondissement = page.css("div#incubators_list p a[1]")[nb].text
		new_hash [nomincub] = site, arrondissement
		tab[nb] = new_hash
		puts tab[nb]
		end
	p tab
	puts tab.size
end


route_des_incubateurs


