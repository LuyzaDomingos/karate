Feature: Create and Delete a Planet of Star Wars Universe

  Background:
    * url 'http://localhost:8081'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
   	* def now = function(){ return java.lang.System.currentTimeMillis() }
    * def timeNow = call now
    * def username = ("" + timeNow)
   

  	Given path 'auth'
    And request {"email":"luyza@email.com", "loginPassword":"123" }
    When method post
    Then status 200
    * print response
    And match response.type == "Bearer"
    And match response.token == "#notnull"
    * def token = response.token
    
   
   
   	* def planetName = "Dantooine"
    # create a new planet
   	Given path 'planets'
   	And header Authorization = 'Bearer ' + token
   	And request { "name": "Dantooine", "climate":"temperate", "terrain":"oceans, savannas, mountains, grasslands"}
  	When method post
    Then status 201
    * print response
    And match response.name == "Dantooine"
    And match response.climate == "temperate"
    And match response.terrain == "oceans, savannas, mountains, grasslands"
    * def planetId = response.id
   
    # delete the planet
    Given path 'planets/' + response.id
    And header Authorization = 'Bearer ' + token
    When method delete
    Then status 200
    * print response
    
    
    
    Scenario: Trying update a planet that dont exist
   
   	* def planetName = "Nal Hutta"
    # update a planet
   	Given path 'planets/' + planetId
   	And header Authorization = 'Bearer ' + token
   	And request { "name": "Nal Hutta", "climate":"temperate", "terrain":"urban, oceans, swamps, bogs"}
  	When method put
    Then status 404
    * print response
    And match response.message == "The planet you are looking for doesn't exist"
      