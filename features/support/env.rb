# Language: Ruby, Level: Level 3
require 'selenium-webdriver'
require 'cucumber'
require 'require_all'
require 'pry'

require_all 'lib'

Before do |scenario|
    @browser = Browser.new(ENV['DRIVER'])
    @browser.delete_cookies
end

After do |scenario|
    @browser.driver.quit
end
