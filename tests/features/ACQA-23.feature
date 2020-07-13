Feature: ACQA-23
  As an anonymous prospect
  I want to perform a remortgage journey by selecting more than my current mortgage balance

  @Test
    Scenario: Login into HBC
    # Navigate to Miply Homepage
    Given I open the url "/"
    And I expect "HomepageLogin" to be visible
    And I select "HomepageLogin"
    # Then It should be "Email" displayed