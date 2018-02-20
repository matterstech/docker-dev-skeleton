Feature: Test if the app is up

  Scenario: App up
    When I request "/"
    Then the response code is 200