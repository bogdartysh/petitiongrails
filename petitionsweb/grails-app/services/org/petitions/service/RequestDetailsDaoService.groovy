package org.petitions.service

import grails.transaction.Transactional
import org.petitions.*

@Transactional
class RequestDetailsDaoService {
	def getPersistedRequestDetails(request) {
		def newRequestDetails = new RequestDetails(remoteAddr :  ("" + request.getHeader("X-Forwarded-For")  + request.getRemoteAddr()).encodeAsSHA256(),
		userAgent : ("" + request.getHeader("User-Agent")).encodeAsSHA256Bytes())
		def oldRequestDetails = RequestDetails.findAll{
			userAgent == newRequestDetails.userAgent && remoteAddr == newRequestDetails.remoteAddr
		}

		if (!oldRequestDetails) {
			newRequestDetails.save()
			return newRequestDetails
		}
		return oldRequestDetails.get(0)
	}
}
