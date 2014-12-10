package org.petitions

class Vote {

    static constraints = {
		rate min:0, max:100
		comments nullable:true, blank: true
    }
	
	String comments
	RequestDetails requestDetails
	Petition petition;
	Date createdOn = new Date();
	Integer rate = 100;
	String [] assumeAsFakeReasons;
}
