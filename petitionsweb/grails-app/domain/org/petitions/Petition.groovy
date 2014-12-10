package org.petitions

import groovy.time.*

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

	static hasMany = [statistics: PetitionStatistic, comments: Comment]

	String title
	String description
	String publicUrl
	Addressee addressee;
	Date createdOn = new Date();
	RequestDetails requestDetails
	Date seachabilityThresholdReachedOn
	Date considerabilityThresholdReachedOn
	Integer thresholdToBeSearchable = 100
	Integer thresholdToBeConsidered = 3000
	Date closedOn
	Person closedBy
	String closedDue

	def getSeachableDeadline() {
		use (TimeCategory) { createdOn + 30.days}
	}
}