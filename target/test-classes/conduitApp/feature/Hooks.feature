@debug
Feature: Hooks

        Background: hooks
* def result = callonce read('classpath:conduitApp/helpers/Dummy.feature')
* def username = result.username

#after hooks
* configure afterScenario = function(){ karate.call('classpath:conduitApp/helpers/Dummy.feature') }
*  configure afterFeature = function(){ karate.log('Aftfer feature') }
        
        Scenario: First Scenario
		* print username
		* print 'This is first Scenario'

        Scenario: Second Scenario
		* print username
		* print 'This is second scenario'

		