# Language: Ruby, Level: Level 3
class VivinoHomePage < BasePage

  def enter_search(search_term)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    input = wait.until {@driver.find_element(:name => 'q')};
    input.send_keys(search_term)
    input.send_keys(:enter)
    VivinoSearchResultsPage.new(@driver)
  end

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:name => 'q') }
  end
end
