Feature: Test if the app is up

  Scenario: receive HTTP 200
    When I request "/"
    Then the response code is 200

