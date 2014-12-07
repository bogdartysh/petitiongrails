package org.petitions

class Request {

    static constraints = {
		hostData nullable:true, blank:true
    }
	
	Addressee addressee;
	Date createdOn = new Date();
	Person person;
	String ip;
	String hostData;
}
