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
      
    holder_hash = {}  
    binding.pry
    social_doc.css("a").each do |href|
    
    href_var = href.attr('href')
    
      if href_var.include? "twitter.com"
        holder_hash << {:twitter => href_var}
      elsif href_var.include? "linkedin.com"
        holder_hash << {:linkedin => href_var}
      elsif href_var.include? "github.com"
        holder_hash << {:github => href_var}
      else 
        holder_hash << {:blog => href_var}
    end
   end
  end
  
end