package org.petitions

class Comment {

	static constraints = {
	}

	Petition petition
	Date createdOn = new Date()
	Person createdBy
}
