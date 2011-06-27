@editais
Feature: Editais
  In order to have editais on my website
  As an administrator
  I want to manage editais

  Background:
    Given I am a logged in refinery user
    And I have no editais

  @editais-list @list
  Scenario: Editais List
   Given I have editais titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of editais
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @editais-valid @valid
  Scenario: Create Valid Edital
    When I go to the list of editais
    And I follow "Add New Edital"
    And I fill in "Titulo" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 edital

  @editais-invalid @invalid
  Scenario: Create Invalid Edital (without titulo)
    When I go to the list of editais
    And I follow "Add New Edital"
    And I press "Save"
    Then I should see "Titulo can't be blank"
    And I should have 0 editais

  @editais-edit @edit
  Scenario: Edit Existing Edital
    Given I have editais titled "A titulo"
    When I go to the list of editais
    And I follow "Edit this edital" within ".actions"
    Then I fill in "Titulo" with "A different titulo"
    And I press "Save"
    Then I should see "'A different titulo' was successfully updated."
    And I should be on the list of editais
    And I should not see "A titulo"

  @editais-duplicate @duplicate
  Scenario: Create Duplicate Edital
    Given I only have editais titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of editais
    And I follow "Add New Edital"
    And I fill in "Titulo" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 editais

  @editais-delete @delete
  Scenario: Delete Edital
    Given I only have editais titled UniqueTitleOne
    When I go to the list of editais
    And I follow "Remove this edital forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 editais
 