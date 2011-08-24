@textos
Feature: Textos
  In order to have textos on my website
  As an administrator
  I want to manage textos

  Background:
    Given I am a logged in refinery user
    And I have no textos

  @textos-list @list
  Scenario: Textos List
   Given I have textos titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of textos
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @textos-valid @valid
  Scenario: Create Valid Texto
    When I go to the list of textos
    And I follow "Add New Texto"
    And I fill in "Titulo" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 texto

  @textos-invalid @invalid
  Scenario: Create Invalid Texto (without titulo)
    When I go to the list of textos
    And I follow "Add New Texto"
    And I press "Save"
    Then I should see "Titulo can't be blank"
    And I should have 0 textos

  @textos-edit @edit
  Scenario: Edit Existing Texto
    Given I have textos titled "A titulo"
    When I go to the list of textos
    And I follow "Edit this texto" within ".actions"
    Then I fill in "Titulo" with "A different titulo"
    And I press "Save"
    Then I should see "'A different titulo' was successfully updated."
    And I should be on the list of textos
    And I should not see "A titulo"

  @textos-duplicate @duplicate
  Scenario: Create Duplicate Texto
    Given I only have textos titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of textos
    And I follow "Add New Texto"
    And I fill in "Titulo" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 textos

  @textos-delete @delete
  Scenario: Delete Texto
    Given I only have textos titled UniqueTitleOne
    When I go to the list of textos
    And I follow "Remove this texto forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 textos
 