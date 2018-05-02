package t3h.edu.model;

public class User {

	private String user_name;
	private String firstName;
	private String lastName;
	private String password;
	private String user_phone;
	private String email;
	

	// user_name,first_name,last_name,user_pass,user_email,user_phone
	public String getUserName() {
		return user_name;
	}

	public void setUserName(String userid) {
		this.user_name = userid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserPhone() {
		return user_phone;
	}

	public void setUserPhone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [userid=" + user_name + ", firstName=" + firstName + ", lastName=" + lastName + ",user_pass="+password+", user_phone="
				+ user_phone + ", email=" + email + "]";
	}
}
