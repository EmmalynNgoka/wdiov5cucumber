Feature: Sanity Check
  As a product inspector
  I want to do a sanity check on Miply

  @Test
  Scenario: Sanity Check
    # Navigate to Miply Homepage
    Given I open the url "/"
    Then I expect "welcomeText" to be "expectedWelcomeText"
    And I expect "introText" to be "expectedIntroText"
    And I expect "currentMortgageSituation" to be "expectedCurrentMortgageSituation"
    And I expect "firstTimeBuyerButton" to be visible
    And I expect "remortgageButton" to be visible