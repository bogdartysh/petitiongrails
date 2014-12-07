package org.petitions

class Petition {

    static constraints = {
		hostData nullable:true, blank:true
		title blank:false
		description blank: false
		publicUrl url:true, blank:true, nullable:true
		seachabilityThresholdReachedOn nullable:true
		considerabilityThresholdReachedOn nullable:true
		actionDescription nullable: true, blank: true
		actionPerformedOn nullable:true
    }
	
	static hasMany = [votes: Vote]
	
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
	String actionDescription
	Date actionPerformedOn
}
