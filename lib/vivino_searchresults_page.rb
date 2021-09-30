# Language: Ruby, Level: Level 3
class VivinoSearchResultsPage < BasePage

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    element = wait.until { @driver.find_elements(:class => 'wine-card__content') }
  end

  def get_first_page_search_results
    title , state, country = ''
    search_lists = fetch_search_results
    # iterate through page results
    search_lists.each do |item|
      anchor_array = get_anchor_elements(item)
      anchor_array.each_with_index do |val, index|
        case
          when index.to_s === 0.to_s
            title = val.text
          when index.to_s === 1.to_s
            state = val.text
          when index.to_s === 2.to_s
            country = val.text
          else
            puts 'Nothing to store'
         end
      end
      # Save the iterated results to Wine class model and array it for collections of wine
      @@wine_data << Wine.new(title,state,country)
    end
  end

  def print_wine_attributes_contains_keyword_or_not keyword
    # From saved collections print match or not match data against the parameter keyword
    match = @@wine_data.select {|wineobject| wineobject.title.match(/#{keyword}/)}
    not_match = @@wine_data.select {|wineobject| !wineobject.title.match(/#{keyword}/)}
    puts("--------------Wine contains Keyword match found for the keyword=== #{keyword}-------------------")
    if(match.empty?)
      puts "Well it seems there is no match keyword found!!!!!!!!!!"
    else
      print_array(match)
    end
    puts("--------------Wine contains Keyword match not found for the keyword=== #{keyword}-------------------")
    if(not_match.empty?)
      puts "All are matched. Nothing left un matched for the keyword!!!!!!!!!!"
    else
      print_array(not_match)
    end
    print_array(not_match)
  end

  def click_random_wine_from_results
    search_lists = fetch_search_results
    search_lists.each_with_index do |item, index|
      # using random method click random wine in search result
      if(index.to_i===@@random_num.to_i)
        anchor_array = get_anchor_elements(item)
        anchor_array[0].click
      end
    end
    VivinoWineInformationPage.new(@driver)
  end

  def fetch_search_results
    @driver.find_elements(:class => 'wine-card__content')
  end

  def get_anchor_elements element
    element.find_elements(:tag_name => 'a')
  end

  def set_random_wine_from_parse_results
    # random wine is picked from the search result to validate
    @@random_num =  random_num_by_limit @@wine_data.length
  end

  def print_array my_array
    my_array.each do |item|
      puts ("Title---------"+item.title)
      puts ("State---------"+item.state)
      puts ("Country---------"+item.country)
    end
  end

  def random_num_by_limit range
    r= Random.new
    r.rand(0..range)
  end

  # Search information can be privatized since those cannot be exposed
  private
    attr_reader :search_lists
end
