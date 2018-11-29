package hello.Batis;

public class HelloModel {
    private String lift_stationary;
    private String alarm_bell;
    private String under_maintenance;
    private String acpower;
    private String position;
    private String door_moving;
    private String error;
    private String timestamp;
//	public HelloModel(String string, String string2, String string3, String string4, String string5, String string6,
//			String string7, String string8) {
//		this.lift_stationary=string;
//		this.alarm_bell=string2;
//		this.under_maintenance=string3;
//		this.acpower=string4;
//		this.position=string5;
//		this.door_moving=string6;
//		this.error=string7;
//		this.timestamp=string8;
//		
//	}
	public String getLift_stationary() {
		return lift_stationary;
	}
	public void setLift_stationary(String lift_stationary) {
		this.lift_stationary = lift_stationary;
	}
	public String getAlarm_bell() {
		return alarm_bell;
	}
	public void setAlarm_bell(String alarm_bell) {
		this.alarm_bell = alarm_bell;
	}
	public String getUnder_maintenance() {
		return under_maintenance;
	}
	public void setUnder_maintenance(String under_maintenance) {
		this.under_maintenance = under_maintenance;
	}
	public String getAcpower() {
		return acpower;
	}
	public void setAcpower(String acpower) {
		this.acpower = acpower;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDoor_moving() {
		return door_moving;
	}
	public void setDoor_moving(String door_moving) {
		this.door_moving = door_moving;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	@Override
	public String toString() {
		return "HelloModel [lift_stationary=" + lift_stationary + ", alarm_bell=" + alarm_bell + ", under_maintenance="
				+ under_maintenance + ", acpower=" + acpower + ", position=" + position + ", door_moving=" + door_moving
				+ ", error=" + error + ", timestamp=" + timestamp + "]";
	}
  
}
