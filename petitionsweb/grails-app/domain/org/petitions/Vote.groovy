package org.petitions

class Vote {

	static constraints = {
		rate min:0, max:100
		comments nullable:true, blank: true
		assumeAsFakeReasons nullable: true
		processedOn nullable:true
		remoteAddr nullable: true, blank:true
	}

	String comments
	String remoteAddr
	Petition petition;
	Date createdOn = new Date();
	Date processedOn
	Integer rate = 100;
	String [] assumeAsFakeReasons;
}
