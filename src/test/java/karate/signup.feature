Feature: Create a new user

Background:
	* url 'http://localhost:8081'
	* header Content-Type = 'application/json'
	* header Accept = 'application/json'
	

 Scenario: Creates a new user 
    Given path 'signup'
    And request { "email":"luyza@email.com", "loginPassword":"123" }
    When method post
    Then status 201
    * print response
  
  
  Scenario: Cannot create user with invalid username 
    Given path 'signup'
    And request { "email":"test@email.com", "loginPassword":"123" }
    When method post
    Then status 400
    * print response
    

  Scenario: Cannot create user with invalid password 
    Given path 'signup'
    And request { "email":"luyza@email.com", "loginPassword":"12345667890" }
    When method post
    Then status 400
    * print response