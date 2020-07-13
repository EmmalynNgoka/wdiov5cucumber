Feature: newIn
  As an anonymous user
  I want be able to view new products 


 
 Scenario: I want to click on the new in icon and be able to view new products
    
    Given I open the url "/"
    And I select "newIn"
    And I select "virginTwoTone"
    And I select "continueShopping"
    When I select "silkTopStraight"
    And I select "ProceedtoCheckout"
    Then I expect "productQuantity1" to be visible
     And I expect "productQuantity2" to be visible
   
    
    