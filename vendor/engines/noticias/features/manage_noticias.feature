@noticias
Feature: Noticias
  In order to have noticias on my website
  As an administrator
  I want to manage noticias

  Background:
    Given I am a logged in refinery user
    And I have no noticias

  @noticias-list @list
  Scenario: Noticias List
   Given I have noticias titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of noticias
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @noticias-valid @valid
  Scenario: Create Valid Noticia
    When I go to the list of noticias
    And I follow "Add New Noticia"
    And I fill in "Titulo" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 noticia

  @noticias-invalid @invalid
  Scenario: Create Invalid Noticia (without titulo)
    When I go to the list of noticias
    And I follow "Add New Noticia"
    And I press "Save"
    Then I should see "Titulo can't be blank"
    And I should have 0 noticias

  @noticias-edit @edit
  Scenario: Edit Existing Noticia
    Given I have noticias titled "A titulo"
    When I go to the list of noticias
    And I follow "Edit this noticia" within ".actions"
    Then I fill in "Titulo" with "A different titulo"
    And I press "Save"
    Then I should see "'A different titulo' was successfully updated."
    And I should be on the list of noticias
    And I should not see "A titulo"

  @noticias-duplicate @duplicate
  Scenario: Create Duplicate Noticia
    Given I only have noticias titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of noticias
    And I follow "Add New Noticia"
    And I fill in "Titulo" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 noticias

  @noticias-delete @delete
  Scenario: Delete Noticia
    Given I only have noticias titled UniqueTitleOne
    When I go to the list of noticias
    And I follow "Remove this noticia forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 noticias
 