Feature: Create user and login

  Background:
    * url 'http://localhost:8081'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
   	* def now = function(){ return java.lang.System.currentTimeMillis() }
    * def timeNow = call now
    * def username = ("" + timeNow)
    

	Scenario: Create user then log in 
  	Given path 'auth'
    And request {"email":"luyza@email.com", "loginPassword":"123" }
    When method post
    Then status 200
    * print response
    And match response.type == "Bearer"
    And match response.token == "#notnull"
    
  Scenario: Dont log in with wrong password and username
  	Given path 'auth'
    And request {"email":"luyza@email.com", "loginPassword":"12345" }
    When method post
    Then status 400
    * print response
    