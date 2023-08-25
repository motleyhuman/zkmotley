@deposit @regression @redirection @resetAllowance
Feature: Deposit

  Background:
    Given Connect Metamask extension with login action


  @id1493 
  Scenario: Redirection - approving allowance modal
    Given I go to the main page
    Given I go to "Deposit" transaction section
    When I click by "text" with "Your account" value
    Then I confirm the network switching
    When I choose "DAI" as token and insert "0.0000000001" as amount
    Then Element with "text" " Continue " should be "clickable"
    When I click by text " Continue "
    When I click by the "//*[text()=' Learn more ']" text element on the Modal card
    Then New page has "https://cryptotesters.com/blog/token-allowances" address
    

#     @id1495
#     Scenario: Redirection - Approving allowance pop up
#     Given I reset allowance
#     Given I go to page "/transaction/zksync/era/deposit/?network=era-goerli"
#     When I click by "text" with "Your account" value
#     When I choose "DAI" as token and insert "0.00000000025" as amount
#     Then I "confirm" transaction after clicking "Approve allowance" button
#     Then Modal card element with the "//*[text()='Approving allowance']" xpath should be "visible"
#     When I click by the "//*[@class='line-button-with-img-icon']" text element on the Modal card
#     Then New page has "https://goerli.etherscan.io/tx" partial address
#     When I click by the "//*[contains(text(),'Track status')]" text element on the Modal card
#     Then New page has "https://goerli.etherscan.io/tx" partial address

#   @id1496 
#   Scenario: Redirection - Allowance approved pop up
#     Given I go to the main page
#     Given I go to "Deposit" transaction section
#     When I click by "text" with "Your account" value
#     When I choose "DAI" as token and insert "0.0000000001" as amount
#     Then I "confirm" transaction after clicking "Approve allowance" button
#     Then Modal card element with the "//*[text()='Allowance approved']" xpath should be "visible"
#     When I click by the "//*[@class='line-button-with-img-icon']" text element on the Modal card
#     Then New page has "https://goerli.etherscan.io/tx" partial address
#     Given I reset allowance