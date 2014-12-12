package org.petitions.service

import grails.transaction.Transactional
import org.petitions.*

@Transactional
class RequestDetailsDaoService {
	def getPersistedRequestDetails(request) {
		RequestDetails.findOrSaveWhere(
				remoteAddr :  ("" + request.getHeader("X-Forwarded-For")  + request.getRemoteAddr()).encodeAsSHA256(),
				userAgent : ("" + request.getHeader("User-Agent")).encodeAsSHA256())
	}
}
