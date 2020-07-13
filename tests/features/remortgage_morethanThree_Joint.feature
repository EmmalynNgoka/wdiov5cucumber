Feature: Performing remortgage journey less than my current balance
  As an anonymous prospect
  I want to perform a remortgage journey by selecting less than my current mortgage balance

  Scenario: Performing remortgage journey
    # Navigate to Miply Homepage
    Given I open the url "/"
    Then I expect "welcomeText" to be "expectedWelcomeText"
    And I expect "introText" to be "expectedIntroText"
    And I expect "currentMortgageSituation" to be "expectedCurrentMortgageSituation"
    And I expect "firstTimeBuyerButton" to be visible
    And I expect "remortgageButton" to be visible
    # Enter remortgages journey
    When I select "remortgageButton"
    Then I expect "remortgageEntryText" to be "expectedRemortgageEntryText"
    And I expect "titleSelector" to be visible
    And I expect "firstNameField" to be visible
    And I expect "surNameField" to be visible
    And I expect "submitButton" to be visible
    # Enter personal details for remortgages
    When I fill "titleSelector" with "Mr"
    And I fill "firstNameField" with "John"
    And I fill "surNameField" with "Smith"
    And I select "submitButton"
    #Borrowing Questions
    Then I expect "thanksText" to be "expectedThanksText"
    And I expect "borrowOptions" to be "expectedBorrowOptions"
    When I select "moreThanBalanceNo"
    #And I expect "moreQuestionsText" to be "expectedMoreQuestionsText"
    #And I expect "currentMortgageTenureText" to be visible
    And I expect "underThreeMonthsButton" to be visible
    And I expect "moreThanThreeMonthsButton" to be visible
    And I expect "alreadyEndedButton" to be visible
    
    #  More than 3 months journey - continue-single
    When I select "moreThanThreeMonthsButton"
    And I expect "continueButton" to be visible
    And I expect "OtherOptionsButton" to be visible
    And I select "continueButton"
    And I expect "singleorjointText" to be "singleorjointapplicantText"
    And I expect "singleButton" to be visible
    And I expect "JointButton" to be visible



    #  More than 3 months journey - continue- - oneapplicantButton
    When I select "JointButton"
    And I expect "otherapplicants" to be "otherapplicantsText"
    And I expect "oneapplicantButton" to be visible
    And I expect "MorethanoneButton" to be visible
    When I select "oneapplicantButton"
    #And I expect "inviteother" to be "otherapplicantsText"
    And I expect "nextquestion" to be "nextquestionText"
    #And I expect "nevershare" to be "nevershareText"
    And I expect "loginWithEmailButton" to be visible
    And I expect "loginWithSocialButton" to be visible
    And I expect "doItLaterButton" to be visible


    #  More than 3 months journey - continue-joint -MorethanoneButton
   # When I select "MorethanoneButton"
    #And I expect "speaktous" to be "speaktousText"














