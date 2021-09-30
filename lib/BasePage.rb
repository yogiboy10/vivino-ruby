# Language: Ruby, Level: Level 3
# Acts as prime class across other page class and this can be inherited for shared data or members
class BasePage
  @@random_num = 0
  @@wine_data ||= []
  @@wine_info ||= []

  def initialize(driver)
    @driver = driver
  end

  def self.reset_global_variables
    @@random_num = 0
    @@wine_data.clear
    @@wine_info.clear
  end
end
