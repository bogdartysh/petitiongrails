package org.petitions

class Petition {

    static constraints = {
		hostData nullable:true, blank:true
		title blank:false
		text blank: false
		publicUrl url:true, blank:true, nullable:true
    }
	
	static hasMany = [votes: Vote]
	
	String title
	String text
	String publicUrl
	Addressee addressee;
	Date createdOn = new Date();
	Person person;
	String ip;
	String hostData;
}
