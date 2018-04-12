require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def route_des_incubateurs
	page = Nokogiri::HTML(open("http://www.mon-incubateur.com/site_incubateur/incubateurs"))
	tab=[]

	page.css("div#incubators_list p a[1]").each_with_index do |incub, nb|
		new_hash = Hash.new  
		new_hash = {}
		nomincub = incub.text
		codepostal = page.css("div#incubators_list p a[2]").text
		new_hash[nomincub] = "qqpart"
		tab[nb] = new_hash
	end
	p tab
end
route_des_incubateurs

