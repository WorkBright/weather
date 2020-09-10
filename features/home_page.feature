# home_page.feature
Feature: Show Home Page
  As the product owner
  I want visitors to see a greeting when they visit the home page
  So that they have a better experience

  Scenario: Visitor sees the home page
    Given I am a visitor
    When I go to the home page
    Then I should see the welcome message

