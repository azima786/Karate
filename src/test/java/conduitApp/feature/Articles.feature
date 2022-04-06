
Feature: Articles

        Background: Define URL
             * url apiURL
			 * def articleRequestBody = read('classpath:conduitApp/json/newArticleRequest.json')
			 * def dataGenerator = Java.type('conduitApp.helpers.DataGenerator')
			 * def randomArticleValue =  dataGenerator.getRandomArticleValue()
* set articleRequestBody.article.title = randomArticleValue.title
* set articleRequestBody.article.description = randomArticleValue.description
* set articleRequestBody.article.body = randomArticleValue.body

            Given path 'users/login'
              And request {"user": {"email": "azima@gmail.com","password": "123456"}}
             When method Post
             Then status 200
			* def token = response.user.token
 			* def tokenResponse = callonce read('classpath:conduitApp/helpers/CreateToken.feature')
  			* def token = tokenResponse.authToken

        Scenario: Create a new article
            Given header Authorization = 'Token ' + token
            Given path 'articles'
              And request articleRequestBody
             When method Post
            # Then status 200
            #  And match response.article.title == articleRequestBody.article.title

        @regression
        Scenario: Create and delete an article
            Given header Authorization = 'Token ' + token
            Given path 'articles'
              And request articleRequestBody
             When method post
             Then status 200
    * def articleID = response.article.slug


            Given path 'articles?limit=10&offset=0'
             When method get
             Then status 200
              And match response.articles[0].title == articleRequestBody.article.title


            Given path 'articles', articleID
             When method delete
             Then status 204


            Given path 'articles?limit=10&offset=0'
             When method get
             Then status 200
              And match response.articles[0].title != articleRequestBody.article.title