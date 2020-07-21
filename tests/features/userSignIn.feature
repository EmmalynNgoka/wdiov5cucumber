Feature: userSignIn
  As an anonymous prospect
  I want be able to sign in

 npm 
 Scenario Outline: I want enter user details and sign in 
    
    Given I open the url "/"
    And I select "signInText"
    And I enter "enterEmailInSignIn" with <Email>
    And I fill "enterPasswordSignIn" with <Password>
    When I select "logInSignInIcon"
    Then I expect "authenticationFailed" to be visible

   
        Examples:
    |  Email| Password|
    | "gz221@hotmail.co.uk" |"jackson"|
    