package org.petitions

class Comment {

	static constraints = {
		text nullable:false, blank:false
	}

	Petition petition
	Date createdOn = new Date()
	Person createdBy
	String text
}
