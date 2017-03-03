
require_relative 'page'

class Browser
  def run!
    # Run the browser
    # Display a prompt for a user
    puts "What is your url link?"
    # Parse their input
    input = gets.chomp
    page = Page.new(input)

    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    
    page.url
    page.fetch!
    page.title
    page.links
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
  end
end

Browser.new.run!