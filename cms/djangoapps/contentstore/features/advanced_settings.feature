@shard_1
Feature: CMS.Advanced (manual) course policy
  In order to specify course policy settings for which no custom user interface exists
  I want to be able to manually enter JSON key /value pairs

  # Sauce labs does not play nicely with CodeMirror
  @skip_sauce
  Scenario: Test how multi-line input appears
    Given I am on the Advanced Course Settings page in Studio
    When I create a JSON object as a value for "Discussion Topic Mapping"
    Then it is displayed as formatted
    And I reload the page
    Then it is displayed as formatted

  # Sauce labs does not play nicely with CodeMirror
  @skip_sauce
  Scenario: Test error if value supplied is of the wrong type
    Given I am on the Advanced Course Settings page in Studio
    When I create a JSON object as a value for "Course Display Name"
    Then I get an error on save
    And I reload the page
    Then the policy key value is unchanged

  # This feature will work in Firefox only when Firefox is the active window
  # Sauce labs does not play nicely with CodeMirror
  @skip_sauce
  Scenario: Test automatic quoting of non-JSON values
    Given I am on the Advanced Course Settings page in Studio
    When I create a non-JSON value not in quotes
    Then it is displayed as a string
    And I reload the page
    Then it is displayed as a string

  Scenario: Deprecated Settings can be toggled
    Given I am on the Advanced Course Settings page in Studio
    When I toggle the display of deprecated settings
    Then deprecated settings are then shown
    And I toggle the display of deprecated settings
    Then deprecated settings are not shown
