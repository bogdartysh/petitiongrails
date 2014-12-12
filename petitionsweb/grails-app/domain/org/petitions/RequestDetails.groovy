package org.petitions

class RequestDetails {

	static constraints = {
		userAgent blank:true
		remoteAddr blank:true
	}

	static equalsProperties = ['userAgent', 'remoteAddr']
	static toString = [
		'id',
		'userAgent',
		'remoteAddr'
	]

	String userAgent
	String remoteAddr
	Date createdOn = new Date()
}
