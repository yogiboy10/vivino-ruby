Given /^I Launch the Vivino search page$/ do
    @vivino_home_page = @browser.open_page('https://www.vivino.com/')
    @vivino_home_page.verify_page
end

When('I do wine search for {string}') do |string|
   @vivino_searchresults_page = @vivino_home_page.enter_search(string)
end
