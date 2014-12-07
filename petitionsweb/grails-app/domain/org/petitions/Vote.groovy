package org.petitions

class Vote {

    static constraints = {
		rate min:0, max:100
		comments nullable:true, blank: true
    }
	
	String comments
	String ip;
	Request requst;
	Date createdOn = new Date();
	Byte rate = 100;
	String [] assumeAsFakeReasons;
}
