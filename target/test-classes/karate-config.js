function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
   		apiURL: 'https://api.realworld.io/api/'	
  }
  if (env == 'dev') {
			  config.userEmail = 'azima@gmail.com'
			    config.userPassword=  '123456'
  } else {
	config.userEmail ='azima@gmail.com'
    config.userPassword = 'A123456'
  }

var accessToken =  karate.callSingle('classpath:conduitApp/helpers/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
//
}