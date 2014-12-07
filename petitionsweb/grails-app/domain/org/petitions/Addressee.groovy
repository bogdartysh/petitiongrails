package org.petitions

class Addressee {

    static constraints = {
		corporateWebAddress url:true, blank:false, nullable:false
		imageUrl url:true, blank:false, nullable:false
		title blank:false
    }
	
	Person responsiblePerson
	String title
	String description
	String corporateWebAddress
	String imageUrl
	Date lastUpdatedOn = new Date()
	Date createdOn = new Date()
}
