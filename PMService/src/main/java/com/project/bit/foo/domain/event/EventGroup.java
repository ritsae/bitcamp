package com.project.bit.foo.domain.event;

import lombok.Data;

@Data
public class EventGroup {
	
	private String eventId;
	private String userId;
	private String eventMembers;
	
	public EventGroup() {
		// TODO Auto-generated constructor stub
	}

}
