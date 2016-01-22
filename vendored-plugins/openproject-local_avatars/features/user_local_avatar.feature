Feature: Check adding avatar by admin in the user show page
  Background:
    Given there is 1 user with:
      | Login | bob |

  # FIXME This should be working without javascript, this might be related to imagemagick 2.15.4
  @javascript
  Scenario: Set an avatar for custom user
    Given I am already admin
    When I edit the user "bob"
    Then I should see "Avatar" within ".tabs"
    When I click on "Avatar"
    And I upload a "valid_avatar.png" image
    And I press "Save"
    Then I should see "Avatar changed successfully."
