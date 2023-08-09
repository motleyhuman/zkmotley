@deposit @regression @transactions @emptyWallet
Feature: Deposit

  Background:
    Given Connect Metamask extension with login action


  @id1294 @emptyWallet
  Scenario: Deposit - Receive - [Transaction] insufficient funds 0 balance
    Given I am on the Main page
    When I go to "Deposit" transaction section
    When I click by "text" with "Your account" value
    When I choose "ETH" as token and insert "" as amount
    When Element with "text" " Insufficient " should be "visible"
    When I confirm the network switching
    Then Element with "text" " Continue " should be "disabled"