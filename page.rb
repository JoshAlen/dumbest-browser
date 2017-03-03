require 'uri'
require 'net/http'
require 'nokogiri'
require 'open-uri'

class Page
  def initialize(url)
    @url = url
    @page
  end
  
  def url
    puts "url> #{@url}"
  end

  def fetch!
    uri = URI.parse(@url)
    puts "Fetching..."
    @page = Nokogiri::HTML(open(uri))
  end
  
  def title
    puts "Title: #{@page.css('title')}"
    temp = @page.text
    puts "Content length: #{temp.length}"
  end
  
  def links
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    links = @page.css('a')
    puts "Links:"
    links.each do |link|
      puts " #{link['href']}"
    end
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end
end