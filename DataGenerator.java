package conduitApp.helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

public class DataGenerator {

	public static String getRandomEmail(){
Faker faker = new Faker();
String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";

return email;
		
	}

	public static String getRandomUserName(){
		Faker faker = new Faker();
		String userName = faker.name().username();
		return userName;
	}

	public static JSONObject getRandomArticleValue(){
		Faker faker = new Faker();
		String title = faker.gameOfThrones().character();
		System.out.println(title);
		String description = faker.gameOfThrones().city();
		String body = faker.gameOfThrones().quote();
		JSONObject json = new JSONObject();
		json.put("title", title);
		json.put("description", description);
		json.put("body", body);
		return json;
		
	}
}