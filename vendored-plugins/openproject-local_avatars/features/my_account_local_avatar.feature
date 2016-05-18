Feature: Set an new local avatar
  Background:
    Given there is 1 user with:
      | Login | bob |
    And there is 1 user with the following:
      | Login | john |

  Scenario: Set an invalid local avatar
    Given I am already logged in as "john"
    When I am on the my account page
    Then I should see "Change avatar" within "#menu-sidebar"
    When I click on "Change avatar"
    Then I should be on the my avatar page
    When I upload a "invalid_avatar.txt" image
    And I press "Save"
    Then I should be on the my avatar page
    And  I should see "Allowed formats are jpg, png, gif"

  Scenario: Set a valid local avatar
    Given I am already logged in as "bob"
    When I am on the my account page
    Then I should see "Change avatar" within "#menu-sidebar"
    When I click on "Change avatar"
    Then I should be on the my avatar page
    When I upload a "valid_avatar.png" image
    And I press "Save"
    Then  I should see "Avatar changed successfully."
