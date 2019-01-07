package controller;

import com.google.gson.Gson;

public class dddddd {

	public static void main(String[] args) {
	
		Gson gson = new Gson();
		User user = new User("怪盗kidou",24);
	
		String jsonObject = gson.toJson(user);// {"name":"怪盗kidou","age":24}
	
		System.out.println(jsonObject);
	}

}
 class User {
    
	public User(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	//省略其它
    public String name;
    public int age;

}