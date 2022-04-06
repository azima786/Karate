Feature: Sign up new user

        Background: PreConditions
* def dataGenerator = Java.type('conduitApp.helpers.DataGenerator')
            Given url apiURL
        
        @ignore
        Scenario: New user Sign up
//  Given def userData = {"email": "Karantser15@test.com", "username": "KarnatUser1235"}
		
* def randomEmail = dataGenerator.getRandomEmail()
* def randomUserName = dataGenerator.getRandomUserName()
            Given path 'users'
              And request  {"user": { "email": "#(randomEmail)","password": "123456","username": "#(randomUserName)"}}

             When method Post
             Then status 200
              And match each response == {"user":{"image":"#string","bio":null,"email":"#(randomEmail)","username":"#(randomUserName)","token":"#string"}}
		


       
        Scenario Outline: New user sign up: Username taken
* def randomEmail = dataGenerator.getRandomEmail()
* def randomUserName = dataGenerator.getRandomUserName()
            Given path 'users'
              And request {"user": {"email": "<email>","password": "<password>", "username": "<username>"}}
             When method Post
             Then status 422
              And match response == <errorResponse>

        Examples:
                  | email             | password     | username                | errorResponse                                                                             |
                  | #(randomEmail)    | Karate123    | azima                   | {"errors": {"username": ["has already been taken"]}}                                      |
                  | azima23@gmail.com | 123Karate123 | azima12                 | {"errors": {"email": [ "has already been taken"],"username": ["has already been taken"]}} |
                  | azima23           | 123Karate123 | #(randomUserName)       | {"errors": {"email":["has already been taken"]}}                                          |
                  | #(randomEmail)    | 123Karate123 | azima120786595656565656 | {"errors": {"username": ["has already been taken"]}}                                      |
                #  | #(randomEmail)    | 123K         | azima12                 | {"errors": {"password": ["is too short (minimum is 8 characters)"]}}                      |
                  |                   | 123Karate123 | azima12 | {"errors": {"email": ["can't be blank"]}}    |
                  | azima23@gmail.com |              | azima12 | {"errors": {"password": ["can't be blank"]}} |
                  | azima23@gmail.com | 123Karate123 |         | {"errors": {"username": ["can't be blank"]}} |

