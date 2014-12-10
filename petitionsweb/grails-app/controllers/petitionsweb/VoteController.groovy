package petitionsweb

import grails.converters.JSON

import org.petitions.*
import org.petitions.service.RequestDetailsDaoService;

class VoteController {
	static defaultAction = "index"
	
	RequestDetailsDaoService requestDetailsDaoService
	
	def index() {
		def petition = Petition.read(params.id)
		def votes = Vote.findAll{petition == petition}

		def vote = new Vote(petition: petition, requestDetails : requestDetailsDaoService.getPersistedRequestDetails(request))

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
