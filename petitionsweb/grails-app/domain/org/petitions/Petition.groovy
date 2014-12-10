package org.petitions

class Petition {

	static constraints = {
		title blank:false, unique:true
		description blank: false
		publicUrl url:true, blank:true, nullable:true
		seachabilityThresholdReachedOn nullable:true
		considerabilityThresholdReachedOn nullable:true
		closedOn nullable:true
		closedDue nullable: true, blank: true
		closedBy nullable:true
		requestDetails nullable:true
	}

	String title
	String description
	String publicUrl
	Addressee addressee;
	Date createdOn = new Date();
	RequestDetails requestDetails
	Date seachabilityThresholdReachedOn
	Date considerabilityThresholdReachedOn
	Date closedOn
	Person closedBy
	String closedDue
}