Feature: Performing remortgage journey with less than my current balance
  As an anonymous prospect
  I want to perform a remortgage journey by selecting less than my current mortgage balance

Background: Remortgages
    Given I open the url "/"
    Then I expect "welcomeText" to be "expectedWelcomeText"
    And I expect "introText" to be "expectedIntroText"
    And I expect "currentMortgageSituation" to be "expectedCurrentMortgageSituation"
    And I expect "firstTimeBuyerButton" to be visible
    And I expect "remortgageButton" to be visible
 
  Scenario: Sanity

  Scenario Outline: Performing remortgage journey

    # Enter remortgages journey
    When I select "remortgageButton"
    Then I expect "remortgageEntryText" to be "expectedRemortgageEntryText"
    And I expect "titleSelector" to be visible
    And I expect "firstNameField" to be visible
    And I expect "surNameField" to be visible
    And I expect "submitButton" to be visible
    # Enter personal details for remortgages
    When I fill "titleSelector" with <Title>
    And I fill "firstNameField" with <FirstName>
    And I fill "surNameField" with <SurName>
    And I select "submitButton"

      #Borrowing Questions
    Then I expect "thanksText" to be "expectedThanksText"
    And I expect "borrowOptions" to be "expectedBorrowOptions"
  
    When I select "moreThanBalanceYes"
    And I expect "brokerServiceOption" to be "expectedBrokerServiceOption"
    And I expect "resultAdvertText" to be visible
    And I expect "brokerAppointmentDate" to be "expectedBrokerAppointmentDate"

    When I fill "botInterfaceInput" with <Date>
    And I select "botInterfaceSubmitButton"
    Then I expect "validFutureDate" to be visible

    Examples:
    | Title | FirstName | SurName | Date|
    | "Mr" | "Test"  | "Sur"  |"12-12-18"|
    | "Ms" | "Miss"  | "Sur"  |"21-12-18"|
    | "Dr" | "Dau"  | "Sur"  |"22-12-18"|
