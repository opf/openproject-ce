Feature: When I am an admin
        I want to enter announcements
        To inform all system users of upcomming events

  Scenario: Announcements are editable in the administrations area
    Given I am admin
    And I go to the admin page
    Then I should see "Announcement"

  Scenario: Editing the announcement
    Given I am admin
    When I go to the edit page of Announcement
    And I enter "Time.now" into the announcement date field
    And I enter "We will have a downtime" into the announcement text field
    And I activate the announcement
    And I click on "Save"
    Then I should see "Successful update"
