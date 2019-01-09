require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  
  
  def self.scrape_index_page(index_url)
    
    scraped_students = []
    
    doc = Nokogiri::HTML(open(index_url))
    
    doc.css(".student-card").each do |student|
    scraped_students << {:name => student.css("h4").text , :location => student.css("p").text , :profile_url => student.css("a")[0]["href"]}
    end
    
    scraped_students
    
  end



  def self.scrape_profile_page(profile_url)
    
    profile_doc = Nokogiri::HTML(open(profile_url)) 
    
    social_doc = profile_doc.css(".social-icon-container")
    social_doc.css("a").each do |href|
      
    
    case  href.attr('href')
  
   
      binding.pry
   
    end
   end
  end
  
end