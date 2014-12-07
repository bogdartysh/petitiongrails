package org.petitions

class Petition {

    static constraints = {
		hostData nullable:true, blank:true
    }
	
	Addressee addressee;
	Date createdOn = new Date();
	Person person;
	String ip;
	String hostData;
}
