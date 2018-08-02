package com.spring.naonnaTest.person;

import org.springframework.stereotype.Component;

@Component
public class PersonVO {
	private String nickname;
	private String team_name;
	private int gender;
	private int age;
	private int position;
	private String forPerson;
	private String city;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getForPerson() {
		return forPerson;
	}
	public void setForPerson(String forPerson) {
		this.forPerson = forPerson;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	

}
