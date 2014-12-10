package org.petitions.service

import grails.transaction.Transactional
import org.petitions.*

@Transactional
class RequestDetailsDaoService {
	def getPersistedRequestDetails(request) {
		def oldRequestDetails = RequestDetails.findAll{ userAgent == request.getHeader("User-Agent") && remoteAddr == request.getRemoteAddr() && forwared =="" + request.getHeader("X-Forwarded-For")}
			
		if (!oldRequestDetails) {
			def newRequestDetails = new RequestDetails(forwared :  "" + request.getHeader("X-Forwarded-For"), userAgent : "" + request.getHeader("User-Agent"), remoteAddr : "" + request.getRemoteAddr())
			newRequestDetails.save()
			return newRequestDetails
		}
		return oldRequestDetails.get(0)
	}
}
