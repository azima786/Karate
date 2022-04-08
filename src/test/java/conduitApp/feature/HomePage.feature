@debug
Feature: Test for the home page

        Background: Define URL
            Given url apiURL

        
        Scenario: get all tags

            Given path 'tags'
             When method get
             Then status 200
              And match response.tags contains ['welcome', 'implementations']
              And match response.tags !contains 'truck'
              And match response.tags contains any ['introduction', 'cat', 'fish']
#    And match response contains only ['welcome', 'implementations', 'codebaseShow', 'introduction']
              And match response.tags == "#array"
              And match each response.tags == "#string"

        
        Scenario: get 10 articles
   *  def timeValidator = read('classpath:conduitApp/helpers/timeValidator.js')
#      Given param limit = 10
#      Given param offset = 0
            Given params { limit: 10, offset: 0 }
            Given path 'articles'
             When method get
             Then status 200
    #And match response.articles == '#[6]'
    #And match response.articlesCount != 16
            #  And match response == {"articles": '#[8]', "articlesCount": 8}
    #And match response.articles[0].createdAt contains '2022'
    #And match response.articles[*].favoritesCount contains 0
    #And match response..bio contains null
    #And match each response..following  == false
    #And match each response..following  == '#boolean'
    #And match each response.articles[*].favoritesCount == '#number'
    #And match each response..bio  == '##string'
#              And match response == '#object'
#* def schema =
			
#			  """{
#            "title": "#string",
#            "description": "#string",
#            "body": "#string",
#            "tagList": "#array",
#            "createdAt": "#? timeValidator(_)",
#            "updatedAt": "#? timeValidator(_)",
#            "favorited": #boolean,
#            "favoritesCount": #number,
#            "author": #array
#}  
#"""
#* match response == schema
