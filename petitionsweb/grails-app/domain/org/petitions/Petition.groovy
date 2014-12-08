package org.petitions

class Petition {

	static constraints = {
		hostData nullable:true, blank:true
		title blank:false, unique:true
		description blank: false
		publicUrl url:true, blank:true, nullable:true
		seachabilityThresholdReachedOn nullable:true
		considerabilityThresholdReachedOn nullable:true
		closedOn nullable:true
		actionDescription nullable: true, blank: true
		actionPerformedOn nullable:true
		closedBy nullable:true
	}

	String title
	String description
	String publicUrl
	Addressee addressee;
	Date createdOn = new Date();
	Person person;
	String ip;
	String hostData;
	Date seachabilityThresholdReachedOn
	Date considerabilityThresholdReachedOn
	Date closedOn
	Person closedBy
	String actionDescription
	Date actionPerformedOn
}
