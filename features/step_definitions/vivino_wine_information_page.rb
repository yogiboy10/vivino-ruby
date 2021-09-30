# Language: Ruby, Level: Level 3
Then('I should see the wine information page') do
  @vivinoWineInformationPage.verify_page
end

When('I Collect an Info from the wine page') do
  @vivinoWineInformationPage.collect_info_from_wine_page
end

Then('I check each attribute value is equal to previously parsed wined results') do
  @vivinoWineInformationPage.compare_wine_page_data_with_previous_parsed_results
end

Then('I check atleast one attribute contains {string}') do |keyword|
  @vivinoWineInformationPage.check_atleast_one_attribute_contains_keyword(keyword)
end
