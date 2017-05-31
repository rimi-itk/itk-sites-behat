Feature: loop
  In order to …
  As an …
  I need to be able to …

  @javascript
  Scenario: Sign in
    Given I am on "/"
    Then I should see "Username or e-mail"
    And I save a screenshot in "user-login.png"

    When I fill in "name" with "test-user"
    And fill in "pass" with "test-password"
    And I press "Log in"
    Then I should be on "/"
    And I save a screenshot in "users-test-user.png"
    And I should see "Search for an answer"

    Given I am on "/node/add/post"
    And I fill in "field_description[und][0][value]" with "My first post"
    And I select "test subject" from "field_subject[und]"
    And I save a screenshot in "create-post.png"
    And I press "Save"
    Then I should be on "/my-first-post"

    Given I am on "/"
    And I follow "test subject"
    Then I should be on "/subject/test-subject"
    And I should see "test subject"
    And I should see "My first post"

    When I follow "My first post"
    Then I should be on "/my-first-post"
    And I should see "My first post"
