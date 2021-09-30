# Language: Ruby, Level: Level 3
class VivinoWineInformationPage < BasePage
  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    wait.until { @driver.find_element(:class => 'inner') }
  end

  def collect_info_from_wine_page
    # From Selected wine collect the information
    inner = fetch_inner
      anchor_array = get_anchor_elements(inner)
      anchor_array.select.with_index do |data, index|
        case
        when 0 === index
          @@wine_info << data.text.concat(' '*1) + get_partial_description
        when (1..5) === index
          @@wine_info << data.text
        else
          puts ''
        end
      end
  end

  def compare_wine_page_data_with_previous_parsed_results
    #  comparison between parsed results and wine page attributs
    wine = get_wine_data_from_array_by_index(@@random_num)
    puts("------------------- Wine page ---------------------")
    puts("Below validation compares wine page results with parsed results from previous page--------------")
    puts("---------------Parsed results are --------------", @@wine_info)
    puts("---------------Wine page results are -------------- ", wine.title, wine.state, wine. country)
    puts("---------Is title displayed------------" , @@wine_info.member?(wine.title))
    puts("---------Is state or city displayed----------" , @@wine_info.member?(wine.state))
    puts("---------Is country displayed---------------" , @@wine_info.member?(wine.country))
  end

  def check_atleast_one_attribute_contains_keyword keyword
      #Check atleast either one attribute has keyword
      status = false
      wine = get_wine_data_from_array_by_index(@@random_num)
      puts "Below validation to check atleast one attribute contains keyword ---------------------"
      if(wine.title.include?(keyword))
        puts("Attribute title === #{wine.title} === contains the keyword is #{keyword}")
        status = true
      end
      if (wine.state.include?(keyword))
        puts("Attribute state === #{wine.state} === contains the keyword is #{keyword}")
        status = true
      end
      if (wine.country.include?(keyword))
        puts("Attribute country === #{wine.country} === contains the keyword is #{keyword}")
        status = true
      end
      if(!status)
          puts("Not even single match found for search keyword === #{keyword} === against the attributes in wine page")
      end
  end

  def fetch_inner
    @driver.find_elements(:class => 'inner')[0]
  end

  def get_anchor_elements element
    element.find_elements(:tag_name => 'a')
  end

  def get_wine_data_from_array_by_index idx
    @@wine_data[idx]
  end

  def get_partial_description
    @driver.find_element(:class => 'vintage').text
  end
end
