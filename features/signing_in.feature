Feature: Signing in

  Scenario: Unsuccessful signin
    Given a user visits the siginin page
    When he submits invalid signin information
    Then he should see an error message

  Scenario: Successful sigin
    Given a user visits the siginin page
    And the user has an account
    And the user submits valid sigin information
    Then he should see his profile page
    And he should see a signout link



