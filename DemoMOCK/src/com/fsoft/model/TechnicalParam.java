package com.fsoft.model;

import javax.persistence.*;

@Entity
@Table(name="TechnicalParam")
public class TechnicalParam {
	@Id
	@GeneratedValue
	Integer id;
	String cpu;
	String ram;
	String drive;
	String screen;
	String screenCard;
	String connectionPort;
	String operatingSystem;
	String size;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getDrive() {
		return drive;
	}

	public void setDrive(String drive) {
		this.drive = drive;
	}

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public String getScreenCard() {
		return screenCard;
	}

	public void setScreenCard(String screenCard) {
		this.screenCard = screenCard;
	}

	public String getConnectionPort() {
		return connectionPort;
	}

	public void setConnectionPort(String connectionPort) {
		this.connectionPort = connectionPort;
	}

	public String getOperatingSystem() {
		return operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
}
