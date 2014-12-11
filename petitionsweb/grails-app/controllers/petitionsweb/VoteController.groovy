package petitionsweb

import grails.converters.JSON

import org.petitions.*
import org.petitions.service.RequestDetailsDaoService;

import com.megatome.grails.RecaptchaService;

class VoteController {
	static defaultAction = "index"

	RequestDetailsDaoService requestDetailsDaoService

	RecaptchaService recaptchaService

	def index() {
		if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params) ) {
			params.put("validation", "petition.recaptcha.verification.failed")
			render "<p>Перевірте капчу</p>"
		}

		else{

			def petition = Petition.read(params.id)
			def votes = Vote.findAll{petition == petition}

			def vote = new Vote(petition: petition, requestDetails : requestDetailsDaoService.getPersistedRequestDetails(request))

			if ( votes.any{v -> v.requestDetails.remoteAddr == vote.requestDetails.remoteAddr &&  v.requestDetails.forwared == vote.requestDetails.forwared}) {
				render "<p>Схоже ви вже голосували (є запис про Ваш ПК)</p>"
			}
			else {
				vote.save()
				render "<p>Дякуємо, ваш голос враховано</p>"
			}
		}
	}

	def all() {
		render Vote.list() as JSON
	}

	def requests() {
		render RequestDetails.list() as JSON
	}
}
