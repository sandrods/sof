@eventos
Feature: Eventos
  In order to have eventos on my website
  As an administrator
  I want to manage eventos

  Background:
    Given I am a logged in refinery user
    And I have no eventos

  @eventos-list @list
  Scenario: Eventos List
   Given I have eventos titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of eventos
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @eventos-valid @valid
  Scenario: Create Valid Evento
    When I go to the list of eventos
    And I follow "Add New Evento"
    And I fill in "Titulo" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 evento

  @eventos-invalid @invalid
  Scenario: Create Invalid Evento (without titulo)
    When I go to the list of eventos
    And I follow "Add New Evento"
    And I press "Save"
    Then I should see "Titulo can't be blank"
    And I should have 0 eventos

  @eventos-edit @edit
  Scenario: Edit Existing Evento
    Given I have eventos titled "A titulo"
    When I go to the list of eventos
    And I follow "Edit this evento" within ".actions"
    Then I fill in "Titulo" with "A different titulo"
    And I press "Save"
    Then I should see "'A different titulo' was successfully updated."
    And I should be on the list of eventos
    And I should not see "A titulo"

  @eventos-duplicate @duplicate
  Scenario: Create Duplicate Evento
    Given I only have eventos titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of eventos
    And I follow "Add New Evento"
    And I fill in "Titulo" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 eventos

  @eventos-delete @delete
  Scenario: Delete Evento
    Given I only have eventos titled UniqueTitleOne
    When I go to the list of eventos
    And I follow "Remove this evento forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 eventos
 