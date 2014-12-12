package org.petitions

class Vote {

	static constraints = {
		rate min:0, max:100
		comments nullable:true, blank: true
		assumeAsFakeReasons nullable: true
		processedOn nullable:true
	}

	String comments
	RequestDetails requestDetails
	Petition petition;
	Date createdOn = new Date();
	Date processedOn
	Integer rate = 100;
	String [] assumeAsFakeReasons;
}
