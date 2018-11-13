package com.team01.model;


import javax.persistence.*;

@Entity
@Table(name = "roles" , schema = "sa46team01cab")
public class Roles {
	@Id
	@Column(name = "RoleId")
	
	private Integer roleId;
	
	@Column(name = "RoleName")
	private String roleName;
	
	@Column(name = "Description")
	private String description;

	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	
}
