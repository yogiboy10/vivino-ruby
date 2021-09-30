Feature: Vivino Search
  The Vivino homepage allows user to perform a search wine.

  Background: Open the web-page
    Given set environment variables
    Given I Launch the Vivino search page

  Scenario Outline: Users can perform a keyword based search on Vivino
    When I do wine search for "<keyword>"
    Then I should see the wine search results page
    When I get to know the wine information from the search results
    Then I validate whether the search "<keyword>" present or not in the parsed wine results
    And I click random wine from search results
    Then I should see the wine information page
    When I Collect an Info from the wine page
    Then I check each attribute value is equal to previously parsed wined results
    Then I check atleast one attribute contains "<keyword>"

  Examples:
  | keyword     |
  | Wine        |
  | Madxa       |
  | Maria savo  |
  | Lua Cheia  |
