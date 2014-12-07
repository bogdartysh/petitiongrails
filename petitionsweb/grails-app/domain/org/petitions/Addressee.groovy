package org.petitions

class Addressee {

    static constraints = {
		corporateWebAddress url:true, blank:false, nullable:false
		imageUrl url:true, blank:true, nullable:true
		title blank:false, unique:true
		thresholdToBeSearchable min:1
		thresholdToBeConsidered min:1
    }
	
	static hasMany = [petitions: Petition]
	
	Person responsiblePerson
	String title
	String description
	String corporateWebAddress
	String imageUrl
	Date lastUpdatedOn = new Date()
	Date createdOn = new Date()
	Integer thresholdToBeSearchable = 100
	Integer thresholdToBeConsidered = 3000
}
