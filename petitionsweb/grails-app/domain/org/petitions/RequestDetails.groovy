package org.petitions

class RequestDetails {

    static constraints = {
		forwared blank:true
		userAgent blank:true
		remoteAddr blank:true
    }
	
	static equalsProperties = ['xForwardedFor', 'userAgent', 'remoteAddr']
	static toString = ['id', 'xForwardedFor', 'userAgent', 'remoteAddr']
	
	String forwared
	String userAgent
	String remoteAddr
}
