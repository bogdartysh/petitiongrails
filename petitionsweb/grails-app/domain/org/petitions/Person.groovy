package org.petitions

import grails.rest.*
import java.util.Date;

@Resource(uri='/persons')
class Person {

    static constraints = {
		email email:true, blank:false
		personalPage url:true, blank: false
		imageUrl url:true, blank:true, nullable:false
		firstName blank:false
		secondName blank:true, nullable:true
		lastName blank:false
    }
	
	String email
	String firstName
	String secondName
	String lastName
	String title
	String personalPage
	String imageUrl
	
	
	Date lastUpdatedOn = new Date()
	Date createdOn = new Date()
}
