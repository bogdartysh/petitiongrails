package petitionsweb

import grails.converters.JSON

import org.petitions.*

class VoteController {
	static defaultAction = "index"
	def index() {
		def petition = Petition.get(params.id)
		def votes = Vote.findAll{petition == petition}

		def vote = new Vote(petition: petition)
		def requestDetails = RequestDetails.findAll{ userAgent == request.getHeader("User-Agent") && remoteAddr == request.getRemoteAddr() && forwared =="" + request.getHeader("X-Forwarded-For")}
		if (vote.requestDetails == null) {
			vote.requestDetails = new RequestDetails(forwared :  "" + request.getHeader("X-Forwarded-For"), userAgent : "" + request.getHeader("User-Agent"), remoteAddr : "" + request.getRemoteAddr())
			vote.requestDetails.save(flush:true, failOnError:true)
		} else {
			vote.requestDetails = requestDetails[0]
		}

		if ( vote.requestDetails.remoteAddr && votes.any{v -> v.requestDetails.remoteAddr == vote.requestDetails.remoteAddr}) {
			render "Схоже ви вже голосували (э запис про цей ip) "
		} else if (vote.requestDetails.forwared && votes.any{v -> v.requestDetails.forwared == vote.requestDetails.forwared}) {
			render "Схоже ви вже голосували (э запис про цей хост)"
		}
		else {
			vote.save(flush:true, failOnError:true)
			render "Дякуємо, ваш голос враховано"
		}
	}

	def all() {
		render Vote.list() as JSON
	}

	def requests() {
		render RequestDetails.list() as JSON
	}
}
