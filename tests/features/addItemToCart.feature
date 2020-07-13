Feature: searchProduct
  As an anonymous prospect
  I want be able to add an Item to the cart

  @Test
    Scenario: I want to add an item to the cart
    
    Given I open the url "/"
    And I select "itemPoster"
    And I select "addToCartButton"
    When I select "ProceedtoCheckout"
    Then I expect "CartItem" to be visible


