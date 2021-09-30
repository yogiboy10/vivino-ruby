# Language: Ruby, Level: Level 3
Then /^I should see the wine search results page$/ do
  @vivino_searchresults_page.verify_page
end

When /^I get to know the wine information from the search results$/ do
  @vivino_searchresults_page.get_first_page_search_results
  @vivino_searchresults_page.set_random_wine_from_parse_results
end

Then('I validate whether the search {string} present or not in the parsed wine results') do |keyword|
  @vivino_searchresults_page.print_wine_attributes_contains_keyword_or_not(keyword)
end

Then('I click random wine from search results') do
  @vivinoWineInformationPage = @vivino_searchresults_page.click_random_wine_from_results
end
