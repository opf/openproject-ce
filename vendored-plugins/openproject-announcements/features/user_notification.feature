Feature: As a system user
         I want to be informed about announcements e.g. downtimes
         So that I know what is happening with the system

  Scenario: Active announcements are displayed on the login screen
    Given there is an active announcement saying "Downtime"
    When I go to the login page
    Then I should see "Downtime"

  Scenario: Inactive annoucements are not displayed on the login screen
    Given there is an inactive announcement saying "Downtime"
    When I go to the login page
    Then I should not see "Donwtime"
