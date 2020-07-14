Feature: searchProduct
  As an anonymous prospect
  I want be able to search for a product sucessfully

    Scenario: search for product
   
    Given I open the url "/"
    And I expect "searchBar" to be visible
    And I select "searchBar"
    # And I fill "searchBar" with "wig"
    # And I select "searchButton"
    # And I expect "wigsSearchResult" to be visible

  Scenario Outline: search for multiple product
   
    Given I open the url "/"
    And I expect "searchBar" to be visible
    And I select "searchBar"
    # And I fill "searchBar" with <Product>
    # And I select "searchButton"
    # And I expect "wigsSearchResult" to be visible

        Examples:
    | Product |
    | "wig" |
    | "lace wig" |
    | "kinky straight" |