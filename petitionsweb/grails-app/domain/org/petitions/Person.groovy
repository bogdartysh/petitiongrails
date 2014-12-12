package org.petitions

import grails.rest.*

class Person {

	static constraints = {
		email email:true, blank:false
		personalPage url:true, blank: false, nullable:true
		imageUrl url:true, blank:true, nullable:true
		firstName blank:false, size: 3..50
		secondName blank:true, nullable:true, size: 3..50
		lastName blank:false, size: 3..50
		phone blank: false, nullable:true, size:3..20
		postalAddress blank:true, nullable:true, size:0..1000
	}
	static hasMany = [addressees: Addressee, comments: Comment]

	String email
	String firstName
	String secondName
	String lastName
	String title
	String personalPage
	String imageUrl
	String phone
	String postalAddress


	Date lastUpdatedOn = new Date()
	Date createdOn = new Date()

	@Override
	String toString() {
		title + " " +firstName + " " + lastName
	}
}
