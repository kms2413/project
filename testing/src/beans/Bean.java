package beans;

public class Bean {
	private String name;
	private String message;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("name:" + name);
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		System.out.println("message:" + message);
		this.message = message;
	}
}
