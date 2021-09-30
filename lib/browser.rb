# Language: Ruby, Level: Level 3
class Browser
  attr_reader :driver

  def initialize(browser_name)
    @driver = start_browser(browser_name)
    delete_cookies
  end

  def delete_cookies
    @driver.manage.delete_all_cookies
  end

  def open_page(url)
    @driver.navigate.to(url)
    set_window_size
    VivinoHomePage.new(@driver)
  end

  def set_timeout(timeout)
    @driver.manage.timeouts.implicit_wait = timeout
  end

  def set_window_size
    screen_width   = 1600
    screen_height  = 1500

    @driver.manage.window.resize_to(screen_width, screen_height)
  end

  def start_browser(browser)
    case browser
    when 'firefox'
      driver = Selenium::WebDriver.for :firefox
    when 'chrome'
      driver = Selenium::WebDriver.for :chrome
    else
      driver = Selenium::WebDriver.for :chrome
    end

    driver
  end
end
